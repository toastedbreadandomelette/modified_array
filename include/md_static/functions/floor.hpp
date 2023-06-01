#pragma once
#ifndef _FLOOR_HPP_
#define _FLOOR_HPP_
#include <cmath>

#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<T> MdArrayUtility::floor(const MdStaticArray<T> &array) {
    return MdArrayUtility::map<T>(
        array, [](const T value) -> T { return ::floor(value); });
}

template <typename T>
MdStaticArray<T> MdArrayUtility::floor(
    const MdStaticArrayReference<T> &values) {
    return MdArrayUtility::floor<T>(MdStaticArray<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif