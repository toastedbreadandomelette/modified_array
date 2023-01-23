#pragma once
#ifndef _RECIPROCAL_HPP_
#define _RECIPROCAL_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<double> MdArrayUtility::reciprocal(
    const MdStaticArray<_T> &__values) {
    return MdArrayUtility::map<_T>(
        __values, [](const _T &__value) { return 1 / (__value * 1.0); });
}

template <typename _T>
MdStaticArray<double> MdArrayUtility::reciprocal(
    const MdStaticArrayReference<_T> &__values) {
    return MdArrayUtility::sec<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

#endif
