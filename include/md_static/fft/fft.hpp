#pragma once
#ifndef _FFT_FUNC_HPP_
#define _FFT_FUNC_HPP_

#include <bitset>

#include "../functions/range.hpp"
#include "../utility/md_math.hpp"
#include "./md_fft.hpp"

/**
 * @note
 * 1. Source:
 * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
 * https://e-maxx.ru/algo/fft_multiply
 * 2. Only works for size for 2 to the power index.
 */
template <typename _T>
MdStaticArray<cdouble> FFT::fft(const MdStaticArray<_T>& __other) {
    size_t n = __other.get_size();
    size_t power = static_cast<size_t>(::log2(n));
    MdStaticArray<cdouble> __input;

    if ((n & (n - 1)) != 0) {
        n = (n >> power) << (power + 1);
        ++power;
    }

    __input = MdStaticArray<cdouble>(n, 0);

    /// Reverse the index bits
    // #pragma omp parallel for
    for (size_t index = 1; index < __other.get_size(); ++index) {
        const size_t rindex = MdMath::reverse_bits(index, power);
        __input.__array[rindex] = __other.__array[index];
    }

    auto __perform_fft_in_place = [](MdStaticArray<cdouble>& __1darray) {
        size_t n = __1darray.get_size();

        for (size_t operate_length = 2; operate_length <= n;
             operate_length <<= 1) {
            double angle = 2.0 * MdMath::pi / operate_length;
            const cdouble init = {::cos(angle), ::sin(angle)};
            // #pragma omp parallel for;
            for (size_t i = 0; i < n; i += operate_length) {
                cdouble w = {1, 0};
                for (size_t j = 0; j < operate_length / 2; ++j) {
                    cdouble u = __1darray.__array[i + j];
                    cdouble v =
                        __1darray.__array[i + j + operate_length / 2] * w;
                    __1darray.__array[i + j] = u + v;
                    __1darray.__array[i + j + operate_length / 2] = u - v;
                    w *= init;
                }
            }
        }
    };

    __perform_fft_in_place(__input);

    // MdStaticArray<cdouble> result(__other.get_size());

    // // #pragma omp parallel for
    // for (size_t index = 0; index < result.get_size(); ++index) {
    //     result.__array[index] = __input.__array[index];
    // }

    return __input;
}

template <typename _T>
MdStaticArray<cdouble> FFT::fft(const MdStaticArrayReference<_T>& __other) {
    return fft<_T>(MdStaticArray<_T>(*__other.__array_reference, __other.offset,
                                     __other.shp_offset));
}

#endif
