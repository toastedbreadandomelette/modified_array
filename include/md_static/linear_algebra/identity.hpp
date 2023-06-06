#pragma once
#ifndef _IDENTITY_HPP_
#define _IDENTITY_HPP_
#include "./md_linear_algebra.hpp"

template <typename _T>
MdStaticArray<_T> Linalg::identity(const usize n) {
    MdStaticArray<_T> result({n, n}, 0);
    for (usize index = 0; index < result.get_size(); index += (n + 1)) {
        result.__array[index] = 1;
    }

    return result;
}

template <typename _T>
bool Linalg::is_identity(const MdStaticArray<_T> &other) {
    if (other.shp_size != 2 || other.shape[0] != other.shape[1]) {
        return false;
    }
    usize n = other.shape[0];

    for (usize index = 0; index < other.get_size(); ++index) {
        if (other.__array[index] > 1 || other.__array[index] < 0) {
            return false;
        }
        if (other.__array[index] && (index % (n + 1) != 0)) {
            return false;
        }
        if (!other.__array[index] && (index % (n + 1) == 0)) {
            return false;
        }
    }

    return true;
}

template <typename _T>
bool Linalg::is_identity(const MdStaticArrayReference<_T> &other) {
    return Linalg::is_identity(MdStaticArray<_T>(
        *other.array_reference, other.offset, other.shp_offset));
}

#endif
