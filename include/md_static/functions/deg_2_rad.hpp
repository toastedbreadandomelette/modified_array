#pragma once
#ifndef _DEG_2_RAD_HPP_
#define _DEG_2_RAD_HPP_
#include <cmath>

#define M_PI 3.14159265358979323846
#include "./md_static_array_utility.hpp"

template <typename T>
Array<T> MdArrayUtility::deg_2_rad(const Array<T> &ndarray) {
    return MdArrayUtility::map<T>(
        ndarray, [](const T value) -> T { return value * M_PI / 180.0; });
}

template <typename T>
Array<T> MdArrayUtility::deg_2_rad(
    const Reference<T> &values) {
    return MdArrayUtility::deg_2_rad<T>(Array<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif