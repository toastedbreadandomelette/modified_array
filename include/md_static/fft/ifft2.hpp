#pragma once
#ifndef _IFFT2_HPP_
#define _IFFT2_HPP_

#include "../utility/md_math.hpp"
#include "./ifft_int.hpp"
#include "./md_fft.hpp"

template <typename T>
MdStaticArray<T> FFT::ifft2(const MdStaticArray<cdouble>& _2darray) {
    if (_2darray.get_shape_size() != 2) {
        throw std::runtime_error("Expected dimension to be 2, found " +
                                 std::to_string(_2darray.get_shape_size()));
    }

    // Perform FFT row-wise
    MdStaticArray<cdouble> result(
        {_2darray.get_shape()[0], _2darray.get_shape()[1]}, 0);

#pragma omp parallel for
    for (size_t index = 0; index < _2darray.get_shape()[0]; ++index) {
        result[index] = FFT::ifft_int(_2darray[index]);
    }

#pragma omp parallel for
    for (size_t index = 0; index < result.get_shape()[1]; ++index) {
        MdStaticArray<cdouble> temp(result.get_shape()[0], 0);
        for (size_t j = index, i = 0; j < result.get_size();
             j += result.get_shape()[1], ++i) {
            temp.__array[i] = result.__array[j];
        }
        temp = FFT::ifft_int(temp);

        for (size_t j = index, i = 0; j < result.get_size();
             j += result.get_shape()[1], ++i) {
            result.__array[j] = temp.__array[i];
        }
    }

    result /= result.get_size();

    return MdStaticArray<T>(result);
}

template <typename T>
MdStaticArray<T> FFT::ifft2(const MdStaticArrayReference<cdouble>& array_ref) {
    return FFT::ifft2(MdStaticArray<T>(*array_ref.__array_reference,
                                       array_ref.offset, array_ref.shp_offset));
}

#endif
