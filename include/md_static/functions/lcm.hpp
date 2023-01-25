#pragma once
#ifndef _LCM_HPP_
#define _LCM_HPP_

#include "./md_static_array_utility.hpp"
#include "./reduce.hpp"

template <typename _T>
_T __gcd2(_T a, _T b) {
    return b == 0 ? a : __gcd2(b, a % b);
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::lcm(const MdStaticArray<_T> &__values,
                                      const int axis) {
    return reduce<_T>(
        __values,
        [](const _T &prev_value, const _T &curr_value) {
            if (prev_value == 0 || curr_value == 0) {
                std::cout << prev_value << " " << curr_value << '\n';
                return prev_value == 0 ? prev_value : curr_value;
            }
            return (prev_value / __gcd2(prev_value, curr_value)) * curr_value;
        },
        1, axis);
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::lcm(
    const MdStaticArrayReference<_T> &__values, const int axis) {
    return lcm(MdStaticArray<_T>(*__values.__array_reference, __values.offset,
                                 __values.shp_offset),
               axis);
}

#endif
