#pragma once
#ifndef _CEIL_HPP_
#define _CEIL_HPP_
#include <cmath>

#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<T> MdArrayUtility::ceil(const MdStaticArray<T> &ndarray) {
    return MdArrayUtility::map<T>(
        ndarray, [](const T value) -> T { return ::ceil(value); });
}

template <typename T>
MdStaticArray<T> MdArrayUtility::ceil(const MdStaticArrayReference<T> &values) {
    return MdArrayUtility::ceil<T>(MdStaticArray<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif