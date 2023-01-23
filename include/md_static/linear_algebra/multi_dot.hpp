#pragma once
#ifndef _MULTI_DOT_HPP_
#define _MULTI_DOT_HPP_

#include "./dot.hpp"
#include "./md_linear_algebra.hpp"

template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
MdStaticArray<_Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArray<_T1> &__first, const MdStaticArray<_T2> &__other,
    const MdStaticArray<arg> &...arguments) {
    MdStaticArray<_Tfinal> result =
        MdLinearAlgebra::dot<_Tfinal, _T1, _T2>(__first, __other);
    return MdLinearAlgebra::multi_dot<_Tfinal, _Tfinal, arg...>(result,
                                                                arguments...);
}

template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
MdStaticArray<_Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArrayReference<_T1> &__first,
    const MdStaticArrayReference<_T2> &__other,
    const MdStaticArray<arg> &...arguments) {
    MdStaticArray<_Tfinal> result = MdLinearAlgebra::dot<_Tfinal, _T1, _T2>(
        MdStaticArray<_T1>(*__first.__array_reference, __first.offset,
                           __first.shp_offset),
        MdStaticArray<_T2>(*__other.__array_reference, __other.offset,
                           __other.shp_offset));
    return MdLinearAlgebra::multi_dot<_Tfinal, _Tfinal, arg...>(result,
                                                                arguments...);
}

template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
MdStaticArray<_Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArrayReference<_T1> &__first,
    const MdStaticArray<_T2> &__other, const MdStaticArray<arg> &...arguments) {
    MdStaticArray<_Tfinal> result = MdLinearAlgebra::dot<_Tfinal, _T1, _T2>(
        MdStaticArray<_T1>(*__first.__array_reference, __first.offset,
                           __first.shp_offset),
        __other);
    return MdLinearAlgebra::multi_dot<_Tfinal, _Tfinal, arg...>(result,
                                                                arguments...);
}

template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
MdStaticArray<_Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArray<_T1> &__first,
    const MdStaticArrayReference<_T2> &__other,
    const MdStaticArray<arg> &...arguments) {
    MdStaticArray<_Tfinal> result = MdLinearAlgebra::dot<_Tfinal, _T1, _T2>(
        __first, MdStaticArray<_T2>(*__other.__array_reference, __other.offset,
                                    __other.shp_offset));
    return MdLinearAlgebra::multi_dot<_Tfinal, _Tfinal, arg...>(result,
                                                                arguments...);
}

////////////////////////////////////////////////////////////////////////////////

template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
MdStaticArray<_Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArray<_T1> &__first, const MdStaticArray<_T2> &__other,
    const MdStaticArrayReference<arg> &...arguments) {
    MdStaticArray<_Tfinal> result =
        MdLinearAlgebra::dot<_Tfinal, _T1, _T2>(__first, __other);
    return MdLinearAlgebra::multi_dot<_Tfinal, _Tfinal, arg...>(result,
                                                                arguments...);
}

template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
MdStaticArray<_Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArrayReference<_T1> &__first,
    const MdStaticArrayReference<_T2> &__other,
    const MdStaticArrayReference<arg> &...arguments) {
    MdStaticArray<_Tfinal> result = MdLinearAlgebra::dot<_Tfinal, _T1, _T2>(
        MdStaticArray<_T1>(*__first.__array_reference, __first.offset,
                           __first.shp_offset),
        MdStaticArray<_T2>(*__other.__array_reference, __other.offset,
                           __other.shp_offset));
    return MdLinearAlgebra::multi_dot<_Tfinal, _Tfinal, arg...>(result,
                                                                arguments...);
}

template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
MdStaticArray<_Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArrayReference<_T1> &__first,
    const MdStaticArray<_T2> &__other,
    const MdStaticArrayReference<arg> &...arguments) {
    MdStaticArray<_Tfinal> result = MdLinearAlgebra::dot<_Tfinal, _T1, _T2>(
        MdStaticArray<_T1>(*__first.__array_reference, __first.offset,
                           __first.shp_offset),
        __other);
    return MdLinearAlgebra::multi_dot<_Tfinal, _Tfinal, arg...>(result,
                                                                arguments...);
}

template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
MdStaticArray<_Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArray<_T1> &__first,
    const MdStaticArrayReference<_T2> &__other,
    const MdStaticArrayReference<arg> &...arguments) {
    MdStaticArray<_Tfinal> result = MdLinearAlgebra::dot<_Tfinal, _T1, _T2>(
        __first, MdStaticArray<_T2>(*__other.__array_reference, __other.offset,
                                    __other.shp_offset));
    return MdLinearAlgebra::multi_dot<_Tfinal, _Tfinal, arg...>(result,
                                                                arguments...);
}

template <typename _Tfinal, typename _T1, typename _T2>
MdStaticArray<_Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArray<_T1> &__first, const MdStaticArray<_T2> &__other) {
    return MdLinearAlgebra::dot<_Tfinal, _T1, _T2>(__first, __other);
}

template <typename _Tfinal, typename _T1, typename _T2>
MdStaticArray<_Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArrayReference<_T1> &__first,
    const MdStaticArrayReference<_T2> &__other) {
    return MdLinearAlgebra::dot<_Tfinal, _T1, _T2>(
        MdStaticArray<_T1>(*__first.__array_reference, __first.offset,
                           __first.shp_offset),
        MdStaticArray<_T2>(*__other.__array_reference, __other.offset,
                           __other.shp_offset));
}

template <typename _Tfinal, typename _T1, typename _T2>
MdStaticArray<_Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArrayReference<_T1> &__first,
    const MdStaticArray<_T2> &__other) {
    return MdLinearAlgebra::dot<_Tfinal, _T1, _T2>(
        MdStaticArray<_T1>(*__first.__array_reference, __first.offset,
                           __first.shp_offset),
        __other);
}

template <typename _Tfinal, typename _T1, typename _T2>
MdStaticArray<_Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArray<_T1> &__first,
    const MdStaticArrayReference<_T2> &__other) {
    return MdLinearAlgebra::dot<_Tfinal, _T1, _T2>(
        __first, MdStaticArray<_T2>(*__other.__array_reference, __other.offset,
                                    __other.shp_offset));
}

#endif
