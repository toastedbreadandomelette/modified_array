#pragma once
#ifndef _C_DET_HPP_
#define _C_DET_HPP_

#include "./md_linear_algebra.hpp"

template <typename _T>
long double Linalg::det(const MdStaticArray<_T> &__2darray) {
    const auto [L, U, P, sign] = Linalg::lu_decompose<_T>(__2darray);
    size_t n = __2darray.get_shape()[0];
    long double det = 1;
    for (size_t index = 0; index < n; ++index) {
        det *= U.__array[index * n + index];
    }

    return sign * det;
}

template <typename _T>
long double Linalg::det(const MdStaticArrayReference<_T> &__2darray) {
    return Linalg::det(MdStaticArray<_T>(
        *__2darray.__array_reference, __2darray.offset, __2darray.shp_offset));
}

#endif
