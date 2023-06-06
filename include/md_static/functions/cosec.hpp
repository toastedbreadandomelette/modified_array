#pragma once
#ifndef _COSEC_HPP_
#define _COSEC_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
Array<T> MdArrayUtility::cosec(const Array<T> &values) {
    return MdArrayUtility::map<T>(
        values, [](const T &value) { return 1 / ::sin(value); });
}

template <typename T>
Array<T> MdArrayUtility::cosec(
    const Reference<T> &values) {
    return MdArrayUtility::cosec<T>(Array<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
