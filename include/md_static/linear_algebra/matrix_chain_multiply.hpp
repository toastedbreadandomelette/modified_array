#pragma once
#ifndef _MATRIX_CHAIN_MULTIPLY_HPP_
#define _MATRIX_CHAIN_MULTIPLY_HPP_

#include "./mat_multiply.hpp"
#include "./md_linear_algebra.hpp"

template <typename Tf, typename T1, typename T2, typename... arg>
Array<Tf> Linalg::matrix_chain_multiply(const Array<T1> &__first,
                                        const Array<T2> &__other,
                                        const Array<arg> &...arguments) {
    Array<Tf> result = Linalg::mat_multiply<Tf, T1, T2>(__first, __other);
    return Linalg::matrix_chain_multiply<Tf, Tf, arg...>(result, arguments...);
}

template <typename Tf, typename T1, typename T2, typename... arg>
Array<Tf> Linalg::matrix_chain_multiply(const Reference<T1> &__first,
                                        const Reference<T2> &__other,
                                        const Array<arg> &...arguments) {
    Array<Tf> result = Linalg::mat_multiply<Tf, T1, T2>(
        Array<T1>(*__first.__array_reference, __first.offset,
                  __first.shp_offset),
        Array<T2>(*__other.__array_reference, __other.offset,
                  __other.shp_offset));
    return Linalg::matrix_chain_multiply<Tf, Tf, arg...>(result, arguments...);
}

template <typename Tf, typename T1, typename T2, typename... arg>
Array<Tf> Linalg::matrix_chain_multiply(const Reference<T1> &__first,
                                        const Array<T2> &__other,
                                        const Array<arg> &...arguments) {
    Array<Tf> result = Linalg::mat_multiply<Tf, T1, T2>(
        Array<T1>(*__first.__array_reference, __first.offset,
                  __first.shp_offset),
        __other);
    return Linalg::matrix_chain_multiply<Tf, Tf, arg...>(result, arguments...);
}

template <typename Tf, typename T1, typename T2, typename... arg>
Array<Tf> Linalg::matrix_chain_multiply(const Array<T1> &__first,
                                        const Reference<T2> &__other,
                                        const Array<arg> &...arguments) {
    Array<Tf> result = Linalg::mat_multiply<Tf, T1, T2>(
        __first, Array<T2>(*__other.__array_reference, __other.offset,
                           __other.shp_offset));
    return Linalg::matrix_chain_multiply<Tf, Tf, arg...>(result, arguments...);
}

////////////////////////////////////////////////////////////////////////////////

template <typename Tf, typename T1, typename T2, typename... arg>
Array<Tf> Linalg::matrix_chain_multiply(const Array<T1> &__first,
                                        const Array<T2> &__other,
                                        const Reference<arg> &...arguments) {
    Array<Tf> result = Linalg::mat_multiply<Tf, T1, T2>(__first, __other);
    return Linalg::matrix_chain_multiply<Tf, Tf, arg...>(result, arguments...);
}

template <typename Tf, typename T1, typename T2, typename... arg>
Array<Tf> Linalg::matrix_chain_multiply(const Reference<T1> &__first,
                                        const Reference<T2> &__other,
                                        const Reference<arg> &...arguments) {
    Array<Tf> result = Linalg::mat_multiply<Tf, T1, T2>(
        Array<T1>(*__first.__array_reference, __first.offset,
                  __first.shp_offset),
        Array<T2>(*__other.__array_reference, __other.offset,
                  __other.shp_offset));
    return Linalg::matrix_chain_multiply<Tf, Tf, arg...>(result, arguments...);
}

template <typename Tf, typename T1, typename T2, typename... arg>
Array<Tf> Linalg::matrix_chain_multiply(const Reference<T1> &__first,
                                        const Array<T2> &__other,
                                        const Reference<arg> &...arguments) {
    Array<Tf> result = Linalg::mat_multiply<Tf, T1, T2>(
        Array<T1>(*__first.__array_reference, __first.offset,
                  __first.shp_offset),
        __other);
    return Linalg::matrix_chain_multiply<Tf, Tf, arg...>(result, arguments...);
}

template <typename Tf, typename T1, typename T2, typename... arg>
Array<Tf> Linalg::matrix_chain_multiply(const Array<T1> &__first,
                                        const Reference<T2> &__other,
                                        const Reference<arg> &...arguments) {
    Array<Tf> result = Linalg::mat_multiply<Tf, T1, T2>(
        __first, Array<T2>(*__other.__array_reference, __other.offset,
                           __other.shp_offset));
    return Linalg::matrix_chain_multiply<Tf, Tf, arg...>(result, arguments...);
}

template <typename Tf, typename T1, typename T2>
Array<Tf> Linalg::matrix_chain_multiply(const Array<T1> &__first,
                                        const Array<T2> &__other) {
    return Linalg::mat_multiply<Tf, T1, T2>(__first, __other);
}

template <typename Tf, typename T1, typename T2>
Array<Tf> Linalg::matrix_chain_multiply(const Reference<T1> &__first,
                                        const Reference<T2> &__other) {
    return Linalg::mat_multiply<Tf, T1, T2>(
        Array<T1>(*__first.__array_reference, __first.offset,
                  __first.shp_offset),
        Array<T2>(*__other.__array_reference, __other.offset,
                  __other.shp_offset));
}

template <typename Tf, typename T1, typename T2>
Array<Tf> Linalg::matrix_chain_multiply(const Reference<T1> &__first,
                                        const Array<T2> &__other) {
    return Linalg::mat_multiply<Tf, T1, T2>(
        Array<T1>(*__first.__array_reference, __first.offset,
                  __first.shp_offset),
        __other);
}

template <typename Tf, typename T1, typename T2>
Array<Tf> Linalg::matrix_chain_multiply(const Array<T1> &__first,
                                        const Reference<T2> &__other) {
    return Linalg::mat_multiply<Tf, T1, T2>(
        __first, Array<T2>(*__other.__array_reference, __other.offset,
                           __other.shp_offset));
}

#endif
