#pragma once
#ifndef _IFFTN_HPP_
#define _IFFTN_HPP_

#include "./ifft.hpp"
#include "./ifft2.hpp"
#include "./ifft_int.hpp"
#include "./md_fft.hpp"

template <typename T>
MdStaticArray<T> FFT::ifftn(const MdStaticArray<cdouble>& ndarray) {
    switch (ndarray.get_shape_size()) {
        case 1:
            return FFT::ifft<T>(ndarray);
        case 2:
            return FFT::ifft2<T>(ndarray);
        default:
            break;
    }

    MdStaticArray<cdouble> result(ndarray);

    for (size_t k = 0; k < ndarray.get_shape_size(); ++k) {
        const size_t loop = result.get_axis_reference(k).get_total_axes();

#pragma omp parallel for
        for (size_t index = 0; index < loop; ++index) {
            auto axis_ref = result.get_nth_axis_reference(k, index);
            axis_ref = ifft_int(axis_ref);
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
