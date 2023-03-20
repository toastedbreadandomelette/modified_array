#pragma once
#ifndef _KRON_HPP_
#define _KRON_HPP_

#include "./md_linear_algebra.hpp"

template <typename T1, typename T2, typename T3>
MdStaticArray<T3> MdLinearAlgebra::kron(const MdStaticArray<T1>& __first,
                                        const MdStaticArray<T2>& __other,
                                        const size_t total_threads) {
    std::vector<size_t> overall_shape;
    for (size_t findex = __first.get_shape_size() - 1,
                oindex = __other.get_shape_size() - 1;
         findex >= 0 || oindex >= 0; --findex, --oindex) {
        overall_shape.emplace_back((findex >= 0 ? __first.shape[findex] : 1) *
                                   (oindex >= 0 ? __other.shape[oindex] : 1));
    }

    MdStaticArray<T3> result(overall_shape, 0);

    size_t index = 0;

    // First; perform single threaded one
    const size_t* fsz_ptr = static_cast<size_t*>(
        malloc(sizeof(size_t*) * __first.get_shape_size()));

    for (size_t index = 0; index < __first.get_shape_size(); ++index) {
        fsz_ptr[index] = 0;
    }

    const size_t* osz_ptr = static_cast<size_t*>(
        malloc(sizeof(size_t*) * __other.get_shape_size()));

    for (size_t index = 0; index < __other.get_shape_size(); ++index) {
        osz_ptr[index] = 0;
    }

    auto __perform_kron_internal = [&result, &__first, &__other]() {};

    return result;
}

#endif
