#pragma once
#ifndef _ARCSIN_HPP_
#define _ARCSIN_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::arcsin(const MdStaticArray<_T> &__values) {
    return MdArrayUtility::map<_T>(
        __values, [](const _T &__value) { return ::asin(__value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::arcsin(
    const MdStaticArrayReference<_T> &__values) {
    return MdArrayUtility::arcsin<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

#endif
