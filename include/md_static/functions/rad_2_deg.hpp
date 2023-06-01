#pragma once
#ifndef _RAD_2_DEG_HPP_
#define _RAD_2_DEG_HPP_
#include <cmath>

#define M_PI 3.14159265358979323846
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::rad_2_deg(
    const MdStaticArray<_T> &__ndarray) {
    return MdArrayUtility::map<_T>(
        __ndarray, [](const _T value) -> _T { return value * 180.0 / M_PI; });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::rad_2_deg(
    const MdStaticArrayReference<_T> &__values) {
    return MdArrayUtility::rad_2_deg<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

#endif