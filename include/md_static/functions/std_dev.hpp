#pragma once
#ifndef _STD_DEV_HPP_
#define _STD_DEV_HPP_
#include <cmath>

#include "./accumulate_and_merge.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
f128 MdArrayUtility::std_dev(const MdStaticArray<T> &values) {
    f128 fmean = mean(values);
    f128 mean_sq_err = accumulate_and_merge_fn(
                           values,
                           [&fmean](const T prev_value, const T current_value) {
                               return prev_value + (fmean - current_value) *
                                                       (fmean - current_value);
                           },
                           [](const T prev_value, const T current_value) {
                               return prev_value + current_value;
                           },
                           static_cast<T>(0.0)) /
                       (values.get_size() * 1.0);
    return ::sqrt(mean_sq_err);
}

template <typename T>
f128 MdArrayUtility::std_dev(const MdStaticArrayReference<T> &values) {
    return std_dev<T>(MdStaticArray<T>(*values.__array_reference, values.offset,
                                       values.shp_offset));
}

#endif
