#pragma once
#ifndef _ARCSIN_HPP_
#define _ARCSIN_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::arcsin(const MdStaticArray<_T> &__values) {
    return MdArrayUtility::map<_T>(
        __values, [](const _T &__value) { return ::asin(__value); });
}

#endif
