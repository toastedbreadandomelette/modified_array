#pragma once
#ifndef _AMAX_HPP_
#define _AMAX_HPP_

#include "./md_static_array_utility.hpp"
#include "./reduce.hpp"

template <typename T>
MdStaticArray<T> MdArrayUtility::amax(const MdStaticArray<T> &values,
                                      const int axis) {
    return reduce<T>(
        values,
        [](const T &prev_value, const T &curr_value) {
            return prev_value > curr_value ? prev_value : curr_value;
        },
        values.get_size() > 0 ? values.__array[0] : 1, axis);
}

template <typename T>
MdStaticArray<T> MdArrayUtility::amax(const MdStaticArrayReference<T> &values,
                                      const int axis) {
    return amax(MdStaticArray<T>(*values.__array_reference, values.offset,
                                 values.shp_offset),
                axis);
}

#endif
