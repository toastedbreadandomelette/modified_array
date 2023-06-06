#pragma once
#ifndef _COS_HPP_
#define _COS_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
Array<T> MdArrayUtility::cos(const Array<T> &values) {
    return MdArrayUtility::map<T>(values,
                                  [](const T &value) { return ::cos(value); });
}

template <typename T>
Array<T> MdArrayUtility::cos(const Reference<T> &values) {
    return MdArrayUtility::cos<T>(Array<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
