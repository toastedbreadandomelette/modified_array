#pragma once
#ifndef _RMS_HPP_
#define _RMS_HPP_
#include "./accumulate_and_merge.hpp"
#include "./md_static_array_utility.hpp"

template <typename _T>
long double MdArrayUtility::rms(const MdStaticArray<_T> &__values,
                                const _T init) {
    long double mean_sq =
        accumulate_and_merge_fn(
            __values,
            [](const _T prev_value, const _T current_value) {
                return prev_value + (current_value * current_value);
            },
            [](const _T prev_value, const _T current_value) {
                return prev_value + current_value;
            },
            static_cast<_T>(init)) /
        (__values.get_size() * 1.0);
    return ::sqrt(mean_sq);
}

template <typename _T>
long double MdArrayUtility::rms(const MdStaticArrayReference<_T> &__values,
                                const _T init) {
    return rms(MdStaticArray<_T>(*__values.__array_reference, __values.offset,
                                 __values.shp_offset),
               init);
}

#endif
