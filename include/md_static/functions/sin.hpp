#pragma once
#ifndef _SIN_HPP_
#define _SIN_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::sin(const MdStaticArray<_T> &__values) {
    return MdArrayUtility::map<_T>(
        __values, [](const _T &__value) { return ::sin(__value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::sin(
    const MdStaticArrayReference<_T> &__values) {
    return MdArrayUtility::sin<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

#endif
