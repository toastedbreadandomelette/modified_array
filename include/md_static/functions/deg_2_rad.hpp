#pragma once
#ifndef _DEG_2_RAD_HPP_
#define _DEG_2_RAD_HPP_
#include <cmath>

#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::deg_2_rad(
    const MdStaticArray<_T> &__ndarray) {
    return map<_T>(__ndarray,
                   [](const _T value) -> _T { return value * M_PI / 180.0; });
}

#endif