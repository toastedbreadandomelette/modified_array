#pragma once
#ifndef _FFT2_HPP_
#define _FFT2_HPP_

#include "../utility/md_math.hpp"
#include "./md_fft.hpp"

template <typename T>
MdStaticArray<cdouble> FFT::fft_int(const MdStaticArray<T>& __other) {
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
    if ((n & 1) || n < 64) {
        for (size_t index = 0; index < __other.get_size(); ++index) {
            input.__array[index] = __other.__array[index];
        }
        __dft_internal(input, 0, input.get_size());
        return input;
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

        // #pragma omp parallel for
        for (size_t index = 0; index < n; ++index) {
            input.__array[index] = __other.__array[indexes.__array[index]];
        }

        if (i > 1) {
            while (i < 16) {
                i <<= 1;
            }

            for (size_t index = 0; index < n; index += i) {
                __dft_internal(input, index, index + i);
            }
        }
    }

    auto __perform_fft_in_place = [](MdStaticArray<cdouble>& __1darray,
                                     const size_t start) {
        size_t n = __1darray.get_size();

        for (size_t operate_length = (start << 1); operate_length <= n;
             operate_length <<= 1) {
            double angle = MdMath::pi_2 / operate_length;
            const cdouble init = {::cos(angle), -::sin(angle)};
            // #pragma omp parallel for
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

    __perform_fft_in_place(input, i);

    return input;
}

template <typename T>
MdStaticArray<cdouble> FFT::fft_int(const MdStaticArrayReference<T>& __other) {
    return fft_int<T>(MdStaticArray<T>(*__other.__array_reference,
                                       __other.offset, __other.shp_offset));
}

template <typename T>
MdStaticArray<cdouble> FFT::fft2(const MdStaticArray<T>& _2darray) {
    if (_2darray.get_shape_size() != 2) {
        throw std::runtime_error("Expected dimension to be 2, found " +
                                 std::to_string(_2darray.get_shape_size()));
    }

    // Perform FFT row-wise
    MdStaticArray<cdouble> result(
        {_2darray.get_shape()[0], _2darray.get_shape()[1]}, 0);

#pragma omp parallel for
    for (size_t index = 0; index < _2darray.get_shape()[0]; ++index) {
        result[index] = fft_int<T>(_2darray[index]);
    }

#pragma omp parallel for
    for (size_t index = 0; index < result.get_shape()[1]; ++index) {
        MdStaticArray<cdouble> temp(result.get_shape()[0], 0);
        for (size_t j = index, i = 0; j < result.get_size();
             j += result.get_shape()[1], ++i) {
            temp.__array[i] = result.__array[j];
        }
        temp = fft_int(temp);

        for (size_t j = index, i = 0; j < result.get_size();
             j += result.get_shape()[1], ++i) {
            result.__array[j] = temp.__array[i];
        }
    }

    return result;
}

template <typename T>
MdStaticArray<cdouble> FFT::fft2(const MdStaticArrayReference<T>& array_ref) {
    return FFT::fft2(MdStaticArray<T>(*array_ref.__array_reference,
                                      array_ref.offset, array_ref.shp_offset));
}
#endif
