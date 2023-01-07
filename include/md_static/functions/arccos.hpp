#pragma once
#ifndef _ARCCOS_HPP_
#define _ARCCOS_HPP_
#include <cmath>

#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::arccos(const MdStaticArray<_T> &__values) {
    return MdArrayUtility::map<_T>(
        __values, [](const _T &__value) { return acos(__value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::arccos(
    const typename MdStaticArray<_T>::reference &__values) {
    return MdArrayUtility::arccos<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

#endif
