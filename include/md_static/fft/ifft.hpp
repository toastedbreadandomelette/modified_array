#pragma once
#ifndef _IFFT_HPP_
#define _IFFT_HPP_

#include "./md_fft.hpp"

/**
 * @note Source:
 * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
 * https://e-maxx.ru/algo/fft_multiply
 */
template <typename _T>
MdStaticArray<_T> FFT::ifft(const MdStaticArray<cdouble>& __other) {
    size_t n = __other.get_size();
    size_t power = static_cast<size_t>(std::log2(n));
    MdStaticArray<cdouble> __input;

    if ((n & (n - 1)) != 0) {
        power = static_cast<size_t>(std::log2(n));
        n = (__other.get_size() >> (power)) << (power + 1);
        ++power;
    }

    __input = MdStaticArray<cdouble>(n, 0);
#pragma omp parallel for
    for (size_t index = 0; index < __other.get_size(); ++index) {
        const size_t rindex = reverse_bits(index, power);
        if (rindex < __other.get_size()) {
            __input.__array[index] = __other.__array[rindex];
        }
    }

    auto __perform_fft_in_place = [](MdStaticArray<cdouble>& __1darray,
                                     const size_t bit_size) {
        /// Reverse the bitwise indexes
        size_t n = __1darray.get_size();

        for (size_t operate_length = 2; operate_length <= n;
             operate_length <<= 1) {
            double angle = 2.0 * pi / operate_length;
            const cdouble init = {std::cos(angle), std::sin(angle)};
#pragma omp parallel for
            for (size_t i = 0; i < n; i += operate_length) {
                cdouble w = {1, 0};
                for (size_t j = 0; j < operate_length / 2; ++j) {
                    cdouble u = __1darray.__array[i + j],
                            v = __1darray.__array[i + j + operate_length / 2] *
                                w;
                    __1darray.__array[i + j] = u + v;
                    __1darray.__array[i + j + operate_length / 2] = u - v;
                    w *= init;
                }
            }
        }

        __1darray /= __1darray.get_size();
    };

    __perform_fft_in_place(__input, power);

    MdStaticArray<_T> result(__other.get_size());

    for (size_t index = 0; index < result.get_size(); ++index) {
        result.__array[index] = __input.__array[index];
    }

    return result;
}

template <typename _T>
MdStaticArray<_T> FFT::ifft(const MdStaticArrayReference<cdouble>& __values) {
    return ifft<_T>(MdStaticArray<_T>(*__values.__array_reference,
                                      __values.offset, __values.shp_offset));
}

#endif
