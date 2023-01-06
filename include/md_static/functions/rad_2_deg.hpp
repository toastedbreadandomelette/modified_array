#pragma once
#ifndef _RAD_2_DEG_HPP_
#define _RAD_2_DEG_HPP_
#include <cmath>

#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::rad_2_deg(
    const MdStaticArray<_T> &__ndarray) {
    return MdArrayUtility::map<_T>(__ndarray,
                   [](const _T value) -> _T { return value * 180.0 / M_PI; });
}

#endif