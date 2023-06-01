#pragma once
#ifndef _CUMULATIVE_SUM_HPP_
#define _CUMULATIVE_SUM_HPP_
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<T> MdArrayUtility::cumulative_sum(
    const MdStaticArrayReference<T>& values, const size_t axis,
    const size_t thread_count) {
    return MdArrayUtility::cumulative_sum<T>(
        MdStaticArray<T>(*values.__array_reference, values.offset,
                         values.shp_offset),
        axis, thread_count);
}

template <typename T>
MdStaticArray<T> MdArrayUtility::cumulative_sum(const MdStaticArray<T>& ndarray,
                                                const size_t axis,
                                                const size_t thread_count) {
    if (axis == -1) {
        MdStaticArray<T> result(ndarray.get_size());

        result.__array[0] = ndarray.__array[0];

        // Multithreading will be inefficient for cumulative sum of array,
        // instead, use it when user provides axis.
        for (size_t index = 0; index < ndarray.get_size(); ++index) {
            result.__array[index] =
                result.__array[index - 1] + ndarray.__array[index];
        }
        return result;
    }

    if (axis >= ndarray.get_shape_size()) {
        throw std::runtime_error("Unknown axis " + std::to_string(axis) +
                                 " requested for cumulative sum.");
    }

    const size_t skip_value = ndarray.skip_vec[axis];

    const size_t looping_value = (axis - 1 <= ndarray.get_shape_size())
                                     ? ndarray.skip_vec[axis - 1]
                                     : ndarray.get_size();

    std::vector<size_t> resultant_shape;

    for (size_t index = 0; index < ndarray.get_shape_size(); ++index) {
        resultant_shape.emplace_back(ndarray.get_shape()[index]);
    }

    MdStaticArray<T> result(resultant_shape, 0);

    auto __perform_cu_sum_internal =
        [&ndarray, &result, skip_value, looping_value](
            const size_t thread_number, const size_t total_threads) {
            for (size_t index = thread_number * looping_value;
                 index < ndarray.get_size();
                 index += (total_threads * looping_value)) {
                for (size_t init_index = index; init_index < index + skip_value;
                     ++init_index) {
                    result.__array[init_index] = ndarray.__array[init_index];
                }

                for (size_t cu_index = index + skip_value;
                     cu_index < index + looping_value; ++cu_index) {
                    result.__array[cu_index] =
                        result.__array[cu_index - skip_value] +
                        ndarray.__array[cu_index];
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
