#pragma once
#ifndef _SIN_HPP_
#define _SIN_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<T> MdArrayUtility::sin(const MdStaticArray<T> &values) {
    return MdArrayUtility::map<T>(values,
                                  [](const T &value) { return ::sin(value); });
}

template <typename T>
MdStaticArray<T> MdArrayUtility::sin(const MdStaticArrayReference<T> &values) {
    return MdArrayUtility::sin<T>(MdStaticArray<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
