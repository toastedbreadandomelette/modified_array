#pragma once
#ifndef _MEAN_HPP_
#define _MEAN_HPP_
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<double> MdArrayUtility::mean(const MdStaticArray<T> &values,
                                           const T init, const i32 axis) {
    if (axis == -1) {
        return sum(values) / (values.get_size() * 1.0);
    }
    return sum(values, init, axis) / (values.get_shape()[axis] * 1.0);
}

template <typename T>
MdStaticArray<double> MdArrayUtility::mean(
    const MdStaticArrayReference<T> &values, const T init, const i32 axis) {
    return mean<T>(MdStaticArray<T>(*values.__array_reference, values.offset,
                                    values.shp_offset),
                   init, axis);
}

#endif
