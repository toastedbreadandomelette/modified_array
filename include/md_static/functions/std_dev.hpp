#pragma once
#ifndef _STD_DEV_HPP_
#define _STD_DEV_HPP_
#include <cmath>

#include "./accumulate_and_merge.hpp"
#include "./md_static_array_utility.hpp"

template <typename _T>
long double MdArrayUtility::std_dev(const MdStaticArray<_T> &__values) {
    long double fmean = mean(__values);
    long double mean_sq_err =
        accumulate_and_merge_fn(
            __values,
            [&fmean](const _T prev_value, const _T current_value) {
                return prev_value +
                       (fmean - current_value) * (fmean - current_value);
            },
            [](const _T prev_value, const _T current_value) {
                return prev_value + current_value;
            },
            static_cast<_T>(0.0)) /
        (__values.get_size() * 1.0);
    return ::sqrt(mean_sq_err);
}

template <typename _T>
long double MdArrayUtility::std_dev(
    const MdStaticArrayReference<_T> &__values) {
    return std_dev<_T>(MdStaticArray<_T>(*__values.__array_reference,
                                         __values.offset, __values.shp_offset));
}

#endif
