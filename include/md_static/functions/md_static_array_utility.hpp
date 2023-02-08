#pragma once
#ifndef _MD_STATIC_ARRAY_UTILITY_HPP_
#define _MD_STATIC_ARRAY_UTILITY_HPP_
#include <functional>

#include "./../md_static_array/md_static_array.hpp"

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
     * @brief Execute a one-to-one mapping function of an array,
     * @tparam _T array type
     * @tparam _func variable function that maps the values
     * @param __values values to map
     * @param function_exec function to execute
     * @returns Array of elements
     */
    template <typename _T>
    static MdStaticArray<_T> map(
        const MdStaticArrayReference<_T> &__values,
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
    static MdStaticArray<_T> reduce(const MdStaticArray<_T> &__values,
                                    const _func &function_exec, const _T init,
                                    const int axis = -1);

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
    static MdStaticArray<_T> reduce(const MdStaticArrayReference<_T> &__values,
                                    const _func &function_exec, const _T init,
                                    const int axis = -1);

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
    static _T accumulate_and_merge_fn(
        const MdStaticArrayReference<_T> &__values, const _func &function_exec,
        const _merge_func &merge_func, const _T init);

    /**
     * @brief sqrt of all values in list __values
     * @param __values list of values
     * @returns List of values
     */
    template <typename _T>
    static MdStaticArray<_T> sqrt(const MdStaticArray<_T> &__values);

    /**
     * @brief sqrt of all values in list __values
     * @param __values list of values
     * @returns List of values
     */
    template <typename _T>
    static MdStaticArray<_T> sqrt(const MdStaticArrayReference<_T> &__values);

    /**
     * @brief absolute value of all values in list __values
     * @param __values list of values
     * @returns List of values
     */
    template <typename _T>
    static MdStaticArray<_T> abs(const MdStaticArray<_T> &__values);

    /**
     * @brief absolute value of all values in list __values
     * @param __values list of values
     * @returns List of values
     */
    template <typename _T>
    static MdStaticArray<_T> abs(const MdStaticArrayReference<_T> &__values);

    /**
     * @brief Sum of all the values in the list __values
     * @param __values List of all values
     * @param init value to be initialized with
     * @return Single number (or ndarray depending on axis)
     */
    template <typename _T>
    static MdStaticArray<_T> sum(const MdStaticArray<_T> &__values,
                                 const _T init = 0, const int axis = -1);

    /**
     * @brief Sum of all the values in the list __values
     * @param __values List of all values
     * @param init value to be initialized with
     * @return Single number (or ndarray depending on axis)
     */
    template <typename _T>
    static MdStaticArray<_T> sum(const MdStaticArrayReference<_T> &__values,
                                 const _T init = 0, const int axis = -1);

    /**
     * @brief Mean of all the values in the list __values
     * @param __values List of all values
     * @param init value to be initialized with
     * @return Single number (or ndarray depending on axis)
     */
    template <typename _T>
    static MdStaticArray<double> mean(const MdStaticArray<_T> &__values,
                                      const _T init = 0, const int axis = -1);

    /**
     * @brief Mean of all the values in the list __values
     * @param __values List of all values
     * @param init value to be initialized with
     * @return Single number (or ndarray depending on axis)
     */
    template <typename _T>
    static MdStaticArray<double> mean(
        const MdStaticArrayReference<_T> &__values, const _T init = 0,
        const int axis = -1);

    /**
     * @brief Maximum of all the values along given axis
     * @param __values List of all values
     * @param axis Given axis along which function is checked
     * @return Single number (or ndarray depending on axis)
     */
    template <typename _T>
    static MdStaticArray<_T> amax(const MdStaticArray<_T> &__values,
                                  const int axis = -1);

    /**
     * @brief Maximum of all the values along given axis
     * @param __values List of all values
     * @param axis Given axis along which function is checked
     * @return Single number (or ndarray depending on axis)
     */
    template <typename _T>
    static MdStaticArray<_T> amax(const MdStaticArrayReference<_T> &__values,
                                  const int axis = -1);

    /**
     * @brief Maximum of all the values along given axis
     * @param __values List of all values
     * @param axis Given axis along which function is checked
     * @return Single number (or ndarray depending on axis)
     */
    template <typename _T>
    static MdStaticArray<size_t> argmax(const MdStaticArray<_T> &__values,
                                        const int axis = -1);

    /**
     * @brief Maximum of all the values along given axis
     * @param __values List of all values
     * @param axis Given axis along which function is checked
     * @return Single number (or ndarray depending on axis)
     */
    template <typename _T = size_t>
    static MdStaticArray<size_t> argmax(
        const MdStaticArrayReference<_T> &__values, const int axis = -1);

    /**
     * @brief Minimum of all the values along given axis
     * @param __values List of all values
     * @param axis Given axis along which function is checked
     * @return Single number (or ndarray depending on axis)
     */
    template <typename _T>
    static MdStaticArray<_T> amin(const MdStaticArray<_T> &__values,
                                  const int axis = -1);

    /**
     * @brief Minimum of all the values along given axis
     * @param __values List of all values
     * @param axis Given axis along which function is checked
     * @return Single number (or ndarray depending on axis)
     */
    template <typename _T>
    static MdStaticArray<_T> amin(const MdStaticArrayReference<_T> &__values,
                                  const int axis = -1);

    /**
     * @brief Minimum indexes of all the values along given axis
     * @param __values List of all values
     * @param axis Given axis along which function is checked
     * @return Single number (or ndarray depending on axis)
     */
    template <typename _T>
    static MdStaticArray<size_t> argmin(const MdStaticArray<_T> &__values,
                                        const int axis = -1);

    /**
     * @brief Minimum indexes of all the values along given axis
     * @param __values List of all values
     * @param axis Given axis along which function is checked
     * @return Single number (or ndarray depending on axis)
     */
    template <typename _T>
    static MdStaticArray<size_t> argmin(
        const MdStaticArrayReference<_T> &__values, const int axis = -1);

    /**
     * @brief GCD of all the values combined in the list __values
     * @param __values List of all values
     * @param init value to be initialized with
     * @return Single number (or ndarray depending on axis)
     */
    template <typename _T>
    static MdStaticArray<_T> gcd(const MdStaticArray<_T> &__values,
                                 const int axis = -1);

    /**
     * @brief GCD of all the values combined in the list __values
     * @param __values List of all values
     * @param init value to be initialized with
     * @return Single number (or ndarray depending on axis)
     */
    template <typename _T>
    static MdStaticArray<_T> gcd(const MdStaticArrayReference<_T> &__values,
                                 const int axis = -1);

    /**
     * @brief LCM of all the values combined in the list __values
     * @param __values List of all values
     * @param init value to be initialized with
     * @return Single number (or ndarray depending on axis)
     */
    template <typename _T>
    static MdStaticArray<_T> lcm(const MdStaticArray<_T> &__values,
                                 const int axis = -1);

    /**
     * @brief LCM of all the values combined in the list __values
     * @param __values List of all values
     * @param init value to be initialized with
     * @return Single number (or ndarray depending on axis)
     */
    template <typename _T>
    static MdStaticArray<_T> lcm(const MdStaticArrayReference<_T> &__values,
                                 const int axis = -1);

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
     * @brief Root Mean Square of all the values in the list __values
     * @param __values List of all values
     * @param init value to be initialized with
     * @return single number
     */
    template <typename _T>
    static long double rms(const MdStaticArrayReference<_T> &__values,
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
     * @brief Standard Deviation of all the values in the list __values
     * @param __values List of all values
     * @param init value to be initialized with
     * @return single number
     */
    template <typename _T>
    static long double std_dev(const MdStaticArrayReference<_T> &__values);

    /**
     * @brief compute log of values to the base 10
     */
    template <typename _T>
    static MdStaticArray<_T> log10(const MdStaticArray<_T> &__values);

    /**
     * @brief compute log of values to the base 10
     */
    template <typename _T>
    static MdStaticArray<_T> log10(const MdStaticArrayReference<_T> &__values);

    /**
     * @brief compute log of values to the base 2
     */
    template <typename _T>
    static MdStaticArray<_T> log2(const MdStaticArray<_T> &__values);

    /**
     * @brief compute log of values to the base 2
     */
    template <typename _T>
    static MdStaticArray<_T> log2(const MdStaticArrayReference<_T> &__values);

    /**
     * @brief compute natural logarithm of valuess
     */
    template <typename _T>
    static MdStaticArray<_T> log(const MdStaticArray<_T> &__values);

    /**
     * @brief compute natural logarithm of valuess
     */
    template <typename _T>
    static MdStaticArray<_T> log(const MdStaticArrayReference<_T> &__values);

    /**
     * @brief compute mod power of integers
     */
    template <typename _T, class = typename std::enable_if<
                               std::is_integral<_T>::value>::type>
    static MdStaticArray<_T> mod_pow(const MdStaticArray<_T> &__values,
                                     const size_t power, const size_t _mod);

    /**
     * @brief compute mod power of integers
     */
    template <typename _T, class = typename std::enable_if<
                               std::is_integral<_T>::value>::type>
    static MdStaticArray<_T> mod_pow(const MdStaticArrayReference<_T> &__values,
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
                                     const MdStaticArrayReference<_T> &__values,
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
     * @brief compute power of values
     * @tparam _T type of array
     * @param __values array of values to compute
     * @param power exponent
     * @returns new arrays with value raise to power
     */
    template <typename _T>
    static MdStaticArray<_T> pow(const MdStaticArrayReference<_T> &__values,
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
    static MdStaticArray<_T> sin(const MdStaticArrayReference<_T> &__values);

    /**
     * @brief compute sine of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed sine values
     */
    template <typename _T>
    static MdStaticArray<_T> cos(const MdStaticArray<_T> &__values);

    /**
     * @brief compute sine of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed sine values
     */
    template <typename _T>
    static MdStaticArray<_T> cos(const MdStaticArrayReference<_T> &__values);

    /**
     * @brief compute cosine of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename _T>
    static MdStaticArray<_T> tan(const MdStaticArray<_T> &__values);

    /**
     * @brief compute cosine of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename _T>
    static MdStaticArray<_T> tan(const MdStaticArrayReference<_T> &__values);

    /**
     * @brief compute cotangent of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed cotangent values
     */
    template <typename _T>
    static MdStaticArray<_T> cot(const MdStaticArray<_T> &__values);

    /**
     * @brief compute cosine of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename _T>
    static MdStaticArray<_T> cot(const MdStaticArrayReference<_T> &__values);

    /**
     * @brief compute secant of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed secant values
     */
    template <typename _T>
    static MdStaticArray<_T> sec(const MdStaticArray<_T> &__values);

    /**
     * @brief compute cosine of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename _T>
    static MdStaticArray<_T> sec(const MdStaticArrayReference<_T> &__values);

    /**
     * @brief compute cosecant of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed cosecant values
     */
    template <typename _T>
    static MdStaticArray<_T> cosec(const MdStaticArray<_T> &__values);

    /**
     * @brief compute cosine of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename _T>
    static MdStaticArray<_T> cosec(const MdStaticArrayReference<_T> &__values);

    /**
     * @brief compute inverse sin of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed inverse sin
     */
    template <typename _T>
    static MdStaticArray<_T> arcsin(const MdStaticArray<_T> &__values);

    /**
     * @brief compute cosine of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename _T>
    static MdStaticArray<_T> arcsin(const MdStaticArrayReference<_T> &__values);

    /**
     * @brief compute inverse cos of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed inverse cos
     */
    template <typename _T>
    static MdStaticArray<_T> arccos(const MdStaticArray<_T> &__values);

    /**
     * @brief compute cosine of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename _T>
    static MdStaticArray<_T> arccos(const MdStaticArrayReference<_T> &__values);

    /**
     * @brief compute tan inverse of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed inverse tan
     */
    template <typename _T>
    static MdStaticArray<_T> arctan(const MdStaticArray<_T> &__values);

    /**
     * @brief compute cosine of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename _T>
    static MdStaticArray<_T> arctan(const MdStaticArrayReference<_T> &__values);

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
     * @brief compute cosine of values, given in radian
     * @tparam _T type of array
     * @param __values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename _T>
    static MdStaticArray<_T> transpose(
        const MdStaticArrayReference<_T> &__values);

    /**
     * @brief Cumulative sum of an array.
     * @tparam _T matrix type,
     * @param __array input array
     * @param axis Axis to perform cumulative sum on
     * @param thread_count
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename _T>
    static MdStaticArray<_T> cumulative_sum(const MdStaticArray<_T> &__ndarray,
                                            const size_t axis = -1,
                                            const size_t thread_count = 16);

    /**
     * @brief Cumulative sum of an array.
     * @tparam _T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename _T>
    static MdStaticArray<_T> cumulative_sum(
        const MdStaticArrayReference<_T> &__array, const size_t axis = -1,
        const size_t thread_count = 16);

    /**
     * @brief Cumulative sum of an array.
     * @tparam _T matrix type,
     * @param __array input array
     * @param axis Axis to perform cumulative sum on
     * @param thread_count
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename _T>
    static MdStaticArray<_T> diff(const MdStaticArray<_T> &__ndarray,
                                  const size_t axis = -1,
                                  const size_t thread_count = 16);

    /**
     * @brief Cumulative sum of an array.
     * @tparam _T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename _T>
    static MdStaticArray<_T> diff(const MdStaticArrayReference<_T> &__ndarray,
                                  const size_t axis = -1,
                                  const size_t thread_count = 16);

    /**
     * @brief Cumulative product of an array.
     * @tparam _T matrix type,
     * @param __array input array
     * @param axis Axis to perform cumulative sum on
     * @param thread_count
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename _T>
    static MdStaticArray<_T> cumulative_product(
        const MdStaticArray<_T> &__ndarray, const size_t axis = -1,
        const size_t thread_count = 16);

    /**
     * @brief Cumulative product of an array.
     * @tparam _T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename _T>
    static MdStaticArray<_T> cumulative_product(
        const MdStaticArrayReference<_T> &__array, const size_t axis = -1,
        const size_t thread_count = 16);

    /**
     * @brief Cumulative product of an array.
     * @tparam _T matrix type,
     * @param __array input array
     * @param axis Axis to perform cumulative sum on
     * @param thread_count
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename _T>
    static MdStaticArray<_T> nan_cumulative_sum(
        const MdStaticArray<_T> &__ndarray, const size_t axis = -1,
        const size_t thread_count = 16);

    /**
     * @brief Cumulative product of an array.
     * @tparam _T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename _T>
    static MdStaticArray<_T> nan_cumulative_sum(
        const MdStaticArrayReference<_T> &__array, const size_t axis = -1,
        const size_t thread_count = 16);

    /**
     * @brief Cumulative product of an array.
     * @tparam _T matrix type,
     * @param __array input array
     * @param axis Axis to perform cumulative sum on
     * @param thread_count
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename _T>
    static MdStaticArray<_T> nan_cumulative_product(
        const MdStaticArray<_T> &__ndarray, const size_t axis = -1,
        const size_t thread_count = 16);

    /**
     * @brief Cumulative product of an array.
     * @tparam _T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename _T>
    static MdStaticArray<_T> nan_cumulative_product(
        const MdStaticArrayReference<_T> &__array, const size_t axis = -1,
        const size_t thread_count = 16);

    /**
     * @brief Convert radian to degrees of an array.
     * @tparam _T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values
     * in
     * __array
     */
    template <typename _T>
    static MdStaticArray<_T> rad_2_deg(const MdStaticArray<_T> &__array);

    /**
     * @brief Convert radian to degrees of an array.
     * @tparam _T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename _T>
    static MdStaticArray<_T> rad_2_deg(
        const MdStaticArrayReference<_T> &__array);

    /**
     * @brief Convert radian to degree of an array.
     * @tparam _T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename _T>
    static MdStaticArray<_T> deg_2_rad(const MdStaticArray<_T> &__array);

    /**
     * @brief Convert radian to degree of an array.
     * @tparam _T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename _T>
    static MdStaticArray<_T> deg_2_rad(
        const MdStaticArrayReference<_T> &__array);

    /**
     * @brief Calculate floor of an array.
     * @tparam _T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename _T>
    static MdStaticArray<_T> floor(const MdStaticArray<_T> &__array);

    /**
     * @brief Calculate floor of an array.
     * @tparam _T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename _T>
    static MdStaticArray<_T> floor(const MdStaticArrayReference<_T> &__array);

    /**
     * @brief Calculate ceil of an array.
     * @tparam _T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename _T>
    static MdStaticArray<_T> ceil(const MdStaticArray<_T> &__array);

    /**
     * @brief Calculate ceil of an array.
     * @tparam _T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename _T>
    static MdStaticArray<_T> ceil(const MdStaticArrayReference<_T> &__array);

    /**
     * @brief Check if every value satisfies the condition
     * @tparam _T array type
     * @param __ndarray n-dimensional array
     * @param _func function that test for every element
     * @returns boolean value
     */
    template <typename _T>
    static bool every(const MdStaticArray<_T> &__ndarray,
                      const std::function<bool(const _T &)> &,
                      const size_t threads = 16);

    /**
     * @brief Check if every value satisfies the condition
     * @tparam _T array type
     * @param __ndarray n-dimensional array
     * @param _func function that test for every element
     * @returns boolean value
     */
    template <typename _T>
    static bool every(const MdStaticArrayReference<_T> &__ndarray__reference,
                      const std::function<bool(const _T &)> &,
                      const size_t threads = 16);

    /**
     * @brief Check if at least one value satisfies the condition
     * @tparam _T array type
     * @param __ndarray n-dimensional array
     * @param _func function that test for every element
     * @returns boolean value
     */
    template <typename _T>
    static bool some(const MdStaticArray<_T> &__ndarray,
                     const std::function<bool(const _T &)> &,
                     const size_t threads = 16);

    /**
     * @brief Check if at least one value satisfies the condition
     * @tparam _T array type
     * @param __ndarray n-dimensional array
     * @param _func function that test for every element
     * @returns boolean value
     */
    template <typename _T>
    static bool some(const MdStaticArrayReference<_T> &__ndarray__reference,
                     const std::function<bool(const _T &)> &,
                     const size_t threads = 16);

    /**
     * @brief Compute 2 raised to value from array of values
     * @tparam _T array type
     * @param __ndarray n-dimensional array
     * @param _func function that test for every element
     * @returns boolean value
     */
    template <typename _T>
    static MdStaticArray<double> exp2(const MdStaticArray<_T> &__ndarray);

    /**
     * @brief Compute 2 raised to value from array of values
     * @tparam _T array type
     * @param __ndarray n-dimensional array
     * @param _func function that test for every element
     * @returns boolean value
     */
    template <typename _T>
    static MdStaticArray<double> exp2(
        const MdStaticArrayReference<_T> &__ndarray);

    /**
     * @brief Compute reciprocal from array of values
     * @tparam _T array type
     * @param __ndarray n-dimensional array
     * @param _func function that test for every element
     * @returns boolean value
     */
    template <typename _T>
    static MdStaticArray<double> reciprocal(
        const MdStaticArray<_T> &__ndarray__reference);

    /**
     * @brief Compute reciprocal from array of values
     * @tparam _T array type
     * @param __ndarray n-dimensional array
     * @param _func function that test for every element
     * @returns boolean value
     */
    template <typename _T>
    static MdStaticArray<double> reciprocal(
        const MdStaticArrayReference<_T> &__ndarray__reference);

    /**
     * @brief Compute sinh from array of values
     * @tparam _T array type
     * @param __ndarray n-dimensional array
     * @param _func function that test for every element
     * @returns boolean value
     */
    template <typename _T>
    static MdStaticArray<double> sinh(const MdStaticArray<_T> &__ndarray);

    /**
     * @brief Compute sinh from array of values
     * @tparam _T array type
     * @param __ndarray n-dimensional array
     * @param _func function that test for every element
     * @returns boolean value
     */
    template <typename _T>
    static MdStaticArray<double> sinh(
        const MdStaticArrayReference<_T> &__ndarray);

    /**
     * @brief Compute cosh from array of values
     * @tparam _T array type
     * @param __ndarray n-dimensional array
     * @param _func function that test for every element
     * @returns boolean value
     */
    template <typename _T>
    static MdStaticArray<double> cosh(
        const MdStaticArray<_T> &__ndarray__reference);

    /**
     * @brief Compute cosh from array of values
     * @tparam _T array type
     * @param __ndarray n-dimensional array
     * @param _func function that test for every element
     * @returns boolean value
     */
    template <typename _T>
    static MdStaticArray<double> cosh(
        const MdStaticArrayReference<_T> &__ndarray__reference);

    /**
     * @brief Compute tanh from array of values
     * @tparam _T array type
     * @param __ndarray n-dimensional array
     * @param _func function that test for every element
     * @returns boolean value
     */
    template <typename _T>
    static MdStaticArray<double> tanh(const MdStaticArray<_T> &__ndarray);

    /**
     * @brief Compute tanh from array of values
     * @tparam _T array type
     * @param __ndarray n-dimensional array
     * @param _func function that test for every element
     * @returns boolean value
     */
    template <typename _T>
    static MdStaticArray<double> tanh(
        const MdStaticArrayReference<_T> &__ndarray__reference);
};

#endif
