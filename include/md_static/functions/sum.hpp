#pragma once
#include "./md_static_array_utility.hpp"
#include "./reduce.hpp"

template <typename _T>
_T MdArrayUtility::sum(const MdStaticArray<_T> &__values, const _T init) {
    return reduce(
        __values,
        [](const _T prev_value, const _T current_value) {
            return prev_value + current_value;
        },
        init);
}
