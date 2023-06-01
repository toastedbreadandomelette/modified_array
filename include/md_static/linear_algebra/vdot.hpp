#pragma once
#ifndef _VDOT_HPP_
#define _VDOT_HPP_

#include "../../md_complex/md_complex.hpp"
#include "../functions/map.hpp"
#include "./md_linear_algebra.hpp"

template <typename T3, typename T1, typename T2>
MdStaticArray<T3> Linalg::vdot(const MdStaticArray<T1> &__first,
                                        const MdStaticArray<T2> &__other,
                                        const size_t threads) {
    return Linalg::dot<T3>(__first, __other, threads);
}

template <typename T3, typename T1, typename T2>
MdStaticArray<T3> Linalg::vdot(
    const MdStaticArrayReference<T1> &__first, const MdStaticArray<T2> &__other,
    const size_t threads) {
    return Linalg::dot<T3>(__first, __other, threads);
}

template <typename T3, typename T1, typename T2>
MdStaticArray<T3> Linalg::vdot(
    const MdStaticArrayReference<T1> &__first,
    const MdStaticArrayReference<T2> &__other, const size_t threads) {
    return Linalg::dot<T3>(__first, __other, threads);
}

template <typename T3, typename T1, typename T2>
MdStaticArray<T3> Linalg::vdot(
    const MdStaticArray<T1> &__first, const MdStaticArrayReference<T2> &__other,
    const size_t threads) {
    return Linalg::dot<T3>(__first, __other, threads);
}

///////////////////////////////////////////////////////////////////////////////

