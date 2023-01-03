#pragma once
#include <cmath>

#include "md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::arccos(const MdStaticArray<_T> &__values) {
    return map<_T>(__values, [](const _T &__value) { return acos(__value); });
}
