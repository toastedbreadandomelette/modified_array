#pragma once
#ifndef _SINH_HPP_
#define _SINH_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<double> MdArrayUtility::sinh(const MdStaticArray<_T> &__values) {
    return MdArrayUtility::map<_T>(
        __values, [](const _T &__value) { return ::sinh(__value); });
}

template <typename _T>
MdStaticArray<double> MdArrayUtility::sinh(
    const typename MdStaticArray<_T>::reference &__values) {
    return MdArrayUtility::sinh<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

#endif
