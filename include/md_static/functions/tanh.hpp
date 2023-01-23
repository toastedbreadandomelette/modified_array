#pragma once
#ifndef _TANH_HPP_
#define _TANH_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<double> MdArrayUtility::tanh(const MdStaticArray<_T> &__values) {
    return MdArrayUtility::map<_T>(
        __values, [](const _T &__value) { return ::tanh(__value); });
}

template <typename _T>
MdStaticArray<double> MdArrayUtility::tanh(
    const MdStaticArrayReference<_T> &__values) {
    return MdArrayUtility::tanh<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

#endif
