#pragma once
#ifndef _LOG10_HPP_
#define _LOG10_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<T> MdArrayUtility::log10(const MdStaticArray<T> &values) {
    return MdArrayUtility::map<T>(
        values, [](const T &value) { return ::log10(value); });
}

template <typename T>
MdStaticArray<T> MdArrayUtility::log10(
    const MdStaticArrayReference<T> &values) {
    return MdArrayUtility::log10<T>(MdStaticArray<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
