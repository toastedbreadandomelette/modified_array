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
 */
template <class T>
Array<c64> FFT::fft(const Array<T>& other) {
    auto __dft_internal = [](Array<c64>& array, const usize start,
                             const usize end) {
        Array<c64> result(end - start, 0);
        const usize n = end - start;
        f64 angle = MdMath::pi_2 / n;
        const c64 wlen = {::cos(angle), -::sin(angle)};
        c64 wstart = wlen;

        for (usize i = start; i < end; ++i) {
            result.__array[0] += array.__array[i];
        }
        // #pragma omp parallel for
        for (usize index = 1; index < n; ++index) {
            c64 w = {1, 0};
            for (usize i = start; i < end; ++i) {
                result.__array[index] += array.__array[i] * w;
                w *= wstart;
            }
            wstart *= wlen;
        }

        for (usize index = start; index < end; ++index) {
            array.__array[index] = result.__array[index - start];
        }
    };

    usize n = other.get_size(), i = 0;
    Array<c64> input(n, 0);
    if ((n & 1) || n < 64) {
        for (usize index = 0; index < other.get_size(); ++index) {
            input.__array[index] = other.__array[index];
        }
        __dft_internal(input, 0, input.get_size());
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

#pragma omp parallel for
        for (usize index = 0; index < n; ++index) {
            input.__array[index] = other.__array[indexes.__array[index]];
        }

        if (i > 1) {
            // #pragma omp parallel for
            for (usize index = 0; index < n; index += i) {
                __dft_internal(input, index, index + i);
            }
        }
    }

    auto __perform_fft_in_place = [](Array<c64>& array, const usize start) {
        usize n = array.get_size();

        for (usize operate_length = (start << 1); operate_length <= n;
             operate_length <<= 1) {
            f64 angle = 2.0 * MdMath::pi / operate_length;
            const c64 init = {::cos(angle), -::sin(angle)};
#pragma omp parallel for
            for (usize i = 0; i < n; i += operate_length) {
                c64 w = {1, 0};
                for (usize j = 0; j < operate_length / 2; ++j) {
                    c64 u = array.__array[i + j];
                    c64 v = array.__array[i + j + operate_length / 2] * w;
                    array.__array[i + j] = u + v;
                    array.__array[i + j + operate_length / 2] = u - v;
                    w *= init;
                }
            }
        }
    };

    __perform_fft_in_place(input, i);

    return input;
}

template <typename T>
Array<c64> FFT::fft(const Reference<T>& other) {
    return fft<T>(
        Array<T>(*other.__array_reference, other.offset, other.shp_offset));
}

#endif
