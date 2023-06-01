#pragma once
#ifndef _COS_HPP_
#define _COS_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<T> MdArrayUtility::cos(const MdStaticArray<T> &values) {
    return MdArrayUtility::map<T>(values,
                                  [](const T &value) { return ::cos(value); });
}

template <typename T>
MdStaticArray<T> MdArrayUtility::cos(const MdStaticArrayReference<T> &values) {
    return MdArrayUtility::cos<T>(MdStaticArray<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
