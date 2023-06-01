#pragma once
#ifndef _COSH_HPP_
#define _COSH_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<double> MdArrayUtility::cosh(const MdStaticArray<T> &values) {
    return MdArrayUtility::map<T>(values,
                                  [](const T &value) { return ::cosh(value); });
}

template <typename T>
MdStaticArray<double> MdArrayUtility::cosh(
    const MdStaticArrayReference<T> &values) {
    return MdArrayUtility::cosh<T>(MdStaticArray<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
