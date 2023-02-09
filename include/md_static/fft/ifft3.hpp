#pragma once
#ifndef _IFFT3_HPP_
#define _IFFT3_HPP_

#include "../utility/md_math.hpp"
#include "./ifft_int.hpp"
#include "./md_fft.hpp"

template <typename T>
MdStaticArray<T> FFT::ifft3(const MdStaticArray<cdouble>& array) {
    if (array.get_shape_size() != 3) {
        throw std::runtime_error("Expected dimension to be 2, found " +
                                 std::to_string(array.get_shape_size()));
    }

    // Perform FFT row-wise
    MdStaticArray<cdouble> result(
        {array.shape[0], array.shape[1], array.shape[2]}, 0);

#pragma omp parallel for
    for (size_t i = 0; i < array.shape[0]; ++i) {
        const auto result_ref = result[i], array_ref = array[i];
        for (size_t j = 0; j < array.shape[1]; ++j) {
            result_ref[j] = ifft_int(array_ref[j]);
        }
    }

    const size_t total_1_axes = array.get_size() / array.shape[1];

#pragma omp parallel for
    for (size_t index = 0; index < total_1_axes; ++index) {
        auto axis_1_ref = result.get_nth_axis_reference(1, index);
        axis_1_ref = ifft_int(axis_1_ref);
    }

    const size_t total_0_axes = array.get_size() / array.shape[0];

#pragma omp parallel for
    for (size_t index = 0; index < total_0_axes; ++index) {
        auto axis_0_ref = result.get_nth_axis_reference(0, index);
        axis_0_ref = ifft_int(axis_0_ref);
    }

    result /= result.get_size();

    return MdStaticArray<T>(result);
}

#endif
