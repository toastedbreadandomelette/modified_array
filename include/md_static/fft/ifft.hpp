#pragma once
#ifndef _IFFT_HPP_
#define _IFFT_HPP_

#include "../utility/md_math.hpp"
#include "./md_fft.hpp"

/**
 * @note Source:
 * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
 * https://e-maxx.ru/algo/fft_multiply
 */
template <typename T>
MdStaticArray<T> FFT::ifft(const MdStaticArray<cdouble>& __other) {
    auto __dft_internal = [](MdStaticArray<cdouble>& array, const size_t start,
                             const size_t end) {
        MdStaticArray<cdouble> result(end - start, 0);
        const size_t n = end - start;
        double angle = MdMath::pi_2 / n;
        const cdouble wlen = {::cos(angle), -::sin(angle)};
        cdouble wstart = wlen;

        for (size_t i = start; i < end; ++i) {
            result.__array[0] += array.__array[i];
        }
        // #pragma omp parallel for
        for (size_t index = 1; index < n; ++index) {
            cdouble w = {1, 0};
            for (size_t i = start; i < end; ++i) {
                result.__array[index] += array.__array[i] * w;
                w *= wstart;
            }
            wstart *= wlen;
        }

        for (size_t index = start; index < end; ++index) {
            array.__array[index] = result.__array[index - start];
        }
    };

    size_t n = __other.get_size();
    size_t i = 0;
    MdStaticArray<cdouble> input(n, 0);
    if (n & 1) {
        MdStaticArray<cdouble> __input(n, 0);
        for (size_t index = 1; index < __other.get_size(); ++index) {
            __input.__array[index] = __other.__array[index];
        }
        __dft_internal(__input, 0, __input.get_size());
        return __input;
    } else {
        // Get last zero numbers
        const size_t ls = ((n ^ (n - 1)) + 1) >> 1;

        MdStaticArray<size_t> indexes(n, 0);

        i = n;
        size_t j = 1;
        while ((i & 1) == 0) {
            for (size_t k = (i >> 1); k < i; ++k) {
                indexes.__array[k] = j;
            }
            i >>= 1;
            j <<= 1;
        }

        for (size_t k = 1; k < i; ++k) {
            indexes.__array[k] = indexes.__array[k - 1] + ls;
            indexes.__array[k + (n >> 1)] = indexes.__array[k] + 1;
        }
        for (size_t index = i; index < (n >> 1); index <<= 1) {
            for (size_t k = 0; k < index; ++k) {
                indexes.__array[k + index] += indexes.__array[k];
                indexes.__array[k + index + (n >> 1)] =
                    indexes.__array[k + index] + 1;
            }
        }

        for (size_t index = 0; index < n; ++index) {
            input.__array[index] = __other.__array[indexes.__array[index]];
        }

        if (i > 1) {
#pragma omp parallel for
            for (size_t index = 0; index < n; index += i) {
                __dft_internal(input, index, index + i);
            }

            if (input.get_size() == i) {
                input /= input.get_size();
            }
        }
    }

    auto __perform_fft_in_place = [](MdStaticArray<cdouble>& __1darray,
                                     const size_t start) {
        size_t n = __1darray.get_size();

        for (size_t operate_length = (start << 1); operate_length <= n;
             operate_length <<= 1) {
            double angle = 2.0 * MdMath::pi / operate_length;
            const cdouble init = {::cos(angle), -::sin(angle)};
#pragma omp parallel for
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
        __1darray /= __1darray.get_size();
    };

    __perform_fft_in_place(input, i);

    MdStaticArray<T> result(n, 0);
    result.__array[0] = input.__array[0];
    for (size_t index = 1; index < n; ++index) {
        result.__array[index] = input.__array[n - index];
    }
    return result;
}

template <typename _T>
MdStaticArray<_T> FFT::ifft(const MdStaticArrayReference<cdouble>& __values) {
    return ifft<_T>(MdStaticArray<_T>(*__values.__array_reference,
                                      __values.offset, __values.shp_offset));
}

#endif
