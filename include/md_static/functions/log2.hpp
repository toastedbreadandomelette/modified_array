#pragma once
#ifndef _LOG2_HPP_
#define _LOG2_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
Array<T> MdArrayUtility::log2(const Array<T> &values) {
    return MdArrayUtility::map<T>(values,
                                  [](const T &value) { return ::log2(value); });
}

template <typename T>
Array<T> MdArrayUtility::log2(const Reference<T> &values) {
    return MdArrayUtility::log2<T>(Array<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
