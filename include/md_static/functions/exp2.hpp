#pragma once
#ifndef _EXP2_HPP_
#define _EXP2_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<double> MdArrayUtility::exp2(const MdStaticArray<_T> &__values) {
    return MdArrayUtility::map<_T>(
        __values, [](const _T &value) { return ::pow(2, value); });
}

template <typename _T>
MdStaticArray<double> MdArrayUtility::exp2(
    const MdStaticArrayReference<_T> &__values) {
    return MdArrayUtility::exp2<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

#endif
