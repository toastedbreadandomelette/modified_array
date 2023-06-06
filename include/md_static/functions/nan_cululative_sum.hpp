#pragma once
#ifndef _NAN_CUMULATIVE_SUM_HPP_
#define _NAN_CUMULATIVE_SUM_HPP_
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<T> MdArrayUtility::nan_cumulative_sum(
    const MdStaticArrayReference<T>& values, const usize axis,
    const usize thread_count) {
    return MdArrayUtility::nan_cumulative_sum<T>(
        MdStaticArray<T>(*values.__array_reference, values.offset,
                         values.shp_offset),
        axis, thread_count);
}

template <typename T>
MdStaticArray<T> MdArrayUtility::nan_cumulative_sum(
    const MdStaticArray<T>& ndarray, const usize axis,
    const usize thread_count) {
    if (axis == -1) {
        MdStaticArray<T> result(ndarray.get_size());

        result.__array[0] = !isnan(ndarray.__array[0]) ? ndarray.__array[0] : 1;

        // Multithreading will be inefficient for cumulative sum of array,
        // instead, use it when user provides axis.
        for (usize index = 0; index < ndarray.get_size(); ++index) {
            result.__array[index] =
                result.__array[index - 1] +
                (!isnan(ndarray.__array[index]) ? ndarray.__array[index] : 1);
        }
        return result;
    }

    if (axis >= ndarray.get_shape_size()) {
        throw std::runtime_error("Unknown axis " + std::to_string(axis) +
                                 " requested for cumulative sum.");
    }

    const usize skip_value = ndarray.skip_vec[axis];

    const usize looping_value = (axis - 1 <= ndarray.get_shape_size())
                                    ? ndarray.skip_vec[axis - 1]
                                    : ndarray.get_size();

    std::vector<usize> resultant_shape;

    for (usize index = 0; index < ndarray.get_shape_size(); ++index) {
        resultant_shape.emplace_back(ndarray.get_shape()[index]);
    }

    MdStaticArray<T> result(resultant_shape, 0);

    auto __perform_cu_sum_internal =
        [&ndarray, &result, skip_value, looping_value](
            const usize thread_number, const usize total_threads) {
            for (usize index = thread_number * looping_value;
                 index < ndarray.get_size();
                 index += (total_threads * looping_value)) {
                for (usize init_index = index; init_index < index + skip_value;
                     ++init_index) {
                    result.__array[init_index] =
                        (!isnan(ndarray.__array[init_index])
                             ? ndarray.__array[init_index]
                             : 1);
                }

                for (usize cu_index = index + skip_value;
                     cu_index < index + looping_value; ++cu_index) {
                    result.__array[cu_index] =
                        result.__array[index - 1] +
                        (!isnan(ndarray.__array[index]) ? ndarray.__array[index]
                                                        : 1);
                }
            }
        };

    if (s_threshold_size > result.get_size()) {
        __perform_cu_sum_internal(0, 1);
    } else {
        const usize total_threads = thread_count;
        std::vector<std::thread> thread_pool;

        for (usize index = 0; index < total_threads; ++index) {
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
