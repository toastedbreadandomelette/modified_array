#pragma once
#ifndef _TANH_HPP_
#define _TANH_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<double> MdArrayUtility::tanh(const MdStaticArray<T> &values) {
    return MdArrayUtility::map<T>(
        values, [](const T &__value) { return ::tanh(__value); });
}

template <typename T>
MdStaticArray<double> MdArrayUtility::tanh(
    const MdStaticArrayReference<T> &values) {
    return MdArrayUtility::tanh<T>(MdStaticArray<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
