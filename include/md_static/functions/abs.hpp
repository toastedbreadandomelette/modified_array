#pragma once
#include <cmath>

#include "md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::abs(const MdStaticArray<_T> &__values) {
    return map<_T>(__values, fabs);
}
