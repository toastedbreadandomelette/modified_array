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

    MdStaticArray<cdouble> result(_2darray);

#pragma omp parallel for
    for (size_t index = 0; index < result.shape[0]; ++index) {
        auto axis_reference = result.get_nth_axis_reference(1, index);
        axis_reference = ifft_int(axis_reference);
    }

#pragma omp parallel for
    for (size_t index = 0; index < result.shape[1]; ++index) {
        auto axis_reference = result.get_nth_axis_reference(0, index);
        axis_reference = ifft_int(axis_reference);
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
