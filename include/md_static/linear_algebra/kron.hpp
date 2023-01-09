#pragma once
#ifndef _KRON_HPP_
#define _KRON_HPP_

#include "./md_linear_algebra.hpp"

template <typename _T1, typename _T2, typename _T3>
MdStaticArray<_T3> MdLinearAlgebra::kron(const MdStaticArray<_T1>& __first,
                                         const MdStaticArray<_T2>& __other,
                                         const size_t total_threads) {
    std::vector<size_t> overall_shape;
    for (size_t findex = __first.get_shape_size() - 1,
                oindex = __other.get_shape_size() - 1;
         findex >= 0 || oindex >= 0; --findex, --oindex) {
        overall_shape.emplace_back(
            (findex >= 0 ? __first.get_shape()[findex] : 1) *
            (oindex >= 0 ? __other.get_shape()[oindex] : 1));
    }

    MdStaticArray<_T3> result(overall_shape, 0);

    size_t index = 0;

    return result;
}

#endif
