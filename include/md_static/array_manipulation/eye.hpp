#pragma once
#ifndef _EYE_HPP_
#define _EYE_HPP_

#include "./md_array_manipulation.hpp"

template <typename T>
MdStaticArray<T> MdArrayManipulate::eye(const size_t __rows,
                                        const size_t __cols,
                                        const size_t __koff) {
    const size_t rows = __rows;
    const size_t cols = __cols == -1 ? __rows : __cols;
    MdStaticArray<T> result({rows, cols}, 0);

    size_t out_of_bounds = 0, min_row_col = std::min(rows, cols) - __koff;

    for (size_t index = __koff;
         index < result.get_size() && out_of_bounds < min_row_col;
         index += (cols + 1)) {
         result.__array[index] = 1;
    }

    return result;
}

#endif
