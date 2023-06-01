#pragma once
#ifndef _RECIPROCAL_HPP_
#define _RECIPROCAL_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<double> MdArrayUtility::reciprocal(
    const MdStaticArray<T> &values) {
    return MdArrayUtility::map<T>(
        values, [](const T &value) { return 1 / (value * 1.0); });
}

template <typename T>
MdStaticArray<double> MdArrayUtility::reciprocal(
    const MdStaticArrayReference<T> &values) {
    return MdArrayUtility::sec<T>(MdStaticArray<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
