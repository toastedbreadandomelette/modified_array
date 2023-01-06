#pragma once
#ifndef _POW_HPP_
#define _POW_HPP_
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::pow(const MdStaticArray<_T> &__values,
                                      double power) {
    return MdArrayUtility::map<_T>(
        __values, [power](const _T __value) { return pow(__value, power); });
}

#endif
