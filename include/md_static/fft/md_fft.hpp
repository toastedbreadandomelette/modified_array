#pragma once
#ifndef _MD_FFT_HPP_
#define _MD_FFT_HPP_

#include "../../md_complex/md_complex.hpp"
#include "../md_static_array.hpp"

struct FFT {
    /**
     * @note Source:
     * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
     * https://e-maxx.ru/algo/fft_multiply
     * @brief Compute 1 dimensional FFT on 1 dimensional array
     * @tparam _T type of an array
     * @param __other array for which IFFT is to be computed
     * @return values of complex numbers
     */
    template <typename _T>
    static MdStaticArray<cdouble> fft(const MdStaticArray<_T>& __other);

    /**
     * @note Source:
     * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
     * https://e-maxx.ru/algo/fft_multiply
     * @brief Compute 1 dimensional FFT on 1 dimensional array
     * @tparam _T type of an array
     * @param __other array for which FFT is to be computed
     * @return values of complex numbers
     */
    template <typename _T>
    static MdStaticArray<cdouble> fft(
        const MdStaticArrayReference<_T>& __other);

    /**
     * @note Source:
     * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
     * https://e-maxx.ru/algo/fft_multiply
     * @brief Compute 1 dimensional FFT on 1 dimensional array
     * @tparam _T type of an array
     * @param __other array for which FFT is to be computed
     * @return values of complex numbers
     */
    template <typename _T>
    static MdStaticArray<_T> ifft(const MdStaticArray<cdouble>& __other);

    /**
     * @note Source:
     * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
     * https://e-maxx.ru/algo/fft_multiply
     * @brief Compute 1 dimensional FFT on 1 dimensional array
     * @tparam _T type of an array
     * @param __other array for which FFT is to be computed
     * @return values of complex numbers
     */
    template <typename _T>
    static MdStaticArray<_T> ifft(
        const MdStaticArrayReference<cdouble>& __other);

    /**
     * @brief Compute 2 dimensional FFT on 2 dimensional array
     * @tparam _T type of an array
     * @param __other array for which IFFT is to be computed
     * @return values of complex numbers in 2D-array
     */
    template <typename _T>
    static MdStaticArray<cdouble> fft2(const MdStaticArray<_T>& __other);
};

#endif
