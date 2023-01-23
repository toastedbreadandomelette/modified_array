#pragma once
#ifndef _LOG_HPP_
#define _LOG_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::log(const MdStaticArray<_T> &__values) {
    return MdArrayUtility::map<_T>(
        __values, [](const _T &__value) { return ::log(__value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::log(
    const MdStaticArrayReference<_T> &__values) {
    return MdArrayUtility::log<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

#endif
