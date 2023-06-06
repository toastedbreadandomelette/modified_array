#pragma once
#ifndef _COT_HPP_
#define _COT_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
Array<T> MdArrayUtility::cot(const Array<T> &values) {
    return MdArrayUtility::map<T>(
        values, [](const T &value) { return 1 / ::tan(value); });
}

template <typename T>
Array<T> MdArrayUtility::cot(const Reference<T> &values) {
    return MdArrayUtility::cot<T>(Array<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
