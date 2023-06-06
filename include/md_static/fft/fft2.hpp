#pragma once
#ifndef _FFT2_HPP_
#define _FFT2_HPP_

#include "./fft_int.hpp"
#include "./md_fft.hpp"

template <typename T>
Array<c64> FFT::fft2(const Array<T>& mat) {
    if (mat.get_shape_size() != 2) {
        throw std::runtime_error("Expected dimension to be 2, found " +
                                 std::to_string(mat.get_shape_size()));
    }

    // Perform FFT row-wise
    Array<c64> result(mat);

#pragma omp parallel for
    for (usize index = 0; index < result.shape[0]; ++index) {
        auto axis_reference = result.get_nth_axis_reference(1, index);
        axis_reference = fft_int(axis_reference);
    }

#pragma omp parallel for
    for (usize index = 0; index < result.shape[1]; ++index) {
        auto axis_reference = result.get_nth_axis_reference(0, index);
        axis_reference = fft_int(axis_reference);
    }

    return result;
}

template <typename T>
Array<c64> FFT::fft2(const Reference<T>& array_ref) {
    return FFT::fft2(Array<T>(*array_ref.__array_reference, array_ref.offset,
                              array_ref.shp_offset));
}

#endif
