#pragma once
#ifndef _FFT_FUNC_HPP_
#define _FFT_FUNC_HPP_

#include <bitset>

#include "../../utility/math.hpp"
#include "../functions/range.hpp"
#include "./fft/c64.hpp"
#include "./md_fft.hpp"

/**
 * @note
 * 1. Source:
 * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
 * https://e-maxx.ru/algo/fft_multiply
 */
template <class T>
Array<c64> FFT::fft(const Array<T>& other) {
    usize n = other.get_size(), i = 0;
    Array<c64> input(n, 0);
    if ((n & 1) || n <= 64) {
        for (usize index = 0; index < n; ++index) {
            input.__array[index] = other.__array[index];
        }
        // __dft_internal(input, 0, n);
        dft_subarray_inplace(input.__array, 0, n);
        return input;
    } else {
        // Get last zero numbers
        const usize ls = ((n ^ (n - 1)) + 1) >> 1;

        Array<usize> indexes(n, 0);

        i = n;
        usize j = 1;
        while ((i & 1) == 0) {
            for (usize k = (i >> 1); k < i; ++k) {
                indexes.__array[k] = j;
            }
            i >>= 1;
            j <<= 1;
        }

        for (usize k = 1; k < i; ++k) {
            indexes.__array[k] = indexes.__array[k - 1] + ls;
            indexes.__array[k + (n >> 1)] = indexes.__array[k] + 1;
        }
        for (usize index = i; index < (n >> 1); index <<= 1) {
            for (usize k = 0; k < index; ++k) {
                indexes.__array[k + index] += indexes.__array[k];
                indexes.__array[k + index + (n >> 1)] =
                    indexes.__array[k + index] + 1;
            }
        }

        for (usize index = 0; index < n; ++index) {
            input.__array[index] = other.__array[indexes.__array[index]];
        }
    }
    if (i > 1) {
        for (usize index = 0; index < n; index += i) {
            // __dft_internal(input, index, index + i);
            dft_subarray_inplace(input.__array, index, index + i);
        }
        fft_inplace(input.__array, n, i);
    } else {
        fft_inplace(input.__array, n, i);
    }

    // __perform_fft_in_place(input, i);

    return input;
}

template <typename T>
Array<c64> FFT::fft(const ArraySlice<T>& other) {
    return fft<T>(
        Array<T>(*other.__array_reference, other.offset, other.shp_offset));
}

#endif
