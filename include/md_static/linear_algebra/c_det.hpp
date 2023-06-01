#pragma once
#ifndef _DET_HPP_
#define _DET_HPP_

#include "../../md_complex/md_complex.hpp"
#include "./md_linear_algebra.hpp"

template <typename T>
clongdouble Linalg::c_det(const MdStaticArray<T> &mat) {
    auto [L, U, P, sign] = Linalg::lu_decompose<T>(mat);
    const size_t n = mat.get_shape()[0];
    clongdouble det = 1;
    for (size_t index = 0; index < n; ++index) {
        det *= U.__array[index * n + index];
    }

    return sign * det;
}

template <typename T>
clongdouble Linalg::c_det(const MdStaticArrayReference<T> &mat) {
    return Linalg::det(
        MdStaticArray<T>(*mat.__array_reference, mat.offset, mat.shp_offset));
}

#endif
