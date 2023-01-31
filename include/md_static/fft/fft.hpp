#pragma once
#ifndef _FFT_FUNC_HPP_
#define _FFT_FUNC_HPP_

#include <bitset>

#include "../functions/range.hpp"
#include "./md_fft.hpp"

constexpr double pi = 3.14159265358979323846;

constexpr inline size_t reverse_bits(const size_t n, const size_t bit_size) {
    size_t rn = (n << 32) | (n >> 32);
    rn = ((rn << 16) & 0xFFFF0000FFFF0000) | ((rn >> 16) & 0x0000FFFF0000FFFF);
    rn = ((rn << 8) & 0xFF00FF00FF00FF00) | ((rn >> 8) & 0x00FF00FF00FF00FF);
    rn = ((rn << 4) & 0xF0F0F0F0F0F0F0F0) | ((rn >> 4) & 0x0F0F0F0F0F0F0F0F);
    rn = ((rn << 2) & 0xCCCCCCCCCCCCCCCC) | ((rn >> 2) & 0x3333333333333333);
    rn = ((rn << 1) & 0xAAAAAAAAAAAAAAAA) | ((rn >> 1) & 0x5555555555555555);
    return (rn >> (64 - bit_size));
}

/**
 * @note Source:
 * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
 * https://e-maxx.ru/algo/fft_multiply
 */
template <typename _T>
MdStaticArray<cdouble> FFT::fft(const MdStaticArray<_T>& __other) {
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

    auto __perform_fft_in_place = [](MdStaticArray<cdouble>& __1darray) {
        /// Reverse the bitwise indexes
        size_t n = __1darray.get_size();

        for (size_t operate_length = 2; operate_length <= n;
             operate_length <<= 1) {
            double angle = 2.0 * pi / operate_length;
            const cdouble init = {std::cos(angle), -std::sin(angle)};
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
    };

    __perform_fft_in_place(__input);

    MdStaticArray<cdouble> result(__other.get_size());

#pragma omp parallel for
    for (size_t index = 0; index < result.get_size(); ++index) {
        result.__array[index] = __input.__array[index];
    }

    return result;
}

template <typename _T>
MdStaticArray<cdouble> FFT::fft(const MdStaticArrayReference<_T>& __other) {
    return fft<_T>(MdStaticArray<_T>(*__other.__array_reference, __other.offset,
                                     __other.shp_offset));
}

#endif
