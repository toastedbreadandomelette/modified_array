#pragma once
#ifndef _MULTI_DOT_HPP_
#define _MULTI_DOT_HPP_

#include "./dot.hpp"
#include "./md_linear_algebra.hpp"

template <typename Tfinal, typename T1, typename T2, typename... arg>
MdStaticArray<Tfinal> Linalg::multi_dot(
    const MdStaticArray<T1> &first, const MdStaticArray<T2> &other,
    const MdStaticArray<arg> &...arguments) {
    MdStaticArray<Tfinal> result = Linalg::dot<Tfinal, T1, T2>(first, other);
    return Linalg::multi_dot<Tfinal, Tfinal, arg...>(result, arguments...);
}

template <typename Tfinal, typename T1, typename T2, typename... arg>
MdStaticArray<Tfinal> Linalg::multi_dot(
    const MdStaticArrayReference<T1> &first,
    const MdStaticArrayReference<T2> &other,
    const MdStaticArray<arg> &...arguments) {
    MdStaticArray<Tfinal> result = Linalg::dot<Tfinal, T1, T2>(
        MdStaticArray<T1>(*first.__array_reference, first.offset,
                          first.shp_offset),
        MdStaticArray<T2>(*other.__array_reference, other.offset,
                          other.shp_offset));
    return Linalg::multi_dot<Tfinal, Tfinal, arg...>(result, arguments...);
}

template <typename Tfinal, typename T1, typename T2, typename... arg>
MdStaticArray<Tfinal> Linalg::multi_dot(
    const MdStaticArrayReference<T1> &first, const MdStaticArray<T2> &other,
    const MdStaticArray<arg> &...arguments) {
    MdStaticArray<Tfinal> result = Linalg::dot<Tfinal, T1, T2>(
        MdStaticArray<T1>(*first.__array_reference, first.offset,
                          first.shp_offset),
        other);
    return Linalg::multi_dot<Tfinal, Tfinal, arg...>(result, arguments...);
}

template <typename Tfinal, typename T1, typename T2, typename... arg>
MdStaticArray<Tfinal> Linalg::multi_dot(
    const MdStaticArray<T1> &first, const MdStaticArrayReference<T2> &other,
    const MdStaticArray<arg> &...arguments) {
    MdStaticArray<Tfinal> result = Linalg::dot<Tfinal, T1, T2>(
        first, MdStaticArray<T2>(*other.__array_reference, other.offset,
                                 other.shp_offset));
    return Linalg::multi_dot<Tfinal, Tfinal, arg...>(result, arguments...);
}

////////////////////////////////////////////////////////////////////////////////

template <typename Tfinal, typename T1, typename T2, typename... arg>
MdStaticArray<Tfinal> Linalg::multi_dot(
    const MdStaticArray<T1> &first, const MdStaticArray<T2> &other,
    const MdStaticArrayReference<arg> &...arguments) {
    MdStaticArray<Tfinal> result = Linalg::dot<Tfinal, T1, T2>(first, other);
    return Linalg::multi_dot<Tfinal, Tfinal, arg...>(result, arguments...);
}

template <typename Tfinal, typename T1, typename T2, typename... arg>
MdStaticArray<Tfinal> Linalg::multi_dot(
    const MdStaticArrayReference<T1> &first,
    const MdStaticArrayReference<T2> &other,
    const MdStaticArrayReference<arg> &...arguments) {
    MdStaticArray<Tfinal> result = Linalg::dot<Tfinal, T1, T2>(
        MdStaticArray<T1>(*first.__array_reference, first.offset,
                          first.shp_offset),
        MdStaticArray<T2>(*other.__array_reference, other.offset,
                          other.shp_offset));
    return Linalg::multi_dot<Tfinal, Tfinal, arg...>(result, arguments...);
}

template <typename Tfinal, typename T1, typename T2, typename... arg>
MdStaticArray<Tfinal> Linalg::multi_dot(
    const MdStaticArrayReference<T1> &first, const MdStaticArray<T2> &other,
    const MdStaticArrayReference<arg> &...arguments) {
    MdStaticArray<Tfinal> result = Linalg::dot<Tfinal, T1, T2>(
        MdStaticArray<T1>(*first.__array_reference, first.offset,
                          first.shp_offset),
        other);
    return Linalg::multi_dot<Tfinal, Tfinal, arg...>(result, arguments...);
}

template <typename Tfinal, typename T1, typename T2, typename... arg>
MdStaticArray<Tfinal> Linalg::multi_dot(
    const MdStaticArray<T1> &first, const MdStaticArrayReference<T2> &other,
    const MdStaticArrayReference<arg> &...arguments) {
    MdStaticArray<Tfinal> result = Linalg::dot<Tfinal, T1, T2>(
        first, MdStaticArray<T2>(*other.__array_reference, other.offset,
                                 other.shp_offset));
    return Linalg::multi_dot<Tfinal, Tfinal, arg...>(result, arguments...);
}

template <typename Tfinal, typename T1, typename T2>
MdStaticArray<Tfinal> Linalg::multi_dot(const MdStaticArray<T1> &first,
                                        const MdStaticArray<T2> &other) {
    return Linalg::dot<Tfinal, T1, T2>(first, other);
}

template <typename Tfinal, typename T1, typename T2>
MdStaticArray<Tfinal> Linalg::multi_dot(
    const MdStaticArrayReference<T1> &first,
    const MdStaticArrayReference<T2> &other) {
    return Linalg::dot<Tfinal, T1, T2>(
        MdStaticArray<T1>(*first.__array_reference, first.offset,
                          first.shp_offset),
        MdStaticArray<T2>(*other.__array_reference, other.offset,
                          other.shp_offset));
}

template <typename Tfinal, typename T1, typename T2>
MdStaticArray<Tfinal> Linalg::multi_dot(const MdStaticArrayReference<T1> &first,
                                        const MdStaticArray<T2> &other) {
    return Linalg::dot<Tfinal, T1, T2>(
        MdStaticArray<T1>(*first.__array_reference, first.offset,
                          first.shp_offset),
        other);
}

template <typename Tfinal, typename T1, typename T2>
MdStaticArray<Tfinal> Linalg::multi_dot(
    const MdStaticArray<T1> &first, const MdStaticArrayReference<T2> &other) {
    return Linalg::dot<Tfinal, T1, T2>(
        first, MdStaticArray<T2>(*other.__array_reference, other.offset,
                                 other.shp_offset));
}

#endif
