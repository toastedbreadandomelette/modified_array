#pragma once
#ifndef _FLOOR_HPP_
#define _FLOOR_HPP_
#include <cmath>

#include "./md_static_array_utility.hpp"

template <typename T>
Array<T> MdArrayUtility::floor(const Array<T> &array) {
    return MdArrayUtility::map<T>(
        array, [](const T value) -> T { return ::floor(value); });
}

template <typename T>
Array<T> MdArrayUtility::floor(
    const Reference<T> &values) {
    return MdArrayUtility::floor<T>(Array<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif