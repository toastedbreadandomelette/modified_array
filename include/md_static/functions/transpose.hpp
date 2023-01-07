#pragma once
#ifndef _TRANSPOSE_HPP_
#define _TRANSPOSE_HPP_
#include "./md_static_array_utility.hpp"

template <typename _T1, typename _T2>
MdStaticArray<_T2> MdArrayUtility::transpose(
    const MdStaticArray<_T1> &__first) {
    if (__first.get_shape_size() != 2) {
        throw std::runtime_error("Matrix Error: Expected dimension 2.");
    }
    MdStaticArray<_T2> result({__first.shape[1], __first.shape[0]}, 0);

    for (size_t res_index = 0; res_index < __first.shape[1]; ++res_index) {
        for (size_t f_index = res_index, incr = 0; f_index < __first.get_size();
             f_index += __first.shape[1], ++incr) {
            result.__array[res_index * __first.shape[0] + incr] =
                __first.__array[f_index];
        }
    }

    return result;
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::transpose(
    const typename MdStaticArray<_T>::reference &__values) {
    return MdArrayUtility::transpose<_T>(MdStaticArray<_T>(
        *__values.__array_reference, __values.offset, __values.shp_offset));
}

#endif
