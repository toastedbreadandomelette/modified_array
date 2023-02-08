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

    MdStaticArray<cdouble> result(ndarray);

    // Perform ndarray FFT
    for (size_t k = 0; k < ndarray.get_shape_size(); ++k) {
        // if (result.get_size() / total_iterations > 64) {
        // MdStaticArray<cdouble> temp(result.shape[k]);
        auto axis_reference = result.get_axis_reference(k);
        // #pragma omp paralllel for
        do {
            axis_reference = ifft_int(axis_reference);
        } while ((axis_reference.switch_to_next_axis_index()));
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
