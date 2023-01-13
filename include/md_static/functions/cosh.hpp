#pragma once
#ifndef _COSH_HPP_
#define _COSH_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<double> MdArrayUtility::cosh(const MdStaticArray<_T> &__values) {
    return MdArrayUtility::map<_T>(
        __values, [](const _T &__value) { return ::cosh(__value); });
}

template <typename _T>
MdStaticArray<double> MdArrayUtility::cosh(
    const typename MdStaticArray<_T>::reference &__values) {
    return MdArrayUtility::cosh<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

#endif
