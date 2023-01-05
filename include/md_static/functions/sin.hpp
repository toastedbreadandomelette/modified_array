#pragma once
#include <cmath>

#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::sin(const MdStaticArray<_T> &__values) {
    return map<_T>(__values, [](const _T &__value) { return ::sin(__value); });
}
