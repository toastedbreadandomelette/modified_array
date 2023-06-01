#pragma once
#ifndef _FLOOR_HPP_
#define _FLOOR_HPP_
#include <cmath>

#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::floor(const MdStaticArray<_T> &__array) {
    return MdArrayUtility::map<_T>(
        __array, [](const _T value) -> _T { return ::floor(value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::floor(
    const MdStaticArrayReference<_T> &__values) {
    return MdArrayUtility::floor<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

#endif