#pragma once
#ifndef _MAT_DIAG_HPP_
#define _MAT_DIAG_HPP_

#include "./md_array_manipulation.hpp"

template <typename T>
Array<T> Manip::mat_diag(const Array<T>& matrix,
                                 const usize offset) {
    if (matrix.get_shape_size() != 2) {
        throw std::runtime_error(
            "Given input should be of dimension 2. Found dimension " +
            std::to_string(matrix.get_shape_size()) + ".");
    }

    const usize rows = matrix.get_shape()[0];
    const usize cols = matrix.get_shape()[1];

    usize out_of_bounds = 0, min_row_col = std::min(rows, cols) > offset
                                               ? std::min(rows, cols) - offset
                                               : 0;

    Array<T> result(min_row_col);

    for (usize index = offset, res_index = 0; res_index < result.get_size();
         index += (cols + 1), ++res_index) {
        result.__array[res_index] = matrix.__array[index];
    }

    return result;
}

template <typename T>
Array<T> Manip::mat_diag(const ArraySlice<T>& matrix,
                                 const usize offset) {
    return mat_diag<T>(Array<T>(*matrix.__array_reference,
                                        matrix.offset, matrix.shp_offset),
                       offset);
}

#endif
