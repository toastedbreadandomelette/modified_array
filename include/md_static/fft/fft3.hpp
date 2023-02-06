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

#pragma omp parallel for
    for (size_t i = 0; i < array.shape[0]; ++i) {
        const auto result_ref = result[i], array_ref = array[i];
        for (size_t j = 0; j < array.shape[1]; ++j) {
            result_ref[j] = fft_int<T>(array_ref[j]);
        }
    }

#pragma omp parallel for
    for (size_t i = 0; i < array.shape[0]; ++i) {
        size_t start = i * array.skip_vec[0];
        for (size_t j = 0; j < array.shape[2]; ++j) {
            MdStaticArray<cdouble> temp(result.shape[1]);
            for (size_t k = 0; k < array.shape[1]; ++k) {
                temp.__array[k] =
                    result.__array[start + j + array.skip_vec[1] * k];
            }

            temp = fft_int(temp);

            for (size_t k = 0; k < array.shape[1]; ++k) {
                result.__array[start + j + array.skip_vec[1] * k] =
                    temp.__array[k];
            }
        }
    }

#pragma omp parallel for
    for (size_t i = 0; i < array.skip_vec[0]; ++i) {
        MdStaticArray<cdouble> temp(result.shape[0]);
        for (size_t j = 0; j < array.shape[0]; ++j) {
            temp.__array[j] = result.__array[i + array.skip_vec[0] * j];
        }

        temp = fft_int(temp);

        for (size_t j = 0; j < array.shape[0]; ++j) {
            result.__array[i + array.skip_vec[0] * j] = temp.__array[j];
        }
    }

    return result;
}

template <typename T>
MdStaticArray<cdouble> FFT::fft3(const MdStaticArrayReference<T>& array_ref) {
    return FFT::fft3(MdStaticArray<T>(*array_ref.__array_reference,
                                      array_ref.offset, array_ref.shp_offset));
}
#endif
