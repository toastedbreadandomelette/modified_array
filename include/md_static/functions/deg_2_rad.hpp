#pragma once
#ifndef _DEG_2_RAD_HPP_
#define _DEG_2_RAD_HPP_
#include <cmath>

#define M_PI 3.14159265358979323846
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::deg_2_rad(
    const MdStaticArray<_T> &__ndarray) {
    return MdArrayUtility::map<_T>(
        __ndarray, [](const _T value) -> _T { return value * M_PI / 180.0; });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::deg_2_rad(
    const MdStaticArrayReference<_T> &__values) {
    return MdArrayUtility::deg_2_rad<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

#endif