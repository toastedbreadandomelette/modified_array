#pragma once
#ifndef _SQRT_HPP_
#define _SQRT_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::sqrt(const MdStaticArray<_T> &__values) {
    return MdArrayUtility::map<_T>(
        __values, [](const _T &value) { return ::sqrt(value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::sqrt(
    const typename MdStaticArray<_T>::reference &__values) {
    return MdArrayUtility::sqrt<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

#endif
