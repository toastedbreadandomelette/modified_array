#pragma once
#ifndef _EXP2_HPP_
#define _EXP2_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<double> MdArrayUtility::exp2(const MdStaticArray<T> &values) {
    return MdArrayUtility::map<T>(
        values, [](const T &value) { return ::pow(2, value); });
}

template <typename T>
MdStaticArray<double> MdArrayUtility::exp2(
    const MdStaticArrayReference<T> &values) {
    return MdArrayUtility::exp2<T>(MdStaticArray<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
