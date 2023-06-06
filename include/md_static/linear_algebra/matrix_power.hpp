#pragma once
#ifndef _MATRIX_POWER_HPP_
#define _MATRIX_POWER_HPP_

#include "./identity.hpp"
#include "./mat_multiply.hpp"
#include "./md_linear_algebra.hpp"

template <typename T, class T1>
MdStaticArray<T> Linalg::matrix_power(const MdStaticArray<T> &__matrix,
                                      usize power) {
    if (__matrix.get_shape_size() != 2) {
        throw std::runtime_error(
            "Given input should be of dimension 2. Found dimension " +
            std::to_string(__matrix.get_shape_size()) + ".");
    }

    if (__matrix.get_shape()[0] != __matrix.get_shape()[1]) {
        throw std::runtime_error(
            "Given input matrix should be square. Found dimension (" +
            std::to_string(__matrix.get_shape()[0]) + ", " +
            std::to_string(__matrix.get_shape()[1]) + ").");
    }

    MdStaticArray<T> result = Linalg::identity<T>(__matrix.get_shape()[0]),
                     omat = __matrix;

    while (power > 0) {
        if (power & 1) {
            result = Linalg::mat_multiply<T, T, T>(result, omat);
        }
        omat = Linalg::mat_multiply<T, T, T>(omat, omat);
        power >>= 1;
    }

    return result;
}

template <typename T, class T1>
MdStaticArray<T> Linalg::matrix_power(const MdStaticArrayReference<T> &__matrix,
                                      usize power) {
    return Linalg::matrix_power<T>(
        MdStaticArray<T>(*__matrix.__array_reference, __matrix.offset,
                         __matrix.shp_offset),
        power);
}

#endif
