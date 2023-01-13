#pragma once
#ifndef _CUMULATIVE_SUM_HPP_
#define _CUMULATIVE_SUM_HPP_
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::cumulative_sum(
    const typename MdStaticArray<_T>::reference& __values) {
    return MdArrayUtility::cumulative_sum<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::cumulative_sum(
    const MdStaticArray<_T>& __ndarray, const size_t axis) {
    if (axis == -1) {
        MdStaticArray<_T> result(__ndarray.get_size());

        result.__array[0] = __ndarray.__array[0];

        // Multithreading will be inefficient for cumulative sum of array,
        // instead, use it when user provides axis.
        for (size_t index = 0; index < __ndarray.get_size(); ++index) {
            result.__array[index] =
                result.__array[index - 1] + __ndarray.__array[index];
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

    for (size_t index = 0; index < __ndarray.get_size();
         index += looping_value) {
        for (size_t init_index = index; init_index < index + skip_value;
             ++init_index) {
            result.__array[init_index] = __ndarray.__array[init_index];
        }

        for (size_t cu_index = index + skip_value;
             cu_index < index + looping_value; ++cu_index) {
            result.__array[cu_index] = result.__array[cu_index - skip_value] +
                                       __ndarray.__array[cu_index];
        }
    }

    return result;
}

#endif
