#pragma once
#ifndef _CEIL_HPP_
#define _CEIL_HPP_
#include <cmath>

#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::ceil(const MdStaticArray<_T> &__ndarray) {
    return map<_T>(__ndarray,
                   [](const _T value) -> _T { return ::ceil(value); });
}

#endif