#pragma once
#ifndef _RAD_2_DEG_HPP_
#define _RAD_2_DEG_HPP_
#include <cmath>

#define M_PI 3.14159265358979323846
#include "./md_static_array_utility.hpp"

template <typename T>
Array<T> MdArrayUtility::rad_2_deg(const Array<T> &ndarray) {
    return MdArrayUtility::map<T>(
        ndarray, [](const T value) -> T { return value * 180.0 / M_PI; });
}

template <typename T>
Array<T> MdArrayUtility::rad_2_deg(const Reference<T> &values) {
    return MdArrayUtility::rad_2_deg<T>(
        Array<T>(*values.__array_reference, values.offset, values.shp_offset));
}

#endif