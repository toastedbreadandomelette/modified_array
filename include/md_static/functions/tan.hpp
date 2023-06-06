#pragma once
#ifndef _TAN_HPP_
#define _TAN_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
Array<T> MdArrayUtility::tan(const Array<T> &values) {
    return MdArrayUtility::map<T>(values,
                                  [](const T &value) { return ::tan(value); });
}

template <typename T>
Array<T> MdArrayUtility::tan(const Reference<T> &values) {
    return MdArrayUtility::tan<T>(Array<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
