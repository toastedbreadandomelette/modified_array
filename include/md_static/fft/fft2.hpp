#pragma once
#ifndef _FFT2_HPP_
#define _FFT2_HPP_

#include "../utility/md_math.hpp"
#include "./fft_int.hpp"
#include "./md_fft.hpp"

template <typename T>
MdStaticArray<cdouble> FFT::fft2(const MdStaticArray<T>& _2darray) {
    if (_2darray.get_shape_size() != 2) {
        throw std::runtime_error("Expected dimension to be 2, found " +
                                 std::to_string(_2darray.get_shape_size()));
    }

    // Perform FFT row-wise
    MdStaticArray<cdouble> result({_2darray.shape[0], _2darray.shape[1]}, 0);

#pragma omp parallel for
    for (size_t index = 0; index < _2darray.shape[0]; ++index) {
        result[index] = fft_int<T>(_2darray[index]);
    }

#pragma omp parallel for
    for (size_t index = 0; index < result.shape[1]; ++index) {
        MdStaticArray<cdouble> temp(result.shape[0]);
        for (size_t j = index, i = 0; j < result.get_size();
             j += result.get_shape()[1], ++i) {
            temp.__array[i] = result.__array[j];
        }
        temp = fft_int(temp);

        for (size_t j = index, i = 0; j < result.get_size();
             j += result.get_shape()[1], ++i) {
            result.__array[j] = temp.__array[i];
        }
    }

    return result;
}

template <typename T>
MdStaticArray<cdouble> FFT::fft2(const MdStaticArrayReference<T>& array_ref) {
    return FFT::fft2(MdStaticArray<T>(*array_ref.__array_reference,
                                      array_ref.offset, array_ref.shp_offset));
}

#endif
