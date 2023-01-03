#pragma once
#include <cmath>

#include "map.hpp"
#include "md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::arctan(const MdStaticArray<_T> &__values) {
    return map<_T>(__values, [](const _T &__value) { return ::atan(__value); });
}
