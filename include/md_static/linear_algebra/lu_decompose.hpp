#pragma once
#ifndef _LU_DECOMPOSE_HPP_
#define _LU_DECOMPOSE_HPP_

#include "../functions/range.hpp"
#include "./md_linear_algebra.hpp"

template <typename Tres, typename T>
std::tuple<Array<Tres>, Array<Tres>, Array<Tres>, i32> Linalg::lu_decompose(
    const Array<T> &matrix) {
    if (matrix.get_shape_size() != 2) {
        throw std::runtime_error(
            "Given array should be of 2 dimension, found " +
            std::to_string(matrix.get_shape_size()));
    }

    if (matrix.get_shape()[0] != matrix.get_shape()[1]) {
        throw std::runtime_error("Given matrix should be square.");
    }

    // Credits to algorithm: Rosetta code:
    // https://rosettacode.org/wiki/LU_decomposition#C++
    usize n = matrix.get_shape()[0];
    Array<Tres> L({n, n}, 0), U({n, n}, 0), P({n, n}, 0);
    Array<Tres> input(matrix);
    i32 sign = 1;
    Array<usize> permutation = MdArrayUtility::range<usize>(n);

    for (usize j = 0; j < n; ++j) {
        usize max_index = j;
        Tres max_value =
            std::abs(input.__array[n * permutation.__array[j] + j]);
        for (usize i = j + 1; i < n; ++i) {
            const Tres value =
                std::abs(input.__array[n * permutation.__array[i] + j]);
            if (value > max_value) {
                max_value = value;
                max_index = i;
            }
        }
        if (j != max_index) {
            sign = -sign;
            std::swap(permutation.__array[j], permutation.__array[max_index]);
        }

        usize jmax = permutation.__array[j];

#pragma omp parallel for
        for (usize i = j + 1; i < n; ++i) {
            usize imax = permutation.__array[i];
            input.__array[imax * n + j] /= input.__array[jmax * n + j];
            for (usize k = j + 1; k < n; ++k) {
                input.__array[imax * n + k] -=
                    input.__array[imax * n + j] * input.__array[jmax * n + k];
            }
        }
    }

#pragma omp parallel for
    for (usize j = 0; j < n; ++j) {
        L.__array[j * n + j] = 1;
        for (usize i = j + 1; i < n; ++i) {
            L.__array[i * n + j] =
                input.__array[permutation.__array[i] * n + j];
        }
        for (usize i = 0; i <= j; ++i) {
            U.__array[i * n + j] =
                input.__array[permutation.__array[i] * n + j];
        }
    }

    for (usize index = 0; index < n; ++index) {
        P.__array[index * n + permutation.__array[index]] = 1;
    }

    return {L, U, P, sign};
}

template <typename Tres, typename T>
std::tuple<Array<Tres>, Array<Tres>, Array<Tres>, i32> Linalg::lu_decompose(
    const ArraySlice<T> &matrix) {
    return Linalg::lu_decompose<Tres>(
        Array<T>(*matrix.__array_reference, matrix.offset, matrix.shp_offset));
}

#endif
