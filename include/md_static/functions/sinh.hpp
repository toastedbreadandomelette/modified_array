#pragma once
#ifndef _SINH_HPP_
#define _SINH_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
Array<f64> MdArrayUtility::sinh(const Array<T> &values) {
    return MdArrayUtility::map<T>(values,
                                  [](const T &value) { return ::sinh(value); });
}

template <typename T>
Array<f64> MdArrayUtility::sinh(const Reference<T> &values) {
    return MdArrayUtility::sinh<T>(
        Array<T>(*values.__array_reference, values.offset, values.shp_offset));
}

#endif
