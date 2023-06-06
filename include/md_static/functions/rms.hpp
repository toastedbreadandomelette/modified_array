#pragma once
#ifndef _RMS_HPP_
#define _RMS_HPP_
#include "./accumulate_and_merge.hpp"
#include "./md_static_array_utility.hpp"

template <typename T>
f128 MdArrayUtility::rms(const MdStaticArray<T> &values, const T init) {
    f128 mean_sq = accumulate_and_merge_fn(
                       values,
                       [](const T prev_value, const T current_value) {
                           return prev_value + (current_value * current_value);
                       },
                       [](const T prev_value, const T current_value) {
                           return prev_value + current_value;
                       },
                       static_cast<T>(init)) /
                   (values.get_size() * 1.0);
    return ::sqrt(mean_sq);
}

template <typename T>
f128 MdArrayUtility::rms(const MdStaticArrayReference<T> &values,
                         const T init) {
    return rms(MdStaticArray<T>(*values.__array_reference, values.offset,
                                values.shp_offset),
               init);
}

#endif
