#pragma once
#ifndef _INNER_HPP_
#define _INNER_HPP_

#include "../functions/accumulate_and_merge.hpp"
#include "./md_linear_algebra.hpp"

template <typename _T1, typename _T2, typename _T3>
MdStaticArray<_T3> MdLinearAlgebra::inner(const MdStaticArray<_T1> &__first,
                                          const MdStaticArray<_T2> &__other,
                                          const size_t threads) {
    if (__first.get_shape()[__first.get_shape_size() - 1] !=
        __other.get_shape()[__other.get_shape_size() - 1]) {
        throw std::runtime_error(
            "Last axis should be of same size: found " +
            std::to_string(__first.get_shape()[__first.get_shape_size() - 1]) +
            " != " +
            std::to_string(__other.get_shape()[__other.get_shape_size() - 1]));
    }
    const size_t overall_shape =
        __first.get_shape_size() + __other.get_shape_size() - 2;
    std::vector<size_t> resultant_shape(overall_shape);

    size_t result_shape_index = 0;
    for (size_t index = 0; index < __first.get_shape_size() - 1; ++index) {
        resultant_shape[result_shape_index++] = __first.shape[index];
    }
    size_t skip_number = 1;
    for (size_t index = 0; index < __other.get_shape_size() - 1; ++index) {
        resultant_shape[result_shape_index++] = __other.shape[index];
        skip_number *= __other.shape[index];
    }

    // do this separately.
    if (resultant_shape.size() == 0) {
        std::vector<_T3> value(threads, 0);

        auto __perform_inner_internal = [&__first, &__other, &value](
                                            const size_t thread_number,
                                            const size_t start,
                                            const size_t end) {
            for (size_t i = start; i < end; ++i) {
                value[thread_number] += __first.__array[i] * __other.__array[i];
            }
        };
        const size_t blocks = __first.get_size() / threads;
        std::vector<std::thread> thread_pool;
        for (size_t index = 0; index < threads - 1; ++index) {
            thread_pool.emplace_back(std::thread(__perform_inner_internal,
                                                 index, blocks * index,
                                                 blocks * (index + 1)));
        }

        thread_pool.emplace_back(
            std::thread(__perform_inner_internal, threads - 1,
                        blocks * (threads - 1), __first.get_size()));

        for (auto &thread : thread_pool) {
            thread.join();
        }

        _T3 result = 0;
        for (auto &res_part : value) {
            result += res_part;
        }

        return MdStaticArray<_T3>(1, result);

    } else {
        MdStaticArray<_T3> result(resultant_shape, 0);

        const size_t row = __first.shape[__first.get_shape_size() - 1];

        auto __perform_inner_internal =
            [&result, &__first, &__other, row, skip_number](
                const size_t thread_number, const size_t total_threads) {
                size_t first_start = thread_number * row;
                size_t index = thread_number * skip_number;  // result start
                for (size_t i = first_start;
                     i < __first.get_size() && index < result.get_size();
                     i += (total_threads * row)) {
                    for (size_t j = 0;
                         j < __other.get_size() && index < result.get_size();
                         j += row) {
                        for (size_t k = 0; k < row; ++k) {
                            result.__array[index] +=
                                __first.__array[i + k] * __other.__array[j + k];
                        }
                        ++index;
                    }
                    index += ((total_threads - 1) * skip_number);
                }
            };

        std::vector<std::thread> thread_pool;
        for (size_t index = 0; index < threads; ++index) {
            thread_pool.emplace_back(
                std::thread(__perform_inner_internal, index, threads));
        }

        for (auto &thread : thread_pool) {
            thread.join();
        }

        return result;
    }
}

template <typename _T1, typename _T2, typename _T3>
MdStaticArray<_T3> MdLinearAlgebra::inner(
    const typename MdStaticArray<_T1>::reference &__first,
    const MdStaticArray<_T2> &__other, const size_t threads) {
    return MdLinearAlgebra::inner<_T1, _T2, _T3>(
        MdStaticArray<_T1>(*__first.__array_reference, __first.offset,
                           __first.shp_offset),
        __other, threads);
}

template <typename _T1, typename _T2, typename _T3>
MdStaticArray<_T3> MdLinearAlgebra::inner(
    const typename MdStaticArray<_T1>::reference &__first,
    const typename MdStaticArray<_T2>::reference &__other,
    const size_t threads) {
    return MdLinearAlgebra::inner<_T1, _T2, _T3>(
        MdStaticArray<_T1>(*__first.__array_reference, __first.offset,
                           __first.shp_offset),
        MdStaticArray<_T1>(*__other.__array_reference, __other.offset,
                           __other.shp_offset),
        threads);
}

template <typename _T1, typename _T2, typename _T3>
MdStaticArray<_T3> MdLinearAlgebra::inner(
    const MdStaticArray<_T1> &__first,
    const typename MdStaticArray<_T2>::reference &__other,
    const size_t threads) {
    return MdLinearAlgebra::inner<_T1, _T2, _T3>(
        __first,
        MdStaticArray<_T1>(*__other.__array_reference, __other.offset,
                           __other.shp_offset),
        threads);
}

#endif
