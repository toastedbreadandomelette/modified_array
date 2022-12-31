#pragma once
#ifndef _MD_STATIC_MAT_UTILITY_HPP_
#define _MD_STATIC_MAT_UTILITY_HPP_

#include "md_static_array.hpp"
#include "md_static_utility.hpp"

template <typename _T1, typename _T2, typename _T3>
MdStaticArray<_T3> MdUtility::dot(const MdStaticArray<_T1> &__first,
                                  const MdStaticArray<_T2> &__other,
                                  const size_t thread_count) {
    // Basically, compute dot product of vector:::
    // Last axis of vector __first should be multiplied with second last
    // axis of __other
    if (__other.get_shape_size() >= 2 && __first.get_shape_size() >= 2) {
        if (__other.get_shape_size() == 2 && __first.get_shape_size() == 2) {
            return MdUtility::multiply<_T1, _T2, _T3>(__first, __other,
                                                      thread_count);
        }
        if (__first.shape[__first.shp_size - 1] !=
            __other.shape[__other.shp_size - 2]) {
            throw std::runtime_error(
                "Axis count do not match for dot multiplication.");
        }
        const size_t overall_size =
            __first.get_shape_size() - 2 + __other.get_shape_size();

        std::vector<size_t> overall_shape(overall_size);
        size_t index = 0;
        for (int i = 0; i < __first.get_shape_size() - 1; ++i) {
            overall_shape[index++] = __first.shape[i];
        }

        for (int i = 0; i < __other.get_shape_size(); ++i) {
            if (i != __first.get_shape_size() - 2) {
                overall_shape[index++] = __other.shape[i];
            }
        }

        MdStaticArray<_T3> result(overall_shape, 0);
        const size_t res_base_matrix_size = (result.shape[result.shp_size - 1] *
                                             result.shape[result.shp_size - 2]);

        const size_t res_loop_times = result.get_size() / res_base_matrix_size;

        const size_t m = __first.shape[__first.shp_size - 2];
        const size_t n = __first.shape[__first.shp_size - 1];
        const size_t p = __other.shape[__other.shp_size - 1];

        assert(m == __first.shape[__first.shp_size - 2] &&
               n == __first.shape[__first.shp_size - 1]);

        assert(n == __other.shape[__other.shp_size - 2] &&
               p == __other.shape[__other.shp_size - 1]);

        const size_t other_base_matrix_size = n * p;

        index = 0;
        uint16_t threads = thread_count;
        size_t skip_count = __other.get_size() / n;

        auto __perform_dot_parallel = [&result, &__first, &__other, m, n, p,
                                       threads, other_base_matrix_size,
                                       skip_count](const size_t thread_number) {
            size_t index = thread_number * skip_count;
            for (size_t first_row = thread_number * n;
                 first_row < __first.get_size(); first_row += (threads * n)) {
                for (size_t other_block = 0; other_block < __other.get_size();
                     other_block += other_base_matrix_size) {
                    for (size_t j = 0; j < n; ++j) {
                        for (size_t other_col = 0; other_col < p; ++other_col) {
                            result.__array[index + other_col] +=
                                __first.__array[first_row + j] *
                                __other
                                    .__array[other_block + j * p + other_col];
                        };
                    }
                    index += n;
                }
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
    }
}

template <typename _T>
MdStaticArray<_T> MdUtility::identity(size_t n) {
    MdStaticArray<_T> result({n, n}, 0);
    for (size_t index = 0; index < result.get_size(); index += (n + 1)) {
        result.__array[index] = 1;
    }

    return result;
}

template <typename _T>
bool MdUtility::is_identity(const MdStaticArray<_T> &__other) {
    if (__other.shp_size != 2 || __other.shape[0] != __other.shape[1]) {
        return false;
    }
    size_t _n = __other.shape[0];

    for (size_t index = 0; index < __other.get_size(); ++index) {
        if (__other.__array[index] > 1 || __other.__array[index] < 0) {
            return false;
        }
        if (__other.__array[index] && (index % (_n + 1) != 0)) {
            return false;
        }
        if (!__other.__array[index] && (index % (_n + 1) == 0)) {
            return false;
        }
    }

    return true;
}

template <typename _T1, typename _T2, typename _T3>
MdStaticArray<_T3> MdUtility::multiply(const MdStaticArray<_T1> &__first,
                                       const MdStaticArray<_T2> &__other,
                                       const size_t threads) {
    if (__first.shp_size != 2 || __other.shp_size != 2) {
        throw std::runtime_error("Matrix dimension do not match.");
    }

    if (__first.shape[1] != __other.shape[0]) {
        throw std::runtime_error(
            "Total column of first matrix are not same as total rows in "
            "second "
            "matrix.");
    }

    MdStaticArray<_T3> result({__first.shape[0], __other.shape[1]}, 0);
    // To do: reduce extra memory usage here.
    size_t sz = result.get_size();
    _T3 **res_ptr = new _T3 *[__first.shape[0]];
    _T1 **first_ptr = new _T1 *[__first.shape[0]];
    _T2 **other_ptr = new _T2 *[__other.shape[0]];
    for (size_t index = 0, rindex = 0; index < result.get_size();
         index += __other.shape[1], ++rindex) {
        res_ptr[rindex] = &result.__array[index];
    }

    for (size_t index = 0, rindex = 0; index < __first.get_size();
         index += __first.shape[1], ++rindex) {
        first_ptr[rindex] = &__first.__array[index];
    }

    for (size_t index = 0, rindex = 0; index < __other.get_size();
         index += __other.shape[1], ++rindex) {
        other_ptr[rindex] = &__other.__array[index];
    }

    /// This loop is kept outside due to performance reasons.
    /// Split i or j into blocks
    size_t block_size = 64;

    auto __multiply_internal = [&res_ptr, &first_ptr, &other_ptr, &__first,
                                &__other, block_size](const size_t start,
                                                      const size_t end) {
        for (size_t k_block = start; k_block < __first.shape[1];
             k_block += block_size) {
            const size_t k_bound =
                std::min(k_block + block_size, __first.shape[1]);
            for (size_t i_block = start; i_block < end; i_block += block_size) {
                const size_t i_bound = std::min(i_block + block_size, end);
                for (size_t i = i_block; i < i_bound; ++i) {
                    for (size_t k = k_block; k < k_bound; ++k) {
                        const auto c = first_ptr[i][k];
                        for (size_t j = 0; j < __other.shape[1]; ++j) {
                            res_ptr[i][j] += c * other_ptr[k][j];
                        }
                    }
                }
            }
        }
    };

    size_t blocks = __first.shape[0] / threads;
    std::vector<std::thread> thread_pool;
    for (int i = 0; i < threads - 1; ++i) {
        thread_pool.emplace_back(
            std::thread(__multiply_internal, blocks * i, blocks * (i + 1)));
    }

    thread_pool.emplace_back(std::thread(
        __multiply_internal, blocks * (threads - 1), __first.shape[0]));

    for (auto &thread : thread_pool) {
        thread.join();
    }

    return result;
}

template <typename _T1, typename _T2>
MdStaticArray<_T2> MdUtility::transpose(const MdStaticArray<_T1> &__first) {
    if (__first.get_shape_size() != 2) {
        throw std::runtime_error("Matrix Error: Expected dimension 2.");
    }
    MdStaticArray<_T2> result({__first.shape[1], __first.shape[0]}, 0);

    for (size_t res_index = 0; res_index < __first.shape[1]; ++res_index) {
        for (size_t f_index = res_index, incr = 0; f_index < __first.get_size();
             f_index += __first.shape[1], ++incr) {
            result.__array[res_index * __first.shape[0] + incr] =
                __first.__array[f_index];
        }
    }

    return result;
}

#endif
