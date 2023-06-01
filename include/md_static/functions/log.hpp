#pragma once
#ifndef _LOG_HPP_
#define _LOG_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<T> MdArrayUtility::log(const MdStaticArray<T> &values) {
    return MdArrayUtility::map<T>(values,
                                  [](const T &value) { return ::log(value); });
}

template <typename T>
MdStaticArray<T> MdArrayUtility::log(const MdStaticArrayReference<T> &values) {
    return MdArrayUtility::log<T>(MdStaticArray<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
