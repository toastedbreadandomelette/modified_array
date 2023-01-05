#pragma once
#include <cmath>

#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::pow(const MdStaticArray<_T> &__values,
                                      double power) {
    return map<_T>(__values,
                   [power](const _T __value) { return pow(__value, power); });
}