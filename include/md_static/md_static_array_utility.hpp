#pragma once
#ifndef _MD_STATIC_ARRAY_UTILITY_HPP_
#define _MD_STATIC_ARRAY_UTILITY_HPP_
#include <cmath>
#include <functional>

#include "md_static_array.hpp"

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
    static MdStaticArray<_T> mapping_fn(
        const MdStaticArray<_T> &__values,
        const std::function<_T(const _T &)> &function_exec);

    /**
     * @brief Execute accumulate function.
     * @tparam _T type of array
     * @param __values values to perform
     * @param function_exec function to execute (arguments are previous value
     * and current value)
     * @param init, value to initialize before accumulate.
     * @returns single value
     */
    template <typename _T, typename _func>
    static _T accumulate_fn(MdStaticArray<_T> &__values,
                            const _func &function_exec, const _T init);

    /**
     * @brief Execute accumulate function, and merge these values based on
     * @tparam _T type of array
     * @param __values values to perform
     * @param function_exec function to execute (arguments are previous value
     * and current value)
     * @param init, value to initialize before accumulate.
     * @returns single value
     */
    template <typename _T, typename _func, typename _merge_func>
    static _T accumulate_and_merge_fn(MdStaticArray<_T> &__values,
                                      const _func &function_exec,
                                      const _merge_func &merge_func,
                                      const _T init, const _T merge_init);

    /**
     * @brief sqrt of all values in list __values
     * @param __values list of values
     * @returns List of values
     */
    template <typename _T>
    static MdStaticArray<_T> f_sqrt(MdStaticArray<_T> &__values);

    /**
     * @brief absolute values of all values in list __values
     * @param __values list of values
     * @returns List of values
     */
    template <typename _T>
    static MdStaticArray<_T> f_abs(MdStaticArray<_T> &__values);

    /**
     * @brief Sum of all the values in the list __values
     * @param __values List of all values
     * @param init value to be initialized with
     * @return single number
     */
    template <typename _T>
    static _T f_sum(MdStaticArray<_T> &__values, _T init = 0);

    /**
     * @brief Mean of all the values in the list __values
     * @param __values List of all values
     * @param init value to be initialized with
     * @return single number
     */
    template <typename _T>
    static long double f_mean(MdStaticArray<_T> &__values, _T init = 0);

    /**
     * @brief Root Mean Square of all the values in the list __values
     * @param __values List of all values
     * @param init value to be initialized with
     * @return single number
     */
    template <typename _T>
    static long double f_rms(MdStaticArray<_T> &__values, _T init = 0);

    /**
     * @brief Standard Deviation of all the values in the list __values
     * @param __values List of all values
     * @param init value to be initialized with
     * @return single number
     */
    template <typename _T>
    static long double f_std_dev(MdStaticArray<_T> &__values);

    /**
     * @brief compute log of values to the base 10
     */
    template <typename _T>
    static MdStaticArray<_T> f_log_10(MdStaticArray<_T> &__values);

    /**
     * @brief compute log of values to the base 2
     */
    template <typename _T>
    static MdStaticArray<_T> f_log_2(MdStaticArray<_T> &__values);

    /**
     * @brief compute natural logarithm of valuess
     */
    template <typename _T>
    static MdStaticArray<_T> f_ln(MdStaticArray<_T> &__values);

    /**
     * @brief compute mod power of integers
     */
    template <typename _T, class = typename std::enable_if<
                               std::is_integral<_T>::value>::type>
    static MdStaticArray<_T> f_mod_pow(const MdStaticArray<_T> &__values,
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
    static MdStaticArray<_T> f_mod_pow(const uint64_t n,
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
    static MdStaticArray<_T> f_pow(const MdStaticArray<_T> &__values,
                                   double power);

    /**
     * @brief compute sine of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed sine values
     */
    template <typename _T>
    static MdStaticArray<_T> f_sin(const MdStaticArray<_T> &__values);

    /**
     * @brief compute sine of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed sine values
     */
    template <typename _T>
    static MdStaticArray<_T> f_cos(const MdStaticArray<_T> &__values);

    /**
     * @brief compute cosine of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename _T>
    static MdStaticArray<_T> f_tan(const MdStaticArray<_T> &__values);

    /**
     * @brief compute cotangent of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed cotangent values
     */
    template <typename _T>
    static MdStaticArray<_T> f_cot(const MdStaticArray<_T> &__values);

    /**
     * @brief compute secant of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed secant values
     */
    template <typename _T>
    static MdStaticArray<_T> f_sec(const MdStaticArray<_T> &__values);

    /**
     * @brief compute cosecant of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed cosecant values
     */
    template <typename _T>
    static MdStaticArray<_T> f_csc(const MdStaticArray<_T> &__values);

    /**
     * @brief compute inverse sin of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed inverse sin
     */
    template <typename _T>
    static MdStaticArray<_T> f_arcsin(const MdStaticArray<_T> &__values);

    /**
     * @brief compute inverse cos of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed inverse cos
     */
    template <typename _T>
    static MdStaticArray<_T> f_arccos(const MdStaticArray<_T> &__values);

    /**
     * @brief compute tan inverse of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed inverse tan
     */
    template <typename _T>
    static MdStaticArray<_T> f_arctan(const MdStaticArray<_T> &__values);

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
                                   const _T spacing = 1);
};

#include "md_static_array_utility.tcc"

#endif