template <typename T3, typename T1, typename T2>
MdStaticArray<T3> Linalg::vdot(
    const MdStaticArray<Complex<T1>> &__first, const MdStaticArray<T2> &__other,
    const size_t threads) {
    // Basically, compute dot product of vector:::
    // Last axis of vector __first should be multiplied with second last
    // axis of __other
    if (__other.get_shape_size() >= 2 && __first.get_shape_size() >= 2) {
        if (__other.get_shape_size() == 2 && __first.get_shape_size() == 2) {
            return Linalg::mat_multiply<T3, Complex<T1>, T2>(
                MdArrayUtility::map<Complex<T1>>(
                    __first,
                    [](const Complex<T1> &__value) {
                        return Complex<T1>::conj(__value);
                    }),
                __other, threads);
        }
        if (__first.shape[__first.shp_size - 1] !=
            __other.shape[__other.shp_size - 2]) {
            throw std::runtime_error(
                "Axis size do not match for dot multiplication.");
        }
        const size_t overall_size =
            __first.get_shape_size() - 2 + __other.get_shape_size();

        std::vector<size_t> overall_shape(overall_size);
        size_t index = 0;
        for (size_t i = 0; i < __first.get_shape_size() - 1; ++i) {
            overall_shape[index++] = __first.shape[i];
        }

        for (size_t i = 0; i < __other.get_shape_size(); ++i) {
            if (i != __other.get_shape_size() - 2) {
                overall_shape[index++] = __other.shape[i];
            }
        }

        MdStaticArray<T3> result(overall_shape, 0);
        const size_t res_base_matrix_size = (result.shape[result.shp_size - 1] *
                                             result.shape[result.shp_size - 2]);

        const size_t m = __first.shape[__first.shp_size - 2];
        const size_t n = __first.shape[__first.shp_size - 1];
        const size_t p = __other.shape[__other.shp_size - 1];

        const size_t other_base_matrix_size = n * p;

        index = 0;
        size_t skip_count = __other.get_size() / n;

        auto __perform_dot_parallel = [&result, &__first, &__other, m, n, p,
                                       threads, other_base_matrix_size,
                                       skip_count](const size_t thread_number) {
            // We iterate over each row of __first ndarray. Each $i^{th}$ thread
            // will handle alternate $i^{th}$ row.
            size_t index = thread_number * skip_count;
            for (size_t first_row = thread_number * n;
                 first_row < __first.get_size(); first_row += (threads * n)) {
                // Considering a 2D - layer of n-dimensional array $__other$, we
                // iterate over every 2D-layer.
                for (size_t other_block = 0; other_block < __other.get_size();
                     other_block += other_base_matrix_size) {
                    const auto f = __other.__array[other_block];
                    // Iterator over second row of __first and column of __other
                    // array (note that $j$ and $other_col$ loop are swapped for
                    // performance reasons, to fulfil offset, we add $other_col$
                    // to $index$ in result array)
                    for (size_t j = 0; j < n; ++j) {
                        const auto c =
                            Complex<T1>::conj(__first.__array[first_row + j]);
                        // Iterator over last axis of __other.
                        for (size_t other_col = 0; other_col < p; ++other_col) {
                            result.__array[index + other_col] +=
                                c *
                                __other
                                    .__array[other_block + j * p + other_col];
                        }
                    }
                    // Index is skipped by p, because the row is processed for
                    // every column
                    index += p;
                }
                // Since we use threads, we let other threads fill remaining
                // (threads - 1) rows and skip to next ones
                index += ((threads - 1) * skip_count);
            }
        };
        std::vector<std::thread> thread_pool;
        for (int i = 0; i < threads; ++i) {
            thread_pool.emplace_back(std::thread(__perform_dot_parallel, i));
        }

        for (auto &thread : thread_pool) {
            thread.join();
        }

        return result;
    } else {
        if (__other.get_shape_size() == 1 && __first.get_shape_size() == 1) {
            if (__other.shape[0] != __first.shape[0]) {
                throw std::runtime_error(
                    "Axis size do not match for dot multiplication.");
            }

            // A single valued answer.
            return Linalg::inner<T3, Complex<T1>, T2>(
                MdArrayUtility::map<Complex<T1>>(
                    __first,
                    [](const Complex<T1> &__value) {
                        return Complex<T1>::conj(__value);
                    }),
                __other, threads);
        } else if (__other.get_shape_size() == 1) {
            // Note: first does have $n$ dimensions
            if (__other.shape[0] !=
                __first.shape[__first.get_shape_size() - 1]) {
                throw std::runtime_error(
                    "Axis size do not match for dot multiplication.");
            }

            std::vector<size_t> overall_shape(__first.get_shape_size() - 1);
            for (size_t index = 0; index < __first.get_shape_size() - 1;
                 ++index) {
                overall_shape[index] = __first.shape[index];
            }
            MdStaticArray<T3> result(overall_shape, 0);

            auto __perform_dot_parallel = [&__first, &__other, &result](
                                              const size_t start,
                                              const size_t end) {
                size_t res_index = start;
                size_t shp = __first.get_shape_size() - 1;
                // For each last axis of __first array
                for (size_t index = start * __first.shape[shp];
                     index < end * __first.shape[shp];
                     index += __first.shape[shp]) {
                    // Iterate over the last axis of array __other
                    for (size_t row = 0; row < __other.shape[0]; ++row) {
                        result.__array[res_index] +=
                            (Complex<T1>::conj(__first.__array[index + row]) *
                             __other.__array[row]);
                    }
                    ++res_index;
                }
            };

            const size_t block = result.get_size() / threads - 1;
            std::vector<std::thread> thread_pool;
            for (int i = 0; i < threads - 1; ++i) {
                thread_pool.emplace_back(std::thread(
                    __perform_dot_parallel, block * i, block * (i + 1)));
            }
            thread_pool.emplace_back(std::thread(__perform_dot_parallel,
                                                 block * (threads - 1),
                                                 result.get_size()));

            for (auto &thread : thread_pool) {
                thread.join();
            }
            return result;
        } else {
            if (__other.shape[__other.get_shape_size() - 2] !=
                __first.shape[0]) {
                throw std::runtime_error(
                    "Axis size do not match for dot multiplication.");
            }

            std::vector<size_t> overall_shape(__other.get_shape_size() - 1);
            size_t shp_index = 0;
            for (size_t index = 0; index < __other.get_shape_size(); ++index) {
                if (index != __other.get_shape_size() - 2) {
                    overall_shape[shp_index++] = __other.shape[index];
                }
            }
            MdStaticArray<T3> result(overall_shape, 0);

            auto __perform_dot_parallel =
                [&__first, &__other, &result,
                 &threads](const size_t thread_number) {
                    size_t shp = __other.get_shape_size() - 2;
                    size_t res_index = thread_number * __other.shape[shp + 1];
                    size_t rows = __first.get_size();
                    size_t other_mat_size =
                        __other.shape[shp] * __other.shape[shp + 1];
                    // Traversing through each layer of matrix of __other
                    for (size_t other_mat_index = 0;
                         other_mat_index < __other.get_size();
                         other_mat_index += (threads * other_mat_size)) {
                        // For each layer, calculate dot-product
                        // Each element will be
                        for (size_t element = 0; element < other_mat_size;
                             ++element) {
                            result.__array[res_index + (element % rows)] +=
                                Complex<T1>::conj(
                                    __first.__array[element /
                                                    __other.shape[shp + 1]]) *
                                __other.__array[other_mat_index + element];
                        }
                        res_index += (threads * __other.shape[shp + 1]);
                    }
                };

            std::vector<std::thread> thread_pool;
            for (size_t i = 0; i < threads; ++i) {
                thread_pool.emplace_back(
                    std::thread(__perform_dot_parallel, i));
            }

            for (auto &thread : thread_pool) {
                thread.join();
            }
            return result;
        }
    }
}

template <typename T3, typename T1, typename T2>
MdStaticArray<T3> Linalg::vdot(
    const MdStaticArrayReference<Complex<T1>> &__first,
    const MdStaticArray<T2> &__other, const size_t threads) {
    return Linalg::vdot<T3>(
        MdStaticArray(*__first.__array_reference, __first.offset,
                      __first.shp_offset),
        __other, threads);
}

template <typename T3, typename T1, typename T2>
MdStaticArray<T3> Linalg::vdot(
    const MdStaticArrayReference<Complex<T1>> &__first,
    const MdStaticArrayReference<T2> &__other, const size_t threads) {
    return Linalg::vdot<T3>(
        MdStaticArray(*__first.__array_reference, __first.offset,
                      __first.shp_offset),
        MdStaticArray(*__other.__array_reference, __other.offset,
                      __other.shp_offset),
        threads);
}

template <typename T3, typename T1, typename T2>
MdStaticArray<T3> Linalg::vdot(
    const MdStaticArray<Complex<T1>> &__first,
    const MdStaticArrayReference<T2> &__other, const size_t threads) {
    return Linalg::vdot<T3>(
        __first,
        MdStaticArray(*__other.__array_reference, __other.offset,
                      __other.shp_offset),
        threads);
}

#endif
