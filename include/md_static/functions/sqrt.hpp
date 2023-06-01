#pragma once
#ifndef _SQRT_HPP_
#define _SQRT_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<T> MdArrayUtility::sqrt(const MdStaticArray<T> &values) {
    return MdArrayUtility::map<T>(values,
                                  [](const T &value) { return ::sqrt(value); });
}

template <typename T>
MdStaticArray<T> MdArrayUtility::sqrt(const MdStaticArrayReference<T> &values) {
    return MdArrayUtility::sqrt<T>(MdStaticArray<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
