#pragma once
#ifndef _FFTN_HPP_
#define _FFTN_HPP_

#include "./fft.hpp"
#include "./fft2.hpp"
#include "./fft_int.hpp"
#include "./md_fft.hpp"

template <typename T>
MdStaticArray<cdouble> FFT::fftn(const MdStaticArray<T>& ndarray) {
    switch (ndarray.get_shape_size()) {
        case 1:
            return FFT::fft(ndarray);
        case 2:
            return FFT::fft2(ndarray);
        default:
            break;
    }

    MdStaticArray<cdouble> result(ndarray);
    // Perform ndarray FFT
    for (size_t k = 0; k < ndarray.get_shape_size(); ++k) {
        const size_t loop = result.get_axis_reference(k).get_total_axes();

#pragma omp parallel for
        for (size_t index = 0; index < loop; ++index) {
            auto axis_ref = result.get_nth_axis_reference(k, index);
            axis_ref = fft_int(axis_ref);
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
