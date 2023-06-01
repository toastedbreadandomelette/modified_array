#pragma once
#ifndef _SINH_HPP_
#define _SINH_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<double> MdArrayUtility::sinh(const MdStaticArray<T> &values) {
    return MdArrayUtility::map<T>(values,
                                  [](const T &value) { return ::sinh(value); });
}

template <typename T>
MdStaticArray<double> MdArrayUtility::sinh(
    const MdStaticArrayReference<T> &values) {
    return MdArrayUtility::sinh<T>(MdStaticArray<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
