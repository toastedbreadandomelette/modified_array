#pragma once
#ifndef _SEC_HPP_
#define _SEC_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<T> MdArrayUtility::sec(const MdStaticArray<T> &values) {
    return MdArrayUtility::map<T>(
        values, [](const T &value) { return 1 / ::cos(value); });
}

template <typename T>
MdStaticArray<T> MdArrayUtility::sec(const MdStaticArrayReference<T> &values) {
    return MdArrayUtility::sec<T>(MdStaticArray<T>(
        *values.__array_reference, values.offset, values.shp_offset));
}

#endif
