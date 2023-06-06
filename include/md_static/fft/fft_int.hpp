#pragma once
#ifndef _FFT_INT_HPP_
#define _FFT_INT_HPP_

#include "../utility/md_math.hpp"
#include "./md_fft.hpp"

template <typename T>
MdStaticArray<c64> FFT::fft_int(const MdStaticArray<T>& other) {
    auto __dft_internal = [](MdStaticArray<c64>& array, const usize start,
                             const usize end) {
        MdStaticArray<c64> result(end - start, 0);
        const usize n = end - start;
        f64 angle = MdMath::pi_2 / n;
        const c64 wlen = {::cos(angle), -::sin(angle)};
        c64 wstart = wlen;

        for (usize i = start; i < end; ++i) {
            result.__array[0] += array.__array[i];
        }

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

    auto __dft_ret_internal = [](MdStaticArray<c64>& array, const usize start,
                                 const usize end) {
        MdStaticArray<c64> result(end - start, 0);
        const usize n = end - start;
        f64 angle = MdMath::pi_2 / n;
        const c64 wlen = {::cos(angle), -::sin(angle)};
        c64 wstart = wlen;

        for (usize i = start; i < end; ++i) {
            result.__array[0] += array.__array[i];
        }

        for (usize index = 1; index < n; ++index) {
            c64 w = {1, 0};
            for (usize i = start; i < end; ++i) {
                result.__array[index] += array.__array[i] * w;
                w *= wstart;
            }
            wstart *= wlen;
        }

        return result;
    };

    usize n = other.get_size();
    usize i = 0;
    MdStaticArray<c64> input(n);
    if ((n & 1)) {
        for (usize index = 0; index < n; ++index) {
            input.__array[index] = other.__array[index];
        }
        return __dft_ret_internal(input, 0, n);
    } else {
        // Get last zero numbers
        const usize ls = ((n ^ (n - 1)) + 1) >> 1;

        MdStaticArray<usize> indexes(n, 0);

        usize j = 1;
        i = n;
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

        // #pragma omp parallel for
        for (usize index = 0; index < n; ++index) {
            input.__array[index] = other.__array[indexes.__array[index]];
        }

        if (i > 1) {
            for (usize index = 0; index < n; index += i) {
                __dft_internal(input, index, index + i);
            }
        }
    }

    auto __perform_fft_in_place = [](MdStaticArray<c64>& array,
                                     const usize start) {
        usize n = array.get_size();

        for (usize operate_length = (start << 1); operate_length <= n;
             operate_length <<= 1) {
            f64 angle = MdMath::pi_2 / operate_length;
            const c64 init = {::cos(angle), -::sin(angle)};
            // #pragma omp parallel for
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
MdStaticArray<c64> FFT::fft_int(const MdStaticAxisReference<T>& other) {
    auto __dft_internal = [](MdStaticArray<c64>& array, const usize start,
                             const usize end) {
        MdStaticArray<c64> result(end - start, 0);
        const usize n = end - start;
        f64 angle = MdMath::pi_2 / n;
        const c64 wlen = {::cos(angle), -::sin(angle)};
        c64 wstart = wlen;

        for (usize i = start; i < end; ++i) {
            result.__array[0] += array.__array[i];
        }

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

    auto __dft_ret_internal = [](MdStaticArray<c64>& array, const usize start,
                                 const usize end) {
        MdStaticArray<c64> result(end - start, 0);
        const usize n = end - start;
        f64 angle = MdMath::pi_2 / n;
        const c64 wlen = {::cos(angle), -::sin(angle)};
        c64 wstart = wlen;

        for (usize i = start; i < end; ++i) {
            result.__array[0] += array.__array[i];
        }

        for (usize index = 1; index < n; ++index) {
            c64 w = {1, 0};
            for (usize i = start; i < end; ++i) {
                result.__array[index] += array.__array[i] * w;
                w *= wstart;
            }
            wstart *= wlen;
        }

        return result;
    };

    usize n = other.get_size();
    usize i = 0;
    MdStaticArray<c64> input(n);

    if ((n & 1) || n < 16) {
        for (usize index = 0; index < n; ++index) {
            input.__array[index] = other[index];
        }
        return __dft_ret_internal(input, 0, n);
    } else {
        // Get last zero numbers
        const usize ls = ((n ^ (n - 1)) + 1) >> 1;

        MdStaticArray<usize> indexes(n, 0);

        usize j = 1;
        i = n;
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

        // #pragma omp parallel for
        for (usize index = 0; index < n; ++index) {
            input.__array[index] = other[indexes.__array[index]];
        }

        if (i > 1) {
            while (i < 8 && (i << 1 < n)) {
                i <<= 1;
            }

            for (usize index = 0; index < n; index += i) {
                __dft_internal(input, index, index + i);
            }
        }
    }

    auto __perform_fft_in_place = [](MdStaticArray<c64>& array,
                                     const usize start) {
        usize n = array.get_size();
        for (usize operate_length = (start << 1); operate_length <= n;
             operate_length <<= 1) {
            f64 angle = MdMath::pi_2 / operate_length;
            const c64 init = {::cos(angle), -::sin(angle)};
            // #pragma omp parallel for
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
MdStaticArray<c64> FFT::fft_int(const MdStaticArrayReference<T>& other) {
    return fft_int<T>(MdStaticArray<T>(*other.__array_reference, other.offset,
                                       other.shp_offset));
}

#endif
