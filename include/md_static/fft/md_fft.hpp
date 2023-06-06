#pragma once
#ifndef _MD_FFT_HPP_
#define _MD_FFT_HPP_

#include "../../md_complex/md_complex.hpp"
#include "../md_static_array/md_static_array.hpp"
#include "../md_static_array/md_static_axis_reference.hpp"

struct FFT {
 private:
    /**
     * @note Source:
     * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
     * https://e-maxx.ru/algo/fft_multiply
     * @brief Compute 1 dimensional FFT on 1 dimensional array
     * @tparam T type of an array
     * @param other array for which IFFT is to be computed
     * @return values of complex numbers
     */
    template <typename T>
    static MdStaticArray<c64> fft_int(const MdStaticArray<T>& other);

    /**
     * @note Source:
     * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
     * https://e-maxx.ru/algo/fft_multiply
     * @brief Compute 1 dimensional FFT on 1 dimensional array
     * @tparam T type of an array
     * @param other array for which FFT is to be computed
     * @return values of complex numbers
     */
    template <typename T>
    static MdStaticArray<c64> fft_int(const MdStaticArrayReference<T>& other);

    /**
     * @note Source:
     * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
     * https://e-maxx.ru/algo/fft_multiply
     * @brief Compute 1 dimensional FFT on 1 dimensional array
     * @tparam T type of an array
     * @param other array for which IFFT is to be computed
     * @return values of complex numbers
     */
    template <typename T>
    static MdStaticArray<c64> fft_int(const MdStaticAxisReference<T>& other);

    /**
     * @note Source:
     * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
     * https://e-maxx.ru/algo/fft_multiply
     * @brief Compute 1 dimensional FFT on 1 dimensional array
     * @tparam T type of an array
     * @param other array for which FFT is to be computed
     * @return values of complex numbers
     */
    static MdStaticArray<c64> ifft_int(const MdStaticArray<c64>& other);

    /**
     * @note Source:
     * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
     * https://e-maxx.ru/algo/fft_multiply
     * @brief Compute 1 dimensional FFT on 1 dimensional array
     * @tparam T type of an array
     * @param other array for which FFT is to be computed
     * @return values of complex numbers
     */
    static MdStaticArray<c64> ifft_int(
        const MdStaticArrayReference<c64>& other);

    /**
     * @note Source:
     * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
     * https://e-maxx.ru/algo/fft_multiply
     * @brief Compute 1 dimensional FFT on 1 dimensional array
     * @tparam T type of an array
     * @param other array for which FFT is to be computed
     * @return values of complex numbers
     */
    static MdStaticArray<c64> ifft_int(const MdStaticAxisReference<c64>& other);

 public:
    /**
     * @note Source:
     * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
     * https://e-maxx.ru/algo/fft_multiply
     * @brief Compute 1 dimensional FFT on 1 dimensional array
     * @tparam T type of an array
     * @param other array for which IFFT is to be computed
     * @return values of complex numbers
     */
    template <typename T>
    static MdStaticArray<c64> fft(const MdStaticArray<T>& other);

    /**
     * @note Source:
     * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
     * https://e-maxx.ru/algo/fft_multiply
     * @brief Compute 1 dimensional FFT on 1 dimensional array
     * @tparam T type of an array
     * @param other array for which FFT is to be computed
     * @return values of complex numbers
     */
    template <typename T>
    static MdStaticArray<c64> fft(const MdStaticArrayReference<T>& other);

    /**
     * @note Source:
     * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
     * https://e-maxx.ru/algo/fft_multiply
     * @brief Compute 1 dimensional FFT on 1 dimensional array
     * @tparam T type of an array
     * @param other array for which FFT is to be computed
     * @return values of complex numbers
     */
    template <typename T>
    static MdStaticArray<T> ifft(const MdStaticArray<c64>& other);

    /**
     * @note Source:
     * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
     * https://e-maxx.ru/algo/fft_multiply
     * @brief Compute 1 dimensional FFT on 1 dimensional array
     * @tparam T type of an array
     * @param other array for which FFT is to be computed
     * @return values of complex numbers
     */
    template <typename T>
    static MdStaticArray<T> ifft(const MdStaticArrayReference<c64>& other);

    /**
     * @brief Compute 2 dimensional FFT on 2 dimensional array
     * @tparam T type of an array
     * @param other array for which IFFT is to be computed
     * @return values of complex numbers in 2D-array
     */
    template <typename T>
    static MdStaticArray<c64> fft2(const MdStaticArray<T>& other);

    /**
     * @brief Compute 2 dimensional FFT on 2 dimensional array
     * @tparam T type of an array
     * @param other array for which IFFT is to be computed
     * @return values of complex numbers in 2D-array
     */
    template <typename T>
    static MdStaticArray<c64> fft2(const MdStaticArrayReference<T>& other);

    /**
     * @brief Compute 2 dimensional FFT on 2 dimensional array
     * @tparam T type of an array
     * @param other array for which IFFT is to be computed
     * @return values of complex numbers in 2D-array
     */
    template <typename T>
    static MdStaticArray<T> ifft2(const MdStaticArray<c64>& other);

    /**
     * @brief Compute 2 dimensional FFT on 2 dimensional array
     * @tparam T type of an array
     * @param other array for which IFFT is to be computed
     * @return values of complex numbers in 2D-array
     */
    template <typename T>
    static MdStaticArray<T> ifft2(const MdStaticArrayReference<c64>& other);

    /**
     * @brief Compute n dimensional FFT on n dimensional array
     * @tparam T type of an array
     * @param other array for which IFFT is to be computed
     * @return values of complex numbers in 2D-array
     */
    template <typename T>
    static MdStaticArray<c64> fftn(const MdStaticArray<T>& other);

    /**
     * @brief Compute n dimensional FFT on n dimensional array
     * @tparam T type of an array
     * @param other array for which IFFT is to be computed
     * @return values of complex numbers in 2D-array
     */
    template <typename T>
    static MdStaticArray<c64> fftn(const MdStaticArrayReference<T>& other);

    /**
     * @brief Compute n dimensional FFT on n dimensional array
     * @tparam T type of an array
     * @param other array for which IFFT is to be computed
     * @return values of complex numbers in nD-array
     */
    template <typename T>
    static MdStaticArray<T> ifftn(const MdStaticArray<c64>& other);

    /**
     * @brief Compute n dimensional FFT on n dimensional array
     * @tparam T type of an array
     * @param other array for which IFFT is to be computed
     * @return values of complex numbers in ND-array
     */
    template <typename T>
    static MdStaticArray<T> ifftn(const MdStaticArrayReference<c64>& other);
};

#endif
