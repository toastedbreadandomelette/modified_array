#pragma once
#ifndef _MATRIX_POWER_HPP_
#define _MATRIX_POWER_HPP_

#include "./identity.hpp"
#include "./mat_multiply.hpp"
#include "./md_linear_algebra.hpp"

template <typename _T, class _T1>
MdStaticArray<_T> MdLinearAlgebra::matrix_power(
    const MdStaticArray<_T> &__matrix, size_t power) {
    if (__matrix.get_shape()[0] != __matrix.get_shape()[1]) {
        throw std::runtime_error(
            "Given input matrix should be square. Found dimension (" +
            std::to_string(__matrix.get_shape()[0]) + ", " +
            std::to_string(__matrix.get_shape()[1]) + ").");
    }

    MdStaticArray<_T> result = MdLinearAlgebra::identity<_T>(
                          __matrix.get_shape()[0]),
                      __ocp = __matrix;

    while (power > 0) {
        if (power & 1) {
            result = MdLinearAlgebra::mat_multiply<_T, _T, _T>(result, __ocp);
        }
        __ocp = MdLinearAlgebra::mat_multiply<_T, _T, _T>(__ocp, __ocp);
        power >>= 1;
    }

    return result;
}

template <typename _T, class _T1>
MdStaticArray<_T> MdLinearAlgebra::matrix_power(
    const typename MdStaticArray<_T>::reference &__matrix, size_t power) {
    return MdLinearAlgebra::matrix_power<_T>(
        MdStaticArray<_T>(*__matrix.__array_reference, __matrix.offset,
                          __matrix.shp_offset),
        power);
}

#endif
