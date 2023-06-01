#pragma once
#ifndef _COS_HPP_
#define _COS_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::cos(const MdStaticArray<_T> &__values) {
    return MdArrayUtility::map<_T>(
        __values, [](const _T &__value) { return ::cos(__value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::cos(
    const MdStaticArrayReference<_T> &__values) {
    return MdArrayUtility::cos<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

#endif
