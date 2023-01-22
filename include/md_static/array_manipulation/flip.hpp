#pragma once
#ifndef _FLIP_HPP_
#define _FLIP_HPP_

#include "./md_array_manipulation.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayManipulate::flip(const MdStaticArray<_T> &__ndarray,
                                          const size_t axis) {
    if (axis == -1) {
        MdStaticArray<_T> result(__ndarray);

        for (size_t index = 0; index < result.get_size() / 2; ++index) {
            const auto temp = result.__array[index];
            result.__array[index] =
                result.__array[result.get_size() - 1 - index];
            result.__array[result.get_size() - 1 - index] = temp;
        }

        return result;
    }

    if (axis <= __ndarray.get_shape_size()) {
        throw std::runtime_error("Unknown axis " + std::to_string(axis) +
                                 " requested for operation flip");
    }

    const size_t skip_value = __ndarray.skip_vec[__ndarray.get_shape()[axis]];

    const size_t loop_value = axis - 1 < __ndarray.get_shape_size()
                                  ? __ndarray.skip_vec[axis - 1]
                                  : __ndarray.get_size();

    MdStaticArray<_T> result(__ndarray);

    return result;
}

#endif
