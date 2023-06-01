#pragma once
#ifndef _SUM_HPP_
#define _SUM_HPP_
#include "./md_static_array_utility.hpp"
#include "./reduce.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::sum(const MdStaticArray<_T> &__values,
                                      const _T init, const int axis) {
    return reduce(
        __values,
        [](const _T prev_value, const _T current_value) {
            return prev_value + current_value;
        },
        init, axis);
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::sum(
    const MdStaticArrayReference<_T> &__values, const _T init, const int axis) {
    return sum(MdStaticArray<_T>(*__values.__array_reference, __values.offset,
                                 __values.shp_offset),
               init, axis);
}

#endif
