#pragma once
#ifndef _FFT2_HPP_
#define _FFT2_HPP_

#include "../utility/md_math.hpp"
#include "./md_fft.hpp"

/**
 * @note only works for array of power of 2
 */
template <typename T>
MdStaticArray<cdouble> FFT::fft2(const MdStaticArray<T>& _2darray) {
    if (_2darray.get_shape_size() != 2) {
        throw std::runtime_error("Expected dimension to be 2, found " +
                                 std::to_string(_2darray.get_shape_size()));
    }

    // Perform FFT row-wise
    MdStaticArray<cdouble> result(
        {_2darray.get_shape()[0], _2darray.get_shape()[1]}, 0);

    // #pragma omp parallel for
    for (size_t index = 0; index < _2darray.get_shape()[0]; ++index) {
        result[index] = fft(_2darray[index]);
    }

    // #pragma omp parallel for
    for (size_t index = 0; index < result.get_shape()[1]; ++index) {
        MdStaticArray<cdouble> temp(result.get_shape()[0], 0);
        for (size_t j = index, i = 0; j < result.get_size();
             j += result.get_shape()[1], ++i) {
            temp.__array[i] = result.__array[j];
        }
        temp = fft(temp);

        for (size_t j = index, i = 0; j < result.get_size();
             j += result.get_shape()[1], ++i) {
            result.__array[j] = temp.__array[i];
        }
    }

    return result;
}

#endif
