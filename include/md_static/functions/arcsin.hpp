#pragma once
#ifndef _ARCSIN_HPP_
#define _ARCSIN_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<T> MdArrayUtility::arcsin(const MdStaticArray<T> &values) {
    return MdArrayUtility::map<T>(values,
                                  [](const T &value) { return ::asin(value); });
}

template <typename T>
MdStaticArray<T> MdArrayUtility::arcsin(
    const MdStaticArrayReference<T> &values) {
    return MdArrayUtility::arcsin<T>(MdStaticArray<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
