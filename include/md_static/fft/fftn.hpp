#pragma once
#ifndef _FFTN_HPP_
#define _FFTN_HPP_

#include "../utility/md_math.hpp"
#include "./fft.hpp"
#include "./fft2.hpp"
#include "./fft3.hpp"
#include "./fft_int.hpp"
#include "./md_fft.hpp"

template <typename _T>
MdStaticArray<cdouble> FFT::fftn(const MdStaticArray<_T>& ndarray) {
    switch (ndarray.get_shape_size()) {
        case 1:
            return FFT::fft(ndarray);
        case 2:
            return FFT::fft2(ndarray);
        case 3:
            return FFT::fft3(ndarray);
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

        temp = fft_int(temp);

        for (size_t j = 0; j < ndarray.shape[0]; ++j) {
            result.__array[i + ndarray.skip_vec[0] * j] = temp.__array[j];
        }
    }

    // std::cout << "here\n";
    // Perform ndarray FFT
    for (size_t k = 1; k < ndarray.get_shape_size(); ++k) {
        const auto element_loop = ndarray.skip_vec[k],
                   total_iterations = ndarray.skip_vec[k - 1];

        if (result.get_size() / total_iterations > 64) {
#pragma omp paralllel for
            for (size_t i = 0; i < result.get_size(); i += total_iterations) {
                for (size_t j = 0; j < element_loop; ++j) {
                    MdStaticArray<cdouble> temp(result.shape[k]);
                    for (size_t l = 0; l < ndarray.shape[k]; ++l) {
                        temp.__array[l] =
                            result.__array[i + j + ndarray.skip_vec[k] * l];
                    }

                    temp = fft_int(temp);

                    for (size_t l = 0; l < ndarray.shape[k]; ++l) {
                        result.__array[i + j + ndarray.skip_vec[k] * l] =
                            temp.__array[l];
                    }
                }
            }
        } else {
            for (size_t i = 0; i < result.get_size(); i += total_iterations) {
                for (size_t j = 0; j < element_loop; ++j) {
                    MdStaticArray<cdouble> temp(result.shape[k]);
                    for (size_t l = 0; l < ndarray.shape[k]; ++l) {
                        temp.__array[l] =
                            result.__array[i + j + ndarray.skip_vec[k] * l];
                    }

                    temp = fft_int(temp);

                    for (size_t l = 0; l < ndarray.shape[k]; ++l) {
                        result.__array[i + j + ndarray.skip_vec[k] * l] =
                            temp.__array[l];
                    }
                }
            }
        }
    }

    return result;
}

template <typename T>
MdStaticArray<cdouble> FFT::fftn(const MdStaticArrayReference<T>& ndarray) {
    return FFT::fftn(MdStaticArray<T>(*ndarray.__array_reference,
                                      ndarray.offset, ndarray.shp_offset));
}

#endif
