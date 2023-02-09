#pragma once
#ifndef _FFT3_HPP_
#define _FFT3_HPP_

#include "../utility/md_math.hpp"
#include "./fft_int.hpp"
#include "./md_fft.hpp"

template <typename T>
MdStaticArray<cdouble> FFT::fft3(const MdStaticArray<T>& array) {
    if (array.get_shape_size() != 3) {
        throw std::runtime_error("Expected dimension to be 2, found " +
                                 std::to_string(array.get_shape_size()));
    }

    // Perform FFT row-wise
    MdStaticArray<cdouble> result(
        {array.shape[0], array.shape[1], array.shape[2]}, 0);

    // last axes calculation
#pragma omp parallel for
    for (size_t i = 0; i < array.shape[0]; ++i) {
        const auto result_ref = result[i], array_ref = array[i];
        for (size_t j = 0; j < array.shape[1]; ++j) {
            result_ref[j] = fft_int<T>(array_ref[j]);
        }
    }

    const size_t total_1_axes = array.get_size() / array.shape[1];

#pragma omp parallel for
    for (size_t index = 0; index < total_1_axes; ++index) {
        auto axis_1_ref = result.get_nth_axis_reference(1, index);
        axis_1_ref = fft_int(axis_1_ref);
    }

    const size_t total_0_axes = array.get_size() / array.shape[0];

#pragma omp parallel for
    for (size_t index = 0; index < total_0_axes; ++index) {
        auto axis_0_ref = result.get_nth_axis_reference(0, index);
        axis_0_ref = fft_int(axis_0_ref);
    }
    return result;
}

template <typename T>
MdStaticArray<cdouble> FFT::fft3(const MdStaticArrayReference<T>& array_ref) {
    return FFT::fft3(MdStaticArray<T>(*array_ref.__array_reference,
                                      array_ref.offset, array_ref.shp_offset));
}
#endif
