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

#pragma omp parallel for
    for (size_t i = 0; i < array.shape[0]; ++i) {
        size_t start = i * array.skip_vec[0];
        MdStaticArray<cdouble> temp(result.shape[1]);
        for (size_t j = 0; j < array.shape[2]; ++j) {
            for (size_t k = 0; k < array.shape[1]; ++k) {
                temp.__array[k] =
                    result.__array[start + j + array.skip_vec[1] * k];
            }

            temp = ifft_int(temp);

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

        temp = ifft_int(temp);

        for (size_t j = 0; j < array.shape[0]; ++j) {
            result.__array[i + array.skip_vec[0] * j] = temp.__array[j];
        }
    }

    result /= result.get_size();

    return MdStaticArray<T>(result);
}

#endif
