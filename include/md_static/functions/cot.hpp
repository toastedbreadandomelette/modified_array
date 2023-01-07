#pragma once
#ifndef _COT_HPP_
#define _COT_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::cot(const MdStaticArray<_T> &__values) {
    return MdArrayUtility::map<_T>(
        __values, [](const _T &__value) { return 1 / ::tan(__value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::cot(
    const typename MdStaticArray<_T>::reference &__values) {
    return MdArrayUtility::cot<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

#endif
