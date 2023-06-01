#pragma once
#ifndef _GCD_HPP_
#define _GCD_HPP_

#include "./md_static_array_utility.hpp"
#include "./reduce.hpp"

template <typename _T>
_T __gcd(_T a, _T b) {
    return b == 0 ? a : __gcd(b, a % b);
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::gcd(const MdStaticArray<_T> &__values,
                                      const int axis) {
    return reduce<_T>(
        __values,
        [](const _T &prev_value, const _T &curr_value) {
            return __gcd(prev_value, curr_value);
        },
        __values.get_size() > 0 ? __values.__array[0] : 1, axis);
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::gcd(
    const MdStaticArrayReference<_T> &__values, const int axis) {
    return gcd(MdStaticArray<_T>(*__values.__array_reference, __values.offset,
                                 __values.shp_offset),
               axis);
}

#endif
