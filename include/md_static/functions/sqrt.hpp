#pragma once
#ifndef _SQRT_HPP_
#define _SQRT_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
Array<T> MdArrayUtility::sqrt(const Array<T> &values) {
    return MdArrayUtility::map<T>(values,
                                  [](const T &value) { return ::sqrt(value); });
}

template <typename T>
Array<T> MdArrayUtility::sqrt(const Reference<T> &values) {
    return MdArrayUtility::sqrt<T>(Array<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
