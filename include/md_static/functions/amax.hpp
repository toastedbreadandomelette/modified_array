#pragma once
#ifndef _AMAX_HPP_
#define _AMAX_HPP_

#include "./md_static_array_utility.hpp"
#include "./reduce.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::amax(const MdStaticArray<_T> &__values,
                                       const int axis) {
    return reduce<_T>(
        __values,
        [](const _T &prev_value, const _T &curr_value) {
            return prev_value > curr_value ? prev_value : curr_value;
        },
        __values.get_size() > 0 ? __values.__array[0] : 1, axis);
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::amax(
    const MdStaticArrayReference<_T> &__values, const int axis) {
    return amax(MdStaticArray<_T>(*__values.__array_reference, __values.offset,
                                  __values.shp_offset),
                axis);
}

#endif
