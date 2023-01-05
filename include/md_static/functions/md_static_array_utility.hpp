#pragma once
#ifndef _MD_STATIC_ARRAY_UTILITY_HPP_
#define _MD_STATIC_ARRAY_UTILITY_HPP_
#include <functional>

#include "../md_static_array.hpp"

struct MdArrayUtility {
    /**
     * @brief Execute a one-to-one mapping function of an array,
     * @tparam _T array type
     * @tparam _func variable function that maps the values
     * @param __values values to map
     * @param function_exec function to execute
     * @returns Array of elements
     */
    template <typename _T>
    static MdStaticArray<_T> map(
        const MdStaticArray<_T> &__values,
        const std::function<_T(const _T &)> &function_exec);

    /**
     * @brief Reduce array of values to a single value function.
     * @todo: Merge along mentioned axis
     * @tparam _T type of array
     * @param __values values to perform
     * @param function_exec function to execute (arguments are previous value
     * and current value)
     * @param init, value to initialize before accumulate.
     * @returns single value
     */
    template <typename _T, typename _func>
    static _T reduce(const MdStaticArray<_T> &__values,
                     const _func &function_exec, const _T init);

    /**
     * @brief Execute accumulate function, and merge these values based on
     * merge function
     * @todo: Merge along mentioned axis
     * @tparam _T type of array
     * @param __values values to perform
     * @param function_exec function to execute (arguments are previous value
     * and current value)
     * @param init, value to initialize before accumulate.
     * @returns single value
     */
    template <typename _T, typename _func, typename _merge_func>
    static _T accumulate_and_merge_fn(const MdStaticArray<_T> &__values,
                                      const _func &function_exec,
                                      const _merge_func &merge_func,
                                      const _T init);

    /**
     * @brief sqrt of all values in list __values
     * @param __values list of values
     * @returns List of values
     */
    template <typename _T>
    static MdStaticArray<_T> sqrt(const MdStaticArray<_T> &__values);

    /**
     * @brief absolute values of all values in list __values
     * @param __values list of values
     * @returns List of values
     */
    template <typename _T>
    static MdStaticArray<_T> abs(const MdStaticArray<_T> &__values);

    /**
     * @brief Sum of all the values in the list __values
     * @param __values List of all values
     * @param init value to be initialized with
     * @return single number
     */
    template <typename _T>
    static _T sum(const MdStaticArray<_T> &__values, const _T init = 0);

    /**
     * @brief Mean of all the values in the list __values
     * @param __values List of all values
     * @param init value to be initialized with
     * @return single number
     */
    template <typename _T>
    static long double mean(const MdStaticArray<_T> &__values,
                            const _T init = 0);

    /**
     * @brief Root Mean Square of all the values in the list __values
     * @param __values List of all values
     * @param init value to be initialized with
     * @return single number
     */
    template <typename _T>
    static long double rms(const MdStaticArray<_T> &__values,
                           const _T init = 0);

    /**
     * @brief Standard Deviation of all the values in the list __values
     * @param __values List of all values
     * @param init value to be initialized with
     * @return single number
     */
    template <typename _T>
    static long double std_dev(const MdStaticArray<_T> &__values);

    /**
     * @brief compute log of values to the base 10
     */
    template <typename _T>
    static MdStaticArray<_T> log10(const MdStaticArray<_T> &__values);

    /**
     * @brief compute log of values to the base 2
     */
    template <typename _T>
    static MdStaticArray<_T> log2(const MdStaticArray<_T> &__values);

    /**
     * @brief compute natural logarithm of valuess
     */
    template <typename _T>
    static MdStaticArray<_T> log(const MdStaticArray<_T> &__values);

    /**
     * @brief compute mod power of integers
     */
    template <typename _T, class = typename std::enable_if<
                               std::is_integral<_T>::value>::type>
    static MdStaticArray<_T> mod_pow(const MdStaticArray<_T> &__values,
                                     const size_t power, const size_t _mod);

    /**
     * @brief compute mod power of integer raise to array of values
     * @tparam _T type of integer values in array
     * @param n a number value
     * @param __values list of exponents
     * @param _mod value to perform mod_power
     * @returns list of values
     */
    template <typename _T, class = typename std::enable_if<
                               std::is_integral<_T>::value>::type>
    static MdStaticArray<_T> mod_pow(const uint64_t n,
                                     const MdStaticArray<_T> &__values,
                                     const size_t _mod);

