#pragma once
#ifndef _EYE_HPP_
#define _EYE_HPP_

#include "./md_array_manipulation.hpp"

template <typename T>
MdStaticArray<T> Manip::eye(const size_t rows, const size_t cols,
                            const size_t koff) {
    const size_t r = rows, c = (cols == -1 ? rows : cols), incr = c + 1;
    MdStaticArray<T> result({rows, cols}, 0);

    for (size_t index = koff; index < result.get_size(); index += incr) {
        result.__array[index] = 1;
    }

    return result;
}

#endif
