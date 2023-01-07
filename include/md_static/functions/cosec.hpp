#pragma once
#ifndef _COSEC_HPP_
#define _COSEC_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::cosec(const MdStaticArray<_T> &__values) {
    return MdArrayUtility::map<_T>(
        __values, [](const _T &__value) { return 1 / ::sin(__value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::cosec(
    const typename MdStaticArray<_T>::reference &__values) {
    return MdArrayUtility::cosec<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

#endif
