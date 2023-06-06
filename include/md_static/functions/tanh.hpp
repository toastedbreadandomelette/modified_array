#pragma once
#ifndef _TANH_HPP_
#define _TANH_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
Array<f64> MdArrayUtility::tanh(const Array<T> &values) {
    return MdArrayUtility::map<T>(
        values, [](const T &__value) { return ::tanh(__value); });
}

template <typename T>
Array<f64> MdArrayUtility::tanh(
    const Reference<T> &values) {
    return MdArrayUtility::tanh<T>(Array<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
