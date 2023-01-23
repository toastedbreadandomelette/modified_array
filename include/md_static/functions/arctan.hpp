#pragma once
#ifndef _ARCTAN_HPP_
#define _ARCTAN_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::arctan(const MdStaticArray<_T> &__values) {
    return MdArrayUtility::map<_T>(
        __values, [](const _T &__value) -> _T { return ::atan(__value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::arctan(
    const MdStaticArrayReference<_T> &__values) {
    return MdArrayUtility::arctan<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

#endif
