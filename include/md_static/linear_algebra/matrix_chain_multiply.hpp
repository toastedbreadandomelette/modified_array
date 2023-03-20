#pragma once
#ifndef _MATRIX_CHAIN_MULTIPLY_HPP_
#define _MATRIX_CHAIN_MULTIPLY_HPP_

#include "./mat_multiply.hpp"
#include "./md_linear_algebra.hpp"

template <typename Tf, typename T1, typename T2, typename... arg>
MdStaticArray<Tf> MdLinearAlgebra::matrix_chain_multiply(
    const MdStaticArray<T1> &__first, const MdStaticArray<T2> &__other,
    const MdStaticArray<arg> &...arguments) {
    MdStaticArray<Tf> result =
        MdLinearAlgebra::mat_multiply<Tf, T1, T2>(__first, __other);
    return MdLinearAlgebra::matrix_chain_multiply<Tf, Tf, arg...>(result,
                                                                  arguments...);
}

template <typename Tf, typename T1, typename T2, typename... arg>
MdStaticArray<Tf> MdLinearAlgebra::matrix_chain_multiply(
    const MdStaticArrayReference<T1> &__first,
    const MdStaticArrayReference<T2> &__other,
    const MdStaticArray<arg> &...arguments) {
    MdStaticArray<Tf> result = MdLinearAlgebra::mat_multiply<Tf, T1, T2>(
        MdStaticArray<T1>(*__first.__array_reference, __first.offset,
                          __first.shp_offset),
        MdStaticArray<T2>(*__other.__array_reference, __other.offset,
                          __other.shp_offset));
    return MdLinearAlgebra::matrix_chain_multiply<Tf, Tf, arg...>(result,
                                                                  arguments...);
}

template <typename Tf, typename T1, typename T2, typename... arg>
MdStaticArray<Tf> MdLinearAlgebra::matrix_chain_multiply(
    const MdStaticArrayReference<T1> &__first, const MdStaticArray<T2> &__other,
    const MdStaticArray<arg> &...arguments) {
    MdStaticArray<Tf> result = MdLinearAlgebra::mat_multiply<Tf, T1, T2>(
        MdStaticArray<T1>(*__first.__array_reference, __first.offset,
                          __first.shp_offset),
        __other);
    return MdLinearAlgebra::matrix_chain_multiply<Tf, Tf, arg...>(result,
                                                                  arguments...);
}

template <typename Tf, typename T1, typename T2, typename... arg>
MdStaticArray<Tf> MdLinearAlgebra::matrix_chain_multiply(
    const MdStaticArray<T1> &__first, const MdStaticArrayReference<T2> &__other,
    const MdStaticArray<arg> &...arguments) {
    MdStaticArray<Tf> result = MdLinearAlgebra::mat_multiply<Tf, T1, T2>(
        __first, MdStaticArray<T2>(*__other.__array_reference, __other.offset,
                                   __other.shp_offset));
    return MdLinearAlgebra::matrix_chain_multiply<Tf, Tf, arg...>(result,
                                                                  arguments...);
}

////////////////////////////////////////////////////////////////////////////////

template <typename Tf, typename T1, typename T2, typename... arg>
MdStaticArray<Tf> MdLinearAlgebra::matrix_chain_multiply(
    const MdStaticArray<T1> &__first, const MdStaticArray<T2> &__other,
    const MdStaticArrayReference<arg> &...arguments) {
    MdStaticArray<Tf> result =
        MdLinearAlgebra::mat_multiply<Tf, T1, T2>(__first, __other);
    return MdLinearAlgebra::matrix_chain_multiply<Tf, Tf, arg...>(result,
                                                                  arguments...);
}

template <typename Tf, typename T1, typename T2, typename... arg>
MdStaticArray<Tf> MdLinearAlgebra::matrix_chain_multiply(
    const MdStaticArrayReference<T1> &__first,
    const MdStaticArrayReference<T2> &__other,
    const MdStaticArrayReference<arg> &...arguments) {
    MdStaticArray<Tf> result = MdLinearAlgebra::mat_multiply<Tf, T1, T2>(
        MdStaticArray<T1>(*__first.__array_reference, __first.offset,
                          __first.shp_offset),
        MdStaticArray<T2>(*__other.__array_reference, __other.offset,
                          __other.shp_offset));
    return MdLinearAlgebra::matrix_chain_multiply<Tf, Tf, arg...>(result,
                                                                  arguments...);
}

template <typename Tf, typename T1, typename T2, typename... arg>
MdStaticArray<Tf> MdLinearAlgebra::matrix_chain_multiply(
    const MdStaticArrayReference<T1> &__first, const MdStaticArray<T2> &__other,
    const MdStaticArrayReference<arg> &...arguments) {
    MdStaticArray<Tf> result = MdLinearAlgebra::mat_multiply<Tf, T1, T2>(
        MdStaticArray<T1>(*__first.__array_reference, __first.offset,
                          __first.shp_offset),
        __other);
    return MdLinearAlgebra::matrix_chain_multiply<Tf, Tf, arg...>(result,
                                                                  arguments...);
}

template <typename Tf, typename T1, typename T2, typename... arg>
MdStaticArray<Tf> MdLinearAlgebra::matrix_chain_multiply(
    const MdStaticArray<T1> &__first, const MdStaticArrayReference<T2> &__other,
    const MdStaticArrayReference<arg> &...arguments) {
    MdStaticArray<Tf> result = MdLinearAlgebra::mat_multiply<Tf, T1, T2>(
        __first, MdStaticArray<T2>(*__other.__array_reference, __other.offset,
                                   __other.shp_offset));
    return MdLinearAlgebra::matrix_chain_multiply<Tf, Tf, arg...>(result,
                                                                  arguments...);
}

template <typename Tf, typename T1, typename T2>
MdStaticArray<Tf> MdLinearAlgebra::matrix_chain_multiply(
    const MdStaticArray<T1> &__first, const MdStaticArray<T2> &__other) {
    return MdLinearAlgebra::mat_multiply<Tf, T1, T2>(__first, __other);
}

template <typename Tf, typename T1, typename T2>
MdStaticArray<Tf> MdLinearAlgebra::matrix_chain_multiply(
    const MdStaticArrayReference<T1> &__first,
    const MdStaticArrayReference<T2> &__other) {
    return MdLinearAlgebra::mat_multiply<Tf, T1, T2>(
        MdStaticArray<T1>(*__first.__array_reference, __first.offset,
                          __first.shp_offset),
        MdStaticArray<T2>(*__other.__array_reference, __other.offset,
                          __other.shp_offset));
}

template <typename Tf, typename T1, typename T2>
MdStaticArray<Tf> MdLinearAlgebra::matrix_chain_multiply(
    const MdStaticArrayReference<T1> &__first,
    const MdStaticArray<T2> &__other) {
    return MdLinearAlgebra::mat_multiply<Tf, T1, T2>(
        MdStaticArray<T1>(*__first.__array_reference, __first.offset,
                          __first.shp_offset),
        __other);
}

template <typename Tf, typename T1, typename T2>
MdStaticArray<Tf> MdLinearAlgebra::matrix_chain_multiply(
    const MdStaticArray<T1> &__first,
    const MdStaticArrayReference<T2> &__other) {
    return MdLinearAlgebra::mat_multiply<Tf, T1, T2>(
        __first, MdStaticArray<T2>(*__other.__array_reference, __other.offset,
                                   __other.shp_offset));
}

#endif
