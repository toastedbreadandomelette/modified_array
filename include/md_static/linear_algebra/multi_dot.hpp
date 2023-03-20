#pragma once
#ifndef _MULTI_DOT_HPP_
#define _MULTI_DOT_HPP_

#include "./dot.hpp"
#include "./md_linear_algebra.hpp"

template <typename Tfinal, typename T1, typename T2, typename... arg>
MdStaticArray<Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArray<T1> &__first, const MdStaticArray<T2> &__other,
    const MdStaticArray<arg> &...arguments) {
    MdStaticArray<Tfinal> result =
        MdLinearAlgebra::dot<Tfinal, T1, T2>(__first, __other);
    return MdLinearAlgebra::multi_dot<Tfinal, Tfinal, arg...>(result,
                                                              arguments...);
}

template <typename Tfinal, typename T1, typename T2, typename... arg>
MdStaticArray<Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArrayReference<T1> &__first,
    const MdStaticArrayReference<T2> &__other,
    const MdStaticArray<arg> &...arguments) {
    MdStaticArray<Tfinal> result = MdLinearAlgebra::dot<Tfinal, T1, T2>(
        MdStaticArray<T1>(*__first.__array_reference, __first.offset,
                          __first.shp_offset),
        MdStaticArray<T2>(*__other.__array_reference, __other.offset,
                          __other.shp_offset));
    return MdLinearAlgebra::multi_dot<Tfinal, Tfinal, arg...>(result,
                                                              arguments...);
}

template <typename Tfinal, typename T1, typename T2, typename... arg>
MdStaticArray<Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArrayReference<T1> &__first, const MdStaticArray<T2> &__other,
    const MdStaticArray<arg> &...arguments) {
    MdStaticArray<Tfinal> result = MdLinearAlgebra::dot<Tfinal, T1, T2>(
        MdStaticArray<T1>(*__first.__array_reference, __first.offset,
                          __first.shp_offset),
        __other);
    return MdLinearAlgebra::multi_dot<Tfinal, Tfinal, arg...>(result,
                                                              arguments...);
}

template <typename Tfinal, typename T1, typename T2, typename... arg>
MdStaticArray<Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArray<T1> &__first, const MdStaticArrayReference<T2> &__other,
    const MdStaticArray<arg> &...arguments) {
    MdStaticArray<Tfinal> result = MdLinearAlgebra::dot<Tfinal, T1, T2>(
        __first, MdStaticArray<T2>(*__other.__array_reference, __other.offset,
                                   __other.shp_offset));
    return MdLinearAlgebra::multi_dot<Tfinal, Tfinal, arg...>(result,
                                                              arguments...);
}

////////////////////////////////////////////////////////////////////////////////

template <typename Tfinal, typename T1, typename T2, typename... arg>
MdStaticArray<Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArray<T1> &__first, const MdStaticArray<T2> &__other,
    const MdStaticArrayReference<arg> &...arguments) {
    MdStaticArray<Tfinal> result =
        MdLinearAlgebra::dot<Tfinal, T1, T2>(__first, __other);
    return MdLinearAlgebra::multi_dot<Tfinal, Tfinal, arg...>(result,
                                                              arguments...);
}

template <typename Tfinal, typename T1, typename T2, typename... arg>
MdStaticArray<Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArrayReference<T1> &__first,
    const MdStaticArrayReference<T2> &__other,
    const MdStaticArrayReference<arg> &...arguments) {
    MdStaticArray<Tfinal> result = MdLinearAlgebra::dot<Tfinal, T1, T2>(
        MdStaticArray<T1>(*__first.__array_reference, __first.offset,
                          __first.shp_offset),
        MdStaticArray<T2>(*__other.__array_reference, __other.offset,
                          __other.shp_offset));
    return MdLinearAlgebra::multi_dot<Tfinal, Tfinal, arg...>(result,
                                                              arguments...);
}

template <typename Tfinal, typename T1, typename T2, typename... arg>
MdStaticArray<Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArrayReference<T1> &__first, const MdStaticArray<T2> &__other,
    const MdStaticArrayReference<arg> &...arguments) {
    MdStaticArray<Tfinal> result = MdLinearAlgebra::dot<Tfinal, T1, T2>(
        MdStaticArray<T1>(*__first.__array_reference, __first.offset,
                          __first.shp_offset),
        __other);
    return MdLinearAlgebra::multi_dot<Tfinal, Tfinal, arg...>(result,
                                                              arguments...);
}

template <typename Tfinal, typename T1, typename T2, typename... arg>
MdStaticArray<Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArray<T1> &__first, const MdStaticArrayReference<T2> &__other,
    const MdStaticArrayReference<arg> &...arguments) {
    MdStaticArray<Tfinal> result = MdLinearAlgebra::dot<Tfinal, T1, T2>(
        __first, MdStaticArray<T2>(*__other.__array_reference, __other.offset,
                                   __other.shp_offset));
    return MdLinearAlgebra::multi_dot<Tfinal, Tfinal, arg...>(result,
                                                              arguments...);
}

template <typename Tfinal, typename T1, typename T2>
MdStaticArray<Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArray<T1> &__first, const MdStaticArray<T2> &__other) {
    return MdLinearAlgebra::dot<Tfinal, T1, T2>(__first, __other);
}

template <typename Tfinal, typename T1, typename T2>
MdStaticArray<Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArrayReference<T1> &__first,
    const MdStaticArrayReference<T2> &__other) {
    return MdLinearAlgebra::dot<Tfinal, T1, T2>(
        MdStaticArray<T1>(*__first.__array_reference, __first.offset,
                          __first.shp_offset),
        MdStaticArray<T2>(*__other.__array_reference, __other.offset,
                          __other.shp_offset));
}

template <typename Tfinal, typename T1, typename T2>
MdStaticArray<Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArrayReference<T1> &__first,
    const MdStaticArray<T2> &__other) {
    return MdLinearAlgebra::dot<Tfinal, T1, T2>(
        MdStaticArray<T1>(*__first.__array_reference, __first.offset,
                          __first.shp_offset),
        __other);
}

template <typename Tfinal, typename T1, typename T2>
MdStaticArray<Tfinal> MdLinearAlgebra::multi_dot(
    const MdStaticArray<T1> &__first,
    const MdStaticArrayReference<T2> &__other) {
    return MdLinearAlgebra::dot<Tfinal, T1, T2>(
        __first, MdStaticArray<T2>(*__other.__array_reference, __other.offset,
                                   __other.shp_offset));
}

#endif