    /**
     * @brief compute power of values
     * @tparam _T type of array
     * @param __values array of values to compute
     * @param power exponent
     * @returns new arrays with value raise to power
     */
    template <typename _T>
    static MdStaticArray<_T> pow(const MdStaticArray<_T> &__values,
                                 double power);

    /**
     * @brief compute sine of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed sine values
     */
    template <typename _T>
    static MdStaticArray<_T> sin(const MdStaticArray<_T> &__values);

    /**
     * @brief compute sine of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed sine values
     */
    template <typename _T>
    static MdStaticArray<_T> cos(const MdStaticArray<_T> &__values);

    /**
     * @brief compute cosine of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename _T>
    static MdStaticArray<_T> tan(const MdStaticArray<_T> &__values);

    /**
     * @brief compute cotangent of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed cotangent values
     */
    template <typename _T>
    static MdStaticArray<_T> cot(const MdStaticArray<_T> &__values);

    /**
     * @brief compute secant of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed secant values
     */
    template <typename _T>
    static MdStaticArray<_T> sec(const MdStaticArray<_T> &__values);

    /**
     * @brief compute cosecant of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed cosecant values
     */
    template <typename _T>
    static MdStaticArray<_T> cosec(const MdStaticArray<_T> &__values);

    /**
     * @brief compute inverse sin of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed inverse sin
     */
    template <typename _T>
    static MdStaticArray<_T> arcsin(const MdStaticArray<_T> &__values);

    /**
     * @brief compute inverse cos of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed inverse cos
     */
    template <typename _T>
    static MdStaticArray<_T> arccos(const MdStaticArray<_T> &__values);

    /**
     * @brief compute tan inverse of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed inverse tan
     */
    template <typename _T>
    static MdStaticArray<_T> arctan(const MdStaticArray<_T> &__values);

    /**
     * @brief Generate evenly spaced values
     * @tparam _T type of array
     * @param start start value for the array, if end and spacing is not
     * specified, $start$ will be the size of the array
     * @param end upper limit of the array
     *
     */
    template <typename _T, class = typename std::enable_if<
                               std::is_arithmetic<_T>::value>::type>
    static MdStaticArray<_T> range(const _T start, const _T end = -1,
                                   const _T spacing = 0);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam _T1 type of __first array
     * @tparam _T2 type of __other array
     * @tparam _T3 type of result array
     * @param __first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param __other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _T1, typename _T2, typename _T3>
    static MdStaticArray<_T3> dot(const MdStaticArray<_T1> &__first,
                                  const MdStaticArray<_T2> &__other,
                                  const size_t threads = 16);

    /**
     * @brief Multiply two matrices
     * @tparam _T1 type of first matrix
     * @tparam _T2 type of second matrix
     * @tparam _T3 type of third matrix (upto user)
     * @param __first first matrix
     * @param __other second matrix
     * @param threads (optional) number of threads to operate on
     * @returns new matrix of type _T3
     * @throws Runtime error when
     *  1. matrix dimensions do not match
     *  2. size of second axis of __first is not equal to size of first axis
     * of
     * __other
     */
    template <typename _T1, typename _T2, typename _T3>
    static MdStaticArray<_T3> mat_multiply(const MdStaticArray<_T1> &__first,
                                           const MdStaticArray<_T2> &__other,
                                           const size_t threads = 16);

    /**
     * @brief Transpose of matrix: creates a new transposed array
     * @todo Perform for nd array
     * @tparam _T1 type of __first array
     * @tparam _T2 type of result array
     * @param __first first 2d array of shape (a1, a2) (m are
     * total dimensions of array a)
     * @returns new 2d array of shape (a2, a1)
     */
    template <typename _T1, typename _T2>
    static MdStaticArray<_T2> transpose(const MdStaticArray<_T1> &__other);

    /**
     * @brief Create a identity matrix
     * @param _T type for matrix
     * @param n size of matrix
     * @returns a n x n matrix
     */
    template <typename _T>
    static MdStaticArray<_T> identity(size_t n);

    /**
     * @brief Verify if matrix is boolean
     * @param _T matrix type
     * @param __other test matrix
     * @return true if matrix is identity, else false
     */
    template <typename _T>
    static bool is_identity(const MdStaticArray<_T> &__other);

    /**
     * @brief Cumulative sum of an array.
     * @tparam _T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename _T>
    static MdStaticArray<_T> cumulative_sum(const MdStaticArray<_T> &__array);
};

#endif
