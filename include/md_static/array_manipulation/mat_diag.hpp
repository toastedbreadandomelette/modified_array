#pragma once
#ifndef _MAT_DIAG_HPP_
#define _MAT_DIAG_HPP_

#include "./md_array_manipulation.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayManipulate::mat_diag(
    const MdStaticArray<_T>& __2darray, const size_t __koff) {
    if (__2darray.get_shape_size() != 2) {
        throw std::runtime_error(
            "Given input should be of dimension 2. Found dimension " +
            std::to_string(__2darray.get_shape_size()) + ".");
    }

    const size_t rows = __2darray.get_shape()[0];
    const size_t cols = __2darray.get_shape()[1];

    size_t out_of_bounds = 0, min_row_col = std::min(rows, cols) > __koff
                                                ? std::min(rows, cols) - __koff
                                                : 0;

    MdStaticArray<_T> result(min_row_col);

    for (size_t index = __koff, res_index = 0; res_index < result.get_size();
         index += (cols + 1), ++res_index) {
        result.__array[res_index] = __2darray.__array[index];
    }

    return result;
}

template <typename _T>
MdStaticArray<_T> MdArrayManipulate::mat_diag(
    const MdStaticArrayReference<_T>& __2darray, const size_t __koff) {
    return mat_diag<_T>(
        MdStaticArray<_T>(*__2darray.__array_reference, __2darray.offset,
                          __2darray.shp_offset),
        __koff);
}

#endif
