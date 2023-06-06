#pragma once
#ifndef _LOG10_HPP_
#define _LOG10_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
Array<T> MdArrayUtility::log10(const Array<T> &values) {
    return MdArrayUtility::map<T>(
        values, [](const T &value) { return ::log10(value); });
}

template <typename T>
Array<T> MdArrayUtility::log10(
    const Reference<T> &values) {
    return MdArrayUtility::log10<T>(Array<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
