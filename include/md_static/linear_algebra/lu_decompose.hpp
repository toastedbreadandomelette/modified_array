#pragma once
#ifndef _LU_DECOMPOSE_HPP_
#define _LU_DECOMPOSE_HPP_

#include "../functions/range.hpp"
#include "./md_linear_algebra.hpp"

template <typename Tres, typename T>
std::tuple<MdStaticArray<Tres>, MdStaticArray<Tres>, MdStaticArray<Tres>, int>
MdLinearAlgebra::lu_decompose(const MdStaticArray<T> &__2darray) {
    if (__2darray.get_shape_size() != 2) {
        throw std::runtime_error(
            "Given array should be of 2 dimension, found " +
            std::to_string(__2darray.get_shape_size()));
    }

    if (__2darray.get_shape()[0] != __2darray.get_shape()[1]) {
        throw std::runtime_error("Given matrix should be square.");
    }

    // Credits to algorithm: Rosetta code:
    // https://rosettacode.org/wiki/LU_decomposition#C++
    size_t n = __2darray.get_shape()[0];
    MdStaticArray<Tres> L({n, n}, 0), U({n, n}, 0), P({n, n}, 0);
    MdStaticArray<Tres> input(__2darray);
    int sign = 1;
    MdStaticArray<size_t> permutation = MdArrayUtility::range<size_t>(n);

    for (size_t j = 0; j < n; ++j) {
        size_t max_index = j;
        Tres max_value =
            std::abs(input.__array[n * permutation.__array[j] + j]);
        for (size_t i = j + 1; i < n; ++i) {
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

        size_t jmax = permutation.__array[j];

#pragma omp parallel for
        for (size_t i = j + 1; i < n; ++i) {
            size_t imax = permutation.__array[i];
            input.__array[imax * n + j] /= input.__array[jmax * n + j];
            for (size_t k = j + 1; k < n; ++k) {
                input.__array[imax * n + k] -=
                    input.__array[imax * n + j] * input.__array[jmax * n + k];
            }
        }
    }

#pragma omp parallel for
    for (size_t j = 0; j < n; ++j) {
        L.__array[j * n + j] = 1;
        for (size_t i = j + 1; i < n; ++i) {
            L.__array[i * n + j] =
                input.__array[permutation.__array[i] * n + j];
        }
        for (size_t i = 0; i <= j; ++i) {
            U.__array[i * n + j] =
                input.__array[permutation.__array[i] * n + j];
        }
    }

    for (size_t index = 0; index < n; ++index) {
        P.__array[index * n + permutation.__array[index]] = 1;
    }

    return {L, U, P, sign};
}

template <typename Tres, typename T>
std::tuple<MdStaticArray<Tres>, MdStaticArray<Tres>, MdStaticArray<Tres>, int>
MdLinearAlgebra::lu_decompose(
    const MdStaticArrayReference<T> &__2darray_reference) {
    return MdLinearAlgebra::lu_decompose<Tres>(MdStaticArray<T>(
        *__2darray_reference.__array_reference, __2darray_reference.offset,
        __2darray_reference.shp_offset));
}

#endif
