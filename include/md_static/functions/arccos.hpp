#pragma once
#ifndef _ARCCOS_HPP_
#define _ARCCOS_HPP_
#include <cmath>

#include "./md_static_array_utility.hpp"

template <typename T>
Array<T> MdArrayUtility::arccos(const Array<T> &values) {
    return MdArrayUtility::map<T>(values,
                                  [](const T &value) { return acos(value); });
}

template <typename T>
Array<T> MdArrayUtility::arccos(
    const Reference<T> &values) {
    return MdArrayUtility::arccos<T>(Array<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
