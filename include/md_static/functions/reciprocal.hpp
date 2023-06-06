#pragma once
#ifndef _RECIPROCAL_HPP_
#define _RECIPROCAL_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
Array<double> MdArrayUtility::reciprocal(
    const Array<T> &values) {
    return MdArrayUtility::map<T>(
        values, [](const T &value) { return 1 / (value * 1.0); });
}

template <typename T>
Array<double> MdArrayUtility::reciprocal(
    const Reference<T> &values) {
    return MdArrayUtility::sec<T>(Array<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
