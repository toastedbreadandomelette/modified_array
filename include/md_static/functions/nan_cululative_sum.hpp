#pragma once
#ifndef _NAN_CUMULATIVE_SUM_HPP_
#define _NAN_CUMULATIVE_SUM_HPP_
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::nan_cumulative_sum(
    const typename MdStaticArray<_T>::reference& __values, const size_t axis,
    const size_t thread_count) {
    return MdArrayUtility::nan_cumulative_sum<_T>(
        MdStaticArray<_T>(*__values.__array_reference, __values.offset,
                          __values.shp_offset),
        axis, thread_count);
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::nan_cumulative_sum(
    const MdStaticArray<_T>& __ndarray, const size_t axis,
    const size_t thread_count) {
    if (axis == -1) {
        MdStaticArray<_T> result(__ndarray.get_size());

        result.__array[0] =
            !isnan(__ndarray.__array[0]) ? __ndarray.__array[0] : 1;

        // Multithreading will be inefficient for cumulative sum of array,
        // instead, use it when user provides axis.
        for (size_t index = 0; index < __ndarray.get_size(); ++index) {
            result.__array[index] =
                result.__array[index - 1] + (!isnan(__ndarray.__array[index])
                                                 ? __ndarray.__array[index]
                                                 : 1);
        }
        return result;
    }

    if (0 > axis || axis >= __ndarray.get_shape_size()) {
        throw std::runtime_error("Unknown axis " + std::to_string(axis) +
                                 " requested for cumulative sum.");
    }

    const size_t skip_value =
        __ndarray.skip_vec[__ndarray.get_shape_size() - 1 - axis];

    const size_t looping_value =
        (__ndarray.get_shape_size() - 2 - axis <= __ndarray.get_shape_size())
            ? __ndarray.skip_vec[__ndarray.get_shape_size() - 2 - axis]
            : __ndarray.get_size();

    std::vector<size_t> resultant_shape;

    for (size_t index = 0; index < __ndarray.get_shape_size(); ++index) {
        resultant_shape.emplace_back(__ndarray.get_shape()[index]);
    }

    MdStaticArray<_T> result(resultant_shape, 0);

    auto __perform_cu_sum_internal =
        [&__ndarray, &result, skip_value, looping_value](
            const size_t thread_number, const size_t total_threads) {
            for (size_t index = thread_number * looping_value;
                 index < __ndarray.get_size();
                 index += (total_threads * looping_value)) {
                for (size_t init_index = index; init_index < index + skip_value;
                     ++init_index) {
                    result.__array[init_index] =
                        (!isnan(__ndarray.__array[init_index])
                             ? __ndarray.__array[init_index]
                             : 1);
                }

                for (size_t cu_index = index + skip_value;
                     cu_index < index + looping_value; ++cu_index) {
                    result.__array[cu_index] = result.__array[index - 1] +
                                               (!isnan(__ndarray.__array[index])
                                                    ? __ndarray.__array[index]
                                                    : 1);
                }
            }
        };

    if (s_threshold_size > result.get_size()) {
        __perform_cu_sum_internal(0, 1);
    } else {
        const size_t total_threads = thread_count;
        std::vector<std::thread> thread_pool;

        for (size_t index = 0; index < total_threads; ++index) {
            thread_pool.emplace_back(
                std::thread(__perform_cu_sum_internal, index, total_threads));
        }

        for (auto& thread : thread_pool) {
            thread.join();
        }
    }

    return result;
}

#endif
