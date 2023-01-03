#pragma once
#include "map.hpp"
#include "md_static_array_utility.hpp"

template <typename _T>
long double MdArrayUtility::mean(const MdStaticArray<_T> &__values,
                                 const _T init) {
    return reduce<_T>(
               __values,
               [](const _T prev_value, const _T current_value) {
                   return prev_value + current_value;
               },
               init) /
           (__values.get_size() * 1.0);
}
