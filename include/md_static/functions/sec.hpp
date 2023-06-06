#pragma once
#ifndef _SEC_HPP_
#define _SEC_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
Array<T> MdArrayUtility::sec(const Array<T> &values) {
    return MdArrayUtility::map<T>(
        values, [](const T &value) { return 1 / ::cos(value); });
}

template <typename T>
Array<T> MdArrayUtility::sec(const Reference<T> &values) {
    return MdArrayUtility::sec<T>(Array<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
