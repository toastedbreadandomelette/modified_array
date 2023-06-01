#pragma once
#ifndef _MEAN_HPP_
#define _MEAN_HPP_
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<double> MdArrayUtility::mean(const MdStaticArray<_T> &__values,
                                           const _T init, const int axis) {
    if (axis == -1) {
        return sum(__values) / (__values.get_size() * 1.0);
    }
    return sum(__values, init, axis) / (__values.get_shape()[axis] * 1.0);
}

template <typename _T>
MdStaticArray<double> MdArrayUtility::mean(
    const MdStaticArrayReference<_T> &__values, const _T init, const int axis) {
    return mean<_T>(MdStaticArray<_T>(*__values.__array_reference,
                                      __values.offset, __values.shp_offset),
                    init, axis);
}

#endif
