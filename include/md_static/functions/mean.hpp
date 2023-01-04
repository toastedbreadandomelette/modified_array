#pragma once
#include "md_static_array_utility.hpp"

template <typename _T>
long double MdArrayUtility::mean(const MdStaticArray<_T> &__values,
                                 const _T init) {
    return sum(__values) / (__values.get_size() * 1.0);
}
