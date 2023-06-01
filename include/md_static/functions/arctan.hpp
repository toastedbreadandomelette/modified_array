#pragma once
#ifndef _ARCTAN_HPP_
#define _ARCTAN_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<T> MdArrayUtility::arctan(const MdStaticArray<T> &values) {
    return MdArrayUtility::map<T>(
        values, [](const T &value) -> T { return ::atan(value); });
}

template <typename T>
MdStaticArray<T> MdArrayUtility::arctan(
    const MdStaticArrayReference<T> &values) {
    return MdArrayUtility::arctan<T>(MdStaticArray<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
