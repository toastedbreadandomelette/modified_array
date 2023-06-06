#pragma once
#ifndef _POW_HPP_
#define _POW_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<T> MdArrayUtility::pow(const MdStaticArray<T> &values,
                                     f64 power) {
    return MdArrayUtility::map<T>(
        values, [power](const T value) { return ::pow(value, power); });
}

template <typename T>
MdStaticArray<T> MdArrayUtility::pow(const MdStaticArrayReference<T> &values,
                                     f64 power) {
    return MdArrayUtility::pow<T>(
        MdStaticArray<T>(*values.__array_reference, values.offset,
                         values.shp_offset),
        power);
}

#endif
