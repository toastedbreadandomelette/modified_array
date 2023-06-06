#pragma once
#ifndef _KRON_HPP_
#define _KRON_HPP_

#include "./md_linear_algebra.hpp"

template <typename T1, typename T2, typename T3>
MdStaticArray<T3> Linalg::kron(const MdStaticArray<T1>& first,
                               const MdStaticArray<T2>& other,
                               const usize total_threads) {
    std::vector<usize> overall_shape;
    for (usize findex = first.get_shape_size() - 1,
               oindex = other.get_shape_size() - 1;
         findex >= 0 || oindex >= 0; --findex, --oindex) {
        overall_shape.emplace_back((findex >= 0 ? first.shape[findex] : 1) *
                                   (oindex >= 0 ? other.shape[oindex] : 1));
    }

    MdStaticArray<T3> result(overall_shape, 0);

    usize index = 0;

    // First; perform single threaded one
    const usize* fsz_ptr =
        static_cast<usize*>(malloc(sizeof(usize*) * first.get_shape_size()));

    for (usize index = 0; index < first.get_shape_size(); ++index) {
        fsz_ptr[index] = 0;
    }

    const usize* osz_ptr =
        static_cast<usize*>(malloc(sizeof(usize*) * other.get_shape_size()));

    for (usize index = 0; index < other.get_shape_size(); ++index) {
        osz_ptr[index] = 0;
    }

    auto __perform_kron_internal = [&result, &first, &other]() {};

    return result;
}

#endif
