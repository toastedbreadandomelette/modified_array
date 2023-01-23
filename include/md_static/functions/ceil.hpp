#pragma once
#ifndef _CEIL_HPP_
#define _CEIL_HPP_
#include <cmath>

#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::ceil(const MdStaticArray<_T> &__ndarray) {
    return MdArrayUtility::map<_T>(
        __ndarray, [](const _T value) -> _T { return ::ceil(value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::ceil(
    const MdStaticArrayReference<_T> &__values) {
    return MdArrayUtility::ceil<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

#endif