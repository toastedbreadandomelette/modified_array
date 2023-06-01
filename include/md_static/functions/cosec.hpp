#pragma once
#ifndef _COSEC_HPP_
#define _COSEC_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<T> MdArrayUtility::cosec(const MdStaticArray<T> &values) {
    return MdArrayUtility::map<T>(
        values, [](const T &value) { return 1 / ::sin(value); });
}

template <typename T>
MdStaticArray<T> MdArrayUtility::cosec(
    const MdStaticArrayReference<T> &values) {
    return MdArrayUtility::cosec<T>(MdStaticArray<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
