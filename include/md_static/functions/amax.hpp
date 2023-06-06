#pragma once
#ifndef _AMAX_HPP_
#define _AMAX_HPP_

#include "./md_static_array_utility.hpp"
#include "./reduce.hpp"

template <typename T>
Array<T> MdArrayUtility::amax(const Array<T> &values,
                                      const i32 axis) {
    return reduce<T>(
        values,
        [](const T &prev_value, const T &curr_value) {
            return prev_value > curr_value ? prev_value : curr_value;
        },
        values.get_size() > 0 ? values.__array[0] : 1, axis);
}

template <typename T>
Array<T> MdArrayUtility::amax(const Reference<T> &values,
                                      const i32 axis) {
    return amax(Array<T>(*values.__array_reference, values.offset,
                                 values.shp_offset),
                axis);
}

#endif
