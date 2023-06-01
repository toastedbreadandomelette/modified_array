#pragma once
#ifndef _COT_HPP_
#define _COT_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<T> MdArrayUtility::cot(const MdStaticArray<T> &values) {
    return MdArrayUtility::map<T>(
        values, [](const T &value) { return 1 / ::tan(value); });
}

template <typename T>
MdStaticArray<T> MdArrayUtility::cot(const MdStaticArrayReference<T> &values) {
    return MdArrayUtility::cot<T>(MdStaticArray<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
