#pragma once
#ifndef _ABS_HPP_
#define _ABS_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<T> MdArrayUtility::abs(const MdStaticArray<T> &values) {
    return MdArrayUtility::map<T>(
        values, [](const T &value) { return std::abs(value); });
}

template <typename T>
MdStaticArray<T> MdArrayUtility::abs(const MdStaticArrayReference<T> &values) {
    return MdArrayUtility::abs<T>(MdStaticArray<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
