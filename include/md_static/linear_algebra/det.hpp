#pragma once
#ifndef _C_DET_HPP_
#define _C_DET_HPP_

#include "./md_linear_algebra.hpp"

template <typename T>
long double Linalg::det(const MdStaticArray<T> &matrix) {
    const auto [L, U, P, sign] = Linalg::lu_decompose<T>(matrix);
    size_t n = matrix.get_shape()[0];
    long double det = 1;
    for (size_t index = 0; index < n; ++index) {
        det *= U.__array[index * n + index];
    }

    return sign * det;
}

template <typename T>
long double Linalg::det(const MdStaticArrayReference<T> &matrix) {
    return Linalg::det(MdStaticArray<T>(*matrix.__array_reference,
                                        matrix.offset, matrix.shp_offset));
}

#endif
