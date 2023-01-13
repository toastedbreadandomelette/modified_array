#pragma once
#ifndef _MATRIX_CHAIN_MULTIPLY_HPP_
#define _MATRIX_CHAIN_MULTIPLY_HPP_

#include "./mat_multiply.hpp"
#include "./md_linear_algebra.hpp"

template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
MdStaticArray<_Tfinal> MdLinearAlgebra::matrix_chain_multiply(
    const MdStaticArray<_T1> &__first, const MdStaticArray<_T2> &__other,
    const MdStaticArray<arg> &...arguments) {
    MdStaticArray<_Tfinal> result =
        MdLinearAlgebra::mat_multiply<_T1, _T2, _Tfinal>(__first, __other);
    return MdLinearAlgebra::matrix_chain_multiply<_Tfinal, _Tfinal, arg...>(
        result, arguments...);
}

template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
MdStaticArray<_Tfinal> MdLinearAlgebra::matrix_chain_multiply(
    const typename MdStaticArray<_T1>::reference &__first,
    const typename MdStaticArray<_T2>::reference &__other,
    const MdStaticArray<arg> &...arguments) {
    MdStaticArray<_Tfinal> result =
        MdLinearAlgebra::mat_multiply<_T1, _T2, _Tfinal>(
            MdStaticArray<_T1>(*__first.__array_reference, __first.offset,
                               __first.shp_offset),
            MdStaticArray<_T2>(*__other.__array_reference, __other.offset,
                               __other.shp_offset));
    return MdLinearAlgebra::matrix_chain_multiply<_Tfinal, _Tfinal, arg...>(
        result, arguments...);
}

template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
MdStaticArray<_Tfinal> MdLinearAlgebra::matrix_chain_multiply(
    const typename MdStaticArray<_T1>::reference &__first,
    const MdStaticArray<_T2> &__other, const MdStaticArray<arg> &...arguments) {
    MdStaticArray<_Tfinal> result =
        MdLinearAlgebra::mat_multiply<_T1, _T2, _Tfinal>(
            MdStaticArray<_T1>(*__first.__array_reference, __first.offset,
                               __first.shp_offset),
            __other);
    return MdLinearAlgebra::matrix_chain_multiply<_Tfinal, _Tfinal, arg...>(
        result, arguments...);
}

template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
MdStaticArray<_Tfinal> MdLinearAlgebra::matrix_chain_multiply(
    const MdStaticArray<_T1> &__first,
    const typename MdStaticArray<_T2>::reference &__other,
    const MdStaticArray<arg> &...arguments) {
    MdStaticArray<_Tfinal> result =
        MdLinearAlgebra::mat_multiply<_T1, _T2, _Tfinal>(
            __first, MdStaticArray<_T2>(*__other.__array_reference,
                                        __other.offset, __other.shp_offset));
    return MdLinearAlgebra::matrix_chain_multiply<_Tfinal, _Tfinal, arg...>(
        result, arguments...);
}

////////////////////////////////////////////////////////////////////////////////

template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
MdStaticArray<_Tfinal> MdLinearAlgebra::matrix_chain_multiply(
    const MdStaticArray<_T1> &__first, const MdStaticArray<_T2> &__other,
    const typename MdStaticArray<arg>::reference &...arguments) {
    MdStaticArray<_Tfinal> result =
        MdLinearAlgebra::mat_multiply<_T1, _T2, _Tfinal>(__first, __other);
    return MdLinearAlgebra::matrix_chain_multiply<_Tfinal, _Tfinal, arg...>(
        result, arguments...);
}

template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
MdStaticArray<_Tfinal> MdLinearAlgebra::matrix_chain_multiply(
    const typename MdStaticArray<_T1>::reference &__first,
    const typename MdStaticArray<_T2>::reference &__other,
    const typename MdStaticArray<arg>::reference &...arguments) {
    MdStaticArray<_Tfinal> result =
        MdLinearAlgebra::mat_multiply<_T1, _T2, _Tfinal>(
            MdStaticArray<_T1>(*__first.__array_reference, __first.offset,
                               __first.shp_offset),
            MdStaticArray<_T2>(*__other.__array_reference, __other.offset,
                               __other.shp_offset));
    return MdLinearAlgebra::matrix_chain_multiply<_Tfinal, _Tfinal, arg...>(
        result, arguments...);
}

template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
MdStaticArray<_Tfinal> MdLinearAlgebra::matrix_chain_multiply(
    const typename MdStaticArray<_T1>::reference &__first,
    const MdStaticArray<_T2> &__other,
    const typename MdStaticArray<arg>::reference &...arguments) {
    MdStaticArray<_Tfinal> result =
        MdLinearAlgebra::mat_multiply<_T1, _T2, _Tfinal>(
            MdStaticArray<_T1>(*__first.__array_reference, __first.offset,
                               __first.shp_offset),
            __other);
    return MdLinearAlgebra::matrix_chain_multiply<_Tfinal, _Tfinal, arg...>(
        result, arguments...);
}

template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
MdStaticArray<_Tfinal> MdLinearAlgebra::matrix_chain_multiply(
    const MdStaticArray<_T1> &__first,
    const typename MdStaticArray<_T2>::reference &__other,
    const typename MdStaticArray<arg>::reference &...arguments) {
    MdStaticArray<_Tfinal> result =
        MdLinearAlgebra::mat_multiply<_T1, _T2, _Tfinal>(
            __first, MdStaticArray<_T2>(*__other.__array_reference,
                                        __other.offset, __other.shp_offset));
    return MdLinearAlgebra::matrix_chain_multiply<_Tfinal, _Tfinal, arg...>(
        result, arguments...);
}

template <typename _Tfinal, typename _T1, typename _T2>
MdStaticArray<_Tfinal> MdLinearAlgebra::matrix_chain_multiply(
    const MdStaticArray<_T1> &__first, const MdStaticArray<_T2> &__other) {
    return MdLinearAlgebra::mat_multiply<_T1, _T2, _Tfinal>(__first, __other);
}

template <typename _Tfinal, typename _T1, typename _T2>
MdStaticArray<_Tfinal> MdLinearAlgebra::matrix_chain_multiply(
    const typename MdStaticArray<_T1>::reference &__first,
    const typename MdStaticArray<_T2>::reference &__other) {
    return MdLinearAlgebra::mat_multiply<_T1, _T2, _Tfinal>(
        MdStaticArray<_T1>(*__first.__array_reference, __first.offset,
                           __first.shp_offset),
        MdStaticArray<_T2>(*__other.__array_reference, __other.offset,
                           __other.shp_offset));
}

template <typename _Tfinal, typename _T1, typename _T2>
MdStaticArray<_Tfinal> MdLinearAlgebra::matrix_chain_multiply(
    const typename MdStaticArray<_T1>::reference &__first,
    const MdStaticArray<_T2> &__other) {
    return MdLinearAlgebra::mat_multiply<_T1, _T2, _Tfinal>(
        MdStaticArray<_T1>(*__first.__array_reference, __first.offset,
                           __first.shp_offset),
        __other);
}

template <typename _Tfinal, typename _T1, typename _T2>
MdStaticArray<_Tfinal> MdLinearAlgebra::matrix_chain_multiply(
    const MdStaticArray<_T1> &__first,
    const typename MdStaticArray<_T2>::reference &__other) {
    return MdLinearAlgebra::mat_multiply<_T1, _T2, _Tfinal>(
        __first, MdStaticArray<_T2>(*__other.__array_reference, __other.offset,
                                    __other.shp_offset));
}

#endif
