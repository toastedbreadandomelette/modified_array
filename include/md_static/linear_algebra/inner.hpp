#pragma once
#ifndef _INNER_HPP_
#define _INNER_HPP_

#include "../functions/accumulate_and_merge.hpp"
#include "./md_linear_algebra.hpp"

template <typename T3, typename T1, typename T2>
Array<T3> Linalg::inner(const Array<T1> &first,
                                const Array<T2> &other,
                                const usize threads) {
    if (first.get_shape()[first.get_shape_size() - 1] !=
        other.get_shape()[other.get_shape_size() - 1]) {
        throw std::runtime_error(
            "Last axis should be of same size: found " +
            std::to_string(first.get_shape()[first.get_shape_size() - 1]) +
            " != " +
            std::to_string(other.get_shape()[other.get_shape_size() - 1]));
    }
    const usize overall_shape =
        first.get_shape_size() + other.get_shape_size() - 2;
    std::vector<usize> resultant_shape(overall_shape);

    usize result_shape_index = 0;
    for (usize index = 0; index < first.get_shape_size() - 1; ++index) {
        resultant_shape[result_shape_index++] = first.shape[index];
    }
    usize skip_number = 1;
    for (usize index = 0; index < other.get_shape_size() - 1; ++index) {
        resultant_shape[result_shape_index++] = other.shape[index];
        skip_number *= other.shape[index];
    }

    // do this separately.
    if (resultant_shape.size() == 0) {
        if (s_threshold_size < first.get_size()) {
            std::vector<T3> value(threads, 0);

            auto __perform_inner_internal = [&first, &other, &value](
                                                const usize thread_number,
                                                const usize start,
                                                const usize end) {
                for (usize i = start; i < end; ++i) {
                    value[thread_number] += first.__array[i] * other.__array[i];
                }
            };
            const usize blocks = first.get_size() / threads;
            std::vector<std::thread> thread_pool;
            for (usize index = 0; index < threads - 1; ++index) {
                thread_pool.emplace_back(std::thread(__perform_inner_internal,
                                                     index, blocks * index,
                                                     blocks * (index + 1)));
            }

            thread_pool.emplace_back(
                std::thread(__perform_inner_internal, threads - 1,
                            blocks * (threads - 1), first.get_size()));

            for (auto &thread : thread_pool) {
                thread.join();
            }

            T3 result = 0;
            for (auto &res_part : value) {
                result += res_part;
            }

            return Array<T3>(1, result);
        } else {
            T3 value = 0;
#pragma omp parallel for
            for (usize i = 0; i < other.get_size(); ++i) {
                value += first.__array[i] * other.__array[i];
            }

            return Array<T3>(1, value);
        }
    } else {
        Array<T3> result(resultant_shape, 0);

        const usize row = first.shape[first.get_shape_size() - 1];

        auto __perform_inner_internal =
            [&result, &first, &other, row, skip_number](
                const usize thread_number, const usize total_threads) {
                usize first_start = thread_number * row;
                usize index = thread_number * skip_number;  // result start
                for (usize i = first_start;
                     i < first.get_size() && index < result.get_size();
                     i += (total_threads * row)) {
                    for (usize j = 0;
                         j < other.get_size() && index < result.get_size();
                         j += row) {
                        for (usize k = 0; k < row; ++k) {
                            result.__array[index] +=
                                first.__array[i + k] * other.__array[j + k];
                        }
                        ++index;
                    }
                    index += ((total_threads - 1) * skip_number);
                }
            };

        std::vector<std::thread> thread_pool;
        for (usize index = 0; index < threads; ++index) {
            thread_pool.emplace_back(
                std::thread(__perform_inner_internal, index, threads));
        }

        for (auto &thread : thread_pool) {
            thread.join();
        }

        return result;
    }
}

template <typename T3, typename T1, typename T2>
Array<T3> Linalg::inner(const Reference<T1> &first,
                                const Array<T2> &other,
                                const usize threads) {
    return Linalg::inner<T3, T1, T2>(
        Array<T1>(*first.__array_reference, first.offset,
                          first.shp_offset),
        other, threads);
}

template <typename T3, typename T1, typename T2>
Array<T3> Linalg::inner(const Reference<T1> &first,
                                const Reference<T2> &other,
                                const usize threads) {
    return Linalg::inner<T3, T1, T2>(
        Array<T1>(*first.__array_reference, first.offset,
                          first.shp_offset),
        Array<T1>(*other.__array_reference, other.offset,
                          other.shp_offset),
        threads);
}

template <typename T3, typename T1, typename T2>
Array<T3> Linalg::inner(const Array<T1> &first,
                                const Reference<T2> &other,
                                const usize threads) {
    return Linalg::inner<T3, T1, T2>(
        first,
        Array<T1>(*other.__array_reference, other.offset,
                          other.shp_offset),
        threads);
}

#endif
