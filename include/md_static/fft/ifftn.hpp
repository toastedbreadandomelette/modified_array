#pragma once
#ifndef _IFFTN_HPP_
#define _IFFTN_HPP_

#include "../utility/md_math.hpp"
#include "./ifft.hpp"
#include "./ifft2.hpp"
#include "./ifft3.hpp"
#include "./ifft_int.hpp"
#include "./md_fft.hpp"

template <typename T>
MdStaticArray<T> FFT::ifftn(const MdStaticArray<cdouble>& ndarray) {
    switch (ndarray.get_shape_size()) {
        case 1:
            return FFT::ifft<T>(ndarray);
        case 2:
            return FFT::ifft2<T>(ndarray);
        case 3:
            return FFT::ifft3<T>(ndarray);
        default:
            break;
    }

    std::vector<size_t> shape;
    for (size_t i = 0; i < ndarray.get_shape_size(); ++i) {
        shape.push_back(ndarray.shape[i]);
    }

    MdStaticArray<cdouble> result(shape, 0);

#pragma omp paralllel for
    for (size_t i = 0; i < ndarray.skip_vec[0]; ++i) {
        MdStaticArray<cdouble> temp(result.shape[0]);
        for (size_t j = 0; j < ndarray.shape[0]; ++j) {
            temp.__array[j] = ndarray.__array[i + ndarray.skip_vec[0] * j];
        }

        temp = ifft_int(temp);

        for (size_t j = 0; j < ndarray.shape[0]; ++j) {
            result.__array[i + ndarray.skip_vec[0] * j] = temp.__array[j];
        }
    }

    // Perform ndarray FFT
    for (size_t k = 1; k < ndarray.get_shape_size(); ++k) {
        const auto element_loop = ndarray.skip_vec[k],
                   total_iterations = ndarray.skip_vec[k - 1];

        MdStaticArray<cdouble> temp(result.shape[k]);
        // #pragma omp paralllel for
        for (size_t i = 0; i < result.get_size(); i += total_iterations) {
            for (size_t j = 0; j < element_loop; ++j) {
                for (size_t l = 0; l < ndarray.shape[k]; ++l) {
                    temp.__array[l] =
                        result.__array[i + j + ndarray.skip_vec[k] * l];
                }

                temp = ifft_int(temp);

                for (size_t l = 0; l < ndarray.shape[k]; ++l) {
                    result.__array[i + j + ndarray.skip_vec[k] * l] =
                        temp.__array[l];
                }
            }
        }
    }

    result /= result.get_size();

    return result;
}

template <typename T>
MdStaticArray<T> FFT::ifftn(const MdStaticArrayReference<cdouble>& ndarray) {
    return FFT::ifftn<T>(MdStaticArray<cdouble>(
        *ndarray.__array_reference, ndarray.offset, ndarray.shp_offset));
}

#endif
