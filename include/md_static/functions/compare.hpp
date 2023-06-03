#pragma once
#ifndef _COMPARE_HPP_
#define _COMPARE_HPP_

#include "./md_static_array_utility.hpp"

template <typename T1, typename T2>
bool MdArrayUtility::compare(const MdStaticArray<T1> &first,
                             const MdStaticArray<T2> &other) {
    if (first.get_shape_size() != other.get_shape_size()) {
        return false;
    }
    for (size_t i = 0; i < first.get_shape_size(); ++i) {
        if (first.get_shape()[i] != other.get_shape()[i]) {
            return false;
        }
    }

    if constexpr (MdTypeInfer::is_any_one_floating<T1, T2>::value) {
        for (size_t i = 0; i < first.get_size(); ++i) {
            if (std::abs(first.__array[i] - other.__array[i]) > 1e-5) {
                return false;
            }
        }
    } else {
        for (size_t i = 0; i < first.get_size(); ++i) {
            if (first.__array[i] != other.__array[i]) {
                return false;
            }
        }
    }
    return true;
}

#endif
