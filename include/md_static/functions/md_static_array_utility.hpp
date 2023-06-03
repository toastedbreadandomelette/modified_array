#pragma once
#ifndef _MD_STATIC_ARRAY_UTILITY_HPP_
#define _MD_STATIC_ARRAY_UTILITY_HPP_
#include <functional>

#include "./../md_static_array/md_static_array.hpp"

struct MdArrayUtility {
    /**
     * @brief Execute a one-to-one mapping function of an array,
     * @tparam T array type
     * @tparam _func variable function that maps the values
     * @param values values to map
     * @param function_exec function to execute
     * @returns Array of elements
     */
    template <typename T>
    static MdStaticArray<T> map(
        const MdStaticArray<T> &values,
        const std::function<T(const T &)> &function_exec);

    /**
     * @brief Execute a one-to-one mapping function of an array,
     * @tparam T array type
     * @tparam _func variable function that maps the values
     * @param values values to map
     * @param function_exec function to execute
     * @returns Array of elements
     */
    template <typename T>
    static MdStaticArray<T> map(
        const MdStaticArrayReference<T> &values,
        const std::function<T(const T &)> &function_exec);

    /**
     * @brief Reduce array of values to a single value function.
     * @todo: Merge along mentioned axis
     * @tparam T type of array
     * @param values values to perform
     * @param function_exec function to execute (arguments are previous value
     * and current value)
     * @param init, value to initialize before accumulate.
     * @returns single value
     */
    template <typename T, typename _func>
    static MdStaticArray<T> reduce(const MdStaticArray<T> &values,
                                   const _func &function_exec, const T init,
                                   const int axis = -1);

    /**
     * @brief Reduce array of values to a single value function.
     * @todo: Merge along mentioned axis
     * @tparam T type of array
     * @param values values to perform
     * @param function_exec function to execute (arguments are previous value
     * and current value)
     * @param init, value to initialize before accumulate.
     * @returns single value
     */
    template <typename T, typename _func>
    static MdStaticArray<T> reduce(const MdStaticArrayReference<T> &values,
                                   const _func &function_exec, const T init,
                                   const int axis = -1);

    /**
     * @brief Execute accumulate function, and merge these values based on
     * merge function
     * @todo: Merge along mentioned axis
     * @tparam T type of array
     * @param values values to perform
     * @param function_exec function to execute (arguments are previous value
     * and current value)
     * @param init, value to initialize before accumulate.
     * @returns single value
     */
    template <typename T, typename _func, typename _merge_func>
    static T accumulate_and_merge_fn(const MdStaticArray<T> &values,
                                     const _func &function_exec,
                                     const _merge_func &merge_func,
                                     const T init);

    /**
     * @brief Execute accumulate function, and merge these values based on
     * merge function
     * @todo: Merge along mentioned axis
     * @tparam T type of array
     * @param values values to perform
     * @param function_exec function to execute (arguments are previous value
     * and current value)
     * @param init, value to initialize before accumulate.
     * @returns single value
     */
    template <typename T, typename _func, typename _merge_func>
    static T accumulate_and_merge_fn(const MdStaticArrayReference<T> &values,
                                     const _func &function_exec,
                                     const _merge_func &merge_func,
                                     const T init);

    /**
     * @brief sqrt of all values in list values
     * @param values list of values
     * @returns List of values
     */
    template <typename T>
    static MdStaticArray<T> sqrt(const MdStaticArray<T> &values);

    /**
     * @brief sqrt of all values in list values
     * @param values list of values
     * @returns List of values
     */
    template <typename T>
    static MdStaticArray<T> sqrt(const MdStaticArrayReference<T> &values);

    /**
     * @brief absolute value of all values in list values
     * @param values list of values
     * @returns List of values
     */
    template <typename T>
    static MdStaticArray<T> abs(const MdStaticArray<T> &values);

    /**
     * @brief absolute value of all values in list values
     * @param values list of values
     * @returns List of values
     */
    template <typename T>
    static MdStaticArray<T> abs(const MdStaticArrayReference<T> &values);

    /**
     * @brief Sum of all the values in the list values
     * @param values List of all values
     * @param init value to be initialized with
     * @return Single number (or ndarray depending on axis)
     */
    template <typename T>
    static MdStaticArray<T> sum(const MdStaticArray<T> &values,
                                const T init = 0, const int axis = -1);

    /**
     * @brief Sum of all the values in the list values
     * @param values List of all values
     * @param init value to be initialized with
     * @return Single number (or ndarray depending on axis)
     */
    template <typename T>
    static MdStaticArray<T> sum(const MdStaticArrayReference<T> &values,
                                const T init = 0, const int axis = -1);

    /**
     * @brief Mean of all the values in the list values
     * @param values List of all values
     * @param init value to be initialized with
     * @return Single number (or ndarray depending on axis)
     */
    template <typename T>
    static MdStaticArray<double> mean(const MdStaticArray<T> &values,
                                      const T init = 0, const int axis = -1);

    /**
     * @brief Mean of all the values in the list values
     * @param values List of all values
     * @param init value to be initialized with
     * @return Single number (or ndarray depending on axis)
     */
    template <typename T>
    static MdStaticArray<double> mean(const MdStaticArrayReference<T> &values,
                                      const T init = 0, const int axis = -1);

    /**
     * @brief Maximum of all the values along given axis
     * @param values List of all values
     * @param axis Given axis along which function is checked
     * @return Single number (or ndarray depending on axis)
     */
    template <typename T>
    static MdStaticArray<T> amax(const MdStaticArray<T> &values,
                                 const int axis = -1);

    /**
     * @brief Maximum of all the values along given axis
     * @param values List of all values
     * @param axis Given axis along which function is checked
     * @return Single number (or ndarray depending on axis)
     */
    template <typename T>
    static MdStaticArray<T> amax(const MdStaticArrayReference<T> &values,
                                 const int axis = -1);

    /**
     * @brief Maximum of all the values along given axis
     * @param values List of all values
     * @param axis Given axis along which function is checked
     * @return Single number (or ndarray depending on axis)
     */
    template <typename T>
    static MdStaticArray<size_t> argmax(const MdStaticArray<T> &values,
                                        const int axis = -1);

    /**
     * @brief Maximum of all the values along given axis
     * @param values List of all values
     * @param axis Given axis along which function is checked
     * @return Single number (or ndarray depending on axis)
     */
    template <typename T = size_t>
    static MdStaticArray<size_t> argmax(const MdStaticArrayReference<T> &values,
                                        const int axis = -1);

    /**
     * @brief Minimum of all the values along given axis
     * @param values List of all values
     * @param axis Given axis along which function is checked
     * @return Single number (or ndarray depending on axis)
     */
    template <typename T>
    static MdStaticArray<T> amin(const MdStaticArray<T> &values,
                                 const int axis = -1);

    /**
     * @brief Minimum of all the values along given axis
     * @param values List of all values
     * @param axis Given axis along which function is checked
     * @return Single number (or ndarray depending on axis)
     */
    template <typename T>
    static MdStaticArray<T> amin(const MdStaticArrayReference<T> &values,
                                 const int axis = -1);

    /**
     * @brief Minimum indexes of all the values along given axis
     * @param values List of all values
     * @param axis Given axis along which function is checked
     * @return Single number (or ndarray depending on axis)
     */
    template <typename T>
    static MdStaticArray<size_t> argmin(const MdStaticArray<T> &values,
                                        const int axis = -1);

    /**
     * @brief Minimum indexes of all the values along given axis
     * @param values List of all values
     * @param axis Given axis along which function is checked
     * @return Single number (or ndarray depending on axis)
     */
    template <typename T>
    static MdStaticArray<size_t> argmin(const MdStaticArrayReference<T> &values,
                                        const int axis = -1);

    /**
     * @brief GCD of all the values combined in the list values
     * @param values List of all values
     * @param init value to be initialized with
     * @return Single number (or ndarray depending on axis)
     */
    template <typename T>
    static MdStaticArray<T> gcd(const MdStaticArray<T> &values,
                                const int axis = -1);

    /**
     * @brief GCD of all the values combined in the list values
     * @param values List of all values
     * @param init value to be initialized with
     * @return Single number (or ndarray depending on axis)
     */
    template <typename T>
    static MdStaticArray<T> gcd(const MdStaticArrayReference<T> &values,
                                const int axis = -1);

    /**
     * @brief LCM of all the values combined in the list values
     * @param values List of all values
     * @param init value to be initialized with
     * @return Single number (or ndarray depending on axis)
     */
    template <typename T>
    static MdStaticArray<T> lcm(const MdStaticArray<T> &values,
                                const int axis = -1);

    /**
     * @brief LCM of all the values combined in the list values
     * @param values List of all values
     * @param init value to be initialized with
     * @return Single number (or ndarray depending on axis)
     */
    template <typename T>
    static MdStaticArray<T> lcm(const MdStaticArrayReference<T> &values,
                                const int axis = -1);

    /**
     * @brief Root Mean Square of all the values in the list values
     * @param values List of all values
     * @param init value to be initialized with
     * @return single number
     */
    template <typename T>
    static long double rms(const MdStaticArray<T> &values, const T init = 0);

    /**
     * @brief Root Mean Square of all the values in the list values
     * @param values List of all values
     * @param init value to be initialized with
     * @return single number
     */
    template <typename T>
    static long double rms(const MdStaticArrayReference<T> &values,
                           const T init = 0);

    /**
     * @brief Standard Deviation of all the values in the list values
     * @param values List of all values
     * @param init value to be initialized with
     * @return single number
     */
    template <typename T>
    static long double std_dev(const MdStaticArray<T> &values);

    /**
     * @brief Standard Deviation of all the values in the list values
     * @param values List of all values
     * @param init value to be initialized with
     * @return single number
     */
    template <typename T>
    static long double std_dev(const MdStaticArrayReference<T> &values);

    /**
     * @brief compute log of values to the base 10
     */
    template <typename T>
    static MdStaticArray<T> log10(const MdStaticArray<T> &values);

    /**
     * @brief compute log of values to the base 10
     */
    template <typename T>
    static MdStaticArray<T> log10(const MdStaticArrayReference<T> &values);

    /**
     * @brief compute log of values to the base 2
     */
    template <typename T>
    static MdStaticArray<T> log2(const MdStaticArray<T> &values);

    /**
     * @brief compute log of values to the base 2
     */
    template <typename T>
    static MdStaticArray<T> log2(const MdStaticArrayReference<T> &values);

    /**
     * @brief compute natural logarithm of valuess
     */
    template <typename T>
    static MdStaticArray<T> log(const MdStaticArray<T> &values);

    /**
     * @brief compute natural logarithm of valuess
     */
    template <typename T>
    static MdStaticArray<T> log(const MdStaticArrayReference<T> &values);

    /**
     * @brief compute mod power of integers
     */
    template <typename T,
              class = typename std::enable_if<std::is_integral<T>::value>::type>
    static MdStaticArray<T> mod_pow(const MdStaticArray<T> &values,
                                    const size_t power, const size_t _mod);

    /**
     * @brief compute mod power of integers
     */
    template <typename T,
              class = typename std::enable_if<std::is_integral<T>::value>::type>
    static MdStaticArray<T> mod_pow(const MdStaticArrayReference<T> &values,
                                    const size_t power, const size_t _mod);

    /**
     * @brief compute mod power of integer raise to array of values
     * @tparam T type of integer values in array
     * @param n a number value
     * @param values list of exponents
     * @param _mod value to perform mod_power
     * @returns list of values
     */
    template <typename T,
              class = typename std::enable_if<std::is_integral<T>::value>::type>
    static MdStaticArray<T> mod_pow(const uint64_t n,
                                    const MdStaticArray<T> &values,
                                    const size_t _mod);

    /**
     * @brief compute mod power of integer raise to array of values
     * @tparam T type of integer values in array
     * @param n a number value
     * @param values list of exponents
     * @param _mod value to perform mod_power
     * @returns list of values
     */
    template <typename T,
              class = typename std::enable_if<std::is_integral<T>::value>::type>
    static MdStaticArray<T> mod_pow(const uint64_t n,
                                    const MdStaticArrayReference<T> &values,
                                    const size_t _mod);

    /**
     * @brief compute power of values
     * @tparam T type of array
     * @param values array of values to compute
     * @param power exponent
     * @returns new arrays with value raise to power
     */
    template <typename T>
    static MdStaticArray<T> pow(const MdStaticArray<T> &values, double power);

    /**
     * @brief compute power of values
     * @tparam T type of array
     * @param values array of values to compute
     * @param power exponent
     * @returns new arrays with value raise to power
     */
    template <typename T>
    static MdStaticArray<T> pow(const MdStaticArrayReference<T> &values,
                                double power);

    /**
     * @brief compute sine of values, given in radian
     * @tparam T type of array
     * @param values array of values to compute
     * @returns array of computed sine values
     */
    template <typename T>
    static MdStaticArray<T> sin(const MdStaticArray<T> &values);

    /**
     * @brief compute sine of values, given in radian
     * @tparam T type of array
     * @param values array of values to compute
     * @returns array of computed sine values
     */
    template <typename T>
    static MdStaticArray<T> sin(const MdStaticArrayReference<T> &values);

    /**
     * @brief compute sine of values, given in radian
     * @tparam T type of array
     * @param values array of values to compute
     * @returns array of computed sine values
     */
    template <typename T>
    static MdStaticArray<T> cos(const MdStaticArray<T> &values);

    /**
     * @brief compute sine of values, given in radian
     * @tparam T type of array
     * @param values array of values to compute
     * @returns array of computed sine values
     */
    template <typename T>
    static MdStaticArray<T> cos(const MdStaticArrayReference<T> &values);

    /**
     * @brief compute cosine of values, given in radian
     * @tparam T type of array
     * @param values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename T>
    static MdStaticArray<T> tan(const MdStaticArray<T> &values);

    /**
     * @brief compute cosine of values, given in radian
     * @tparam T type of array
     * @param values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename T>
    static MdStaticArray<T> tan(const MdStaticArrayReference<T> &values);

    /**
     * @brief compute cotangent of values, given in radian
     * @tparam T type of array
     * @param values array of values to compute
     * @returns array of computed cotangent values
     */
    template <typename T>
    static MdStaticArray<T> cot(const MdStaticArray<T> &values);

    /**
     * @brief compute cosine of values, given in radian
     * @tparam T type of array
     * @param values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename T>
    static MdStaticArray<T> cot(const MdStaticArrayReference<T> &values);

    /**
     * @brief compute secant of values, given in radian
     * @tparam T type of array
     * @param values array of values to compute
     * @returns array of computed secant values
     */
    template <typename T>
    static MdStaticArray<T> sec(const MdStaticArray<T> &values);

    /**
     * @brief compute cosine of values, given in radian
     * @tparam T type of array
     * @param values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename T>
    static MdStaticArray<T> sec(const MdStaticArrayReference<T> &values);

    /**
     * @brief compute cosecant of values, given in radian
     * @tparam T type of array
     * @param values array of values to compute
     * @returns array of computed cosecant values
     */
    template <typename T>
    static MdStaticArray<T> cosec(const MdStaticArray<T> &values);

    /**
     * @brief compute cosine of values, given in radian
     * @tparam T type of array
     * @param values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename T>
    static MdStaticArray<T> cosec(const MdStaticArrayReference<T> &values);

    /**
     * @brief compute inverse sin of values, given in radian
     * @tparam T type of array
     * @param values array of values to compute
     * @returns array of computed inverse sin
     */
    template <typename T>
    static MdStaticArray<T> arcsin(const MdStaticArray<T> &values);

    /**
     * @brief compute cosine of values, given in radian
     * @tparam T type of array
     * @param values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename T>
    static MdStaticArray<T> arcsin(const MdStaticArrayReference<T> &values);

    /**
     * @brief compute inverse cos of values, given in radian
     * @tparam T type of array
     * @param values array of values to compute
     * @returns array of computed inverse cos
     */
    template <typename T>
    static MdStaticArray<T> arccos(const MdStaticArray<T> &values);

    /**
     * @brief compute cosine of values, given in radian
     * @tparam T type of array
     * @param values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename T>
    static MdStaticArray<T> arccos(const MdStaticArrayReference<T> &values);

    /**
     * @brief compute tan inverse of values, given in radian
     * @tparam T type of array
     * @param values array of values to compute
     * @returns array of computed inverse tan
     */
    template <typename T>
    static MdStaticArray<T> arctan(const MdStaticArray<T> &values);

    /**
     * @brief compute cosine of values, given in radian
     * @tparam T type of array
     * @param values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename T>
    static MdStaticArray<T> arctan(const MdStaticArrayReference<T> &values);

    /**
     * @brief Generate evenly spaced values
     * @tparam T type of array
     * @param start start value for the array, if end and spacing is not
     * specified, $start$ will be the size of the array
     * @param end upper limit of the array
     *
     */
    template <typename T, class = typename std::enable_if<
                              std::is_arithmetic<T>::value>::type>
    static MdStaticArray<T> range(const T start, const T end = -1,
                                  const T spacing = 0);

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
     * @tparam T type of array
     * @param values array of values to compute
     * @returns array of computed cosine values
     */
    template <typename T>
    static MdStaticArray<T> transpose(const MdStaticArrayReference<T> &values);

    /**
     * @brief Cumulative sum of an array.
     * @tparam T matrix type,
     * @param __array input array
     * @param axis Axis to perform cumulative sum on
     * @param thread_count
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename T>
    static MdStaticArray<T> cumulative_sum(const MdStaticArray<T> &__ndarray,
                                           const size_t axis = -1,
                                           const size_t thread_count = 16);

    /**
     * @brief Cumulative sum of an array.
     * @tparam T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename T>
    static MdStaticArray<T> cumulative_sum(
        const MdStaticArrayReference<T> &__array, const size_t axis = -1,
        const size_t thread_count = 16);

    /**
     * @brief Cumulative sum of an array.
     * @tparam T matrix type,
     * @param __array input array
     * @param axis Axis to perform cumulative sum on
     * @param thread_count
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename T>
    static MdStaticArray<T> diff(const MdStaticArray<T> &__ndarray,
                                 const size_t axis = -1,
                                 const size_t thread_count = 16);

    /**
     * @brief Cumulative sum of an array.
     * @tparam T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename T>
    static MdStaticArray<T> diff(const MdStaticArrayReference<T> &__ndarray,
                                 const size_t axis = -1,
                                 const size_t thread_count = 16);

    /**
     * @brief Cumulative product of an array.
     * @tparam T matrix type,
     * @param __array input array
     * @param axis Axis to perform cumulative sum on
     * @param thread_count
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename T>
    static MdStaticArray<T> cumulative_product(
        const MdStaticArray<T> &__ndarray, const size_t axis = -1,
        const size_t thread_count = 16);

    /**
     * @brief Cumulative product of an array.
     * @tparam T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename T>
    static MdStaticArray<T> cumulative_product(
        const MdStaticArrayReference<T> &__array, const size_t axis = -1,
        const size_t thread_count = 16);

    /**
     * @brief Cumulative product of an array.
     * @tparam T matrix type,
     * @param __array input array
     * @param axis Axis to perform cumulative sum on
     * @param thread_count
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename T>
    static MdStaticArray<T> nan_cumulative_sum(
        const MdStaticArray<T> &__ndarray, const size_t axis = -1,
        const size_t thread_count = 16);

    /**
     * @brief Cumulative product of an array.
     * @tparam T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename T>
    static MdStaticArray<T> nan_cumulative_sum(
        const MdStaticArrayReference<T> &__array, const size_t axis = -1,
        const size_t thread_count = 16);

    /**
     * @brief Cumulative product of an array.
     * @tparam T matrix type,
     * @param __array input array
     * @param axis Axis to perform cumulative sum on
     * @param thread_count
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename T>
    static MdStaticArray<T> nan_cumulative_product(
        const MdStaticArray<T> &__ndarray, const size_t axis = -1,
        const size_t thread_count = 16);

    /**
     * @brief Cumulative product of an array.
     * @tparam T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename T>
    static MdStaticArray<T> nan_cumulative_product(
        const MdStaticArrayReference<T> &__array, const size_t axis = -1,
        const size_t thread_count = 16);

    /**
     * @brief Convert radian to degrees of an array.
     * @tparam T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values
     * in
     * __array
     */
    template <typename T>
    static MdStaticArray<T> rad_2_deg(const MdStaticArray<T> &__array);

    /**
     * @brief Convert radian to degrees of an array.
     * @tparam T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename T>
    static MdStaticArray<T> rad_2_deg(const MdStaticArrayReference<T> &__array);

    /**
     * @brief Convert radian to degree of an array.
     * @tparam T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename T>
    static MdStaticArray<T> deg_2_rad(const MdStaticArray<T> &__array);

    /**
     * @brief Convert radian to degree of an array.
     * @tparam T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename T>
    static MdStaticArray<T> deg_2_rad(const MdStaticArrayReference<T> &__array);

    /**
     * @brief Calculate floor of an array.
     * @tparam T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename T>
    static MdStaticArray<T> floor(const MdStaticArray<T> &__array);

    /**
     * @brief Calculate floor of an array.
     * @tparam T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename T>
    static MdStaticArray<T> floor(const MdStaticArrayReference<T> &__array);

    /**
     * @brief Calculate ceil of an array.
     * @tparam T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename T>
    static MdStaticArray<T> ceil(const MdStaticArray<T> &__array);

    /**
     * @brief Calculate ceil of an array.
     * @tparam T matrix type,
     * @param __array input array
     * @returns new array where each element is sum of all previous values in
     * __array
     */
    template <typename T>
    static MdStaticArray<T> ceil(const MdStaticArrayReference<T> &__array);

    /**
     * @brief Check if every value satisfies the condition
     * @tparam T array type
     * @param __ndarray n-dimensional array
     * @param _func function that test for every element
     * @returns boolean value
     */
    template <typename T>
    static bool every(const MdStaticArray<T> &__ndarray,
                      const std::function<bool(const T &)> &,
                      const size_t threads = 16);

    /**
     * @brief Check if every value satisfies the condition
     * @tparam T array type
     * @param __ndarray n-dimensional array
     * @param _func function that test for every element
     * @returns boolean value
     */
    template <typename T>
    static bool every(const MdStaticArrayReference<T> &__ndarray__reference,
                      const std::function<bool(const T &)> &,
                      const size_t threads = 16);

    /**
     * @brief Check if at least one value satisfies the condition
     * @tparam T array type
     * @param __ndarray n-dimensional array
     * @param _func function that test for every element
     * @returns boolean value
     */
    template <typename T>
    static bool some(const MdStaticArray<T> &__ndarray,
                     const std::function<bool(const T &)> &,
                     const size_t threads = 16);

    /**
     * @brief Check if at least one value satisfies the condition
     * @tparam T array type
     * @param __ndarray n-dimensional array
     * @param _func function that test for every element
     * @returns boolean value
     */
    template <typename T>
    static bool some(const MdStaticArrayReference<T> &__ndarray__reference,
                     const std::function<bool(const T &)> &,
                     const size_t threads = 16);

    /**
     * @brief Compute 2 raised to value from array of values
     * @tparam T array type
     * @param __ndarray n-dimensional array

     * @returns boolean value
     */
    template <typename T>
    static MdStaticArray<double> exp2(const MdStaticArray<T> &__ndarray);

    /**
     * @brief Compute 2 raised to value from array of values
     * @tparam T array type
     * @param __ndarray n-dimensional array

     * @returns boolean value
     */
    template <typename T>
    static MdStaticArray<double> exp2(
        const MdStaticArrayReference<T> &__ndarray);

    /**
     * @brief Compute reciprocal from array of values
     * @tparam T array type
     * @param __ndarray n-dimensional array
     * @returns boolean value
     */
    template <typename T>
    static MdStaticArray<double> reciprocal(
        const MdStaticArray<T> &__ndarray__reference);

    /**
     * @brief Compute reciprocal from array of values
     * @tparam T array type
     * @param __ndarray n-dimensional array
     * @returns boolean value
     */
    template <typename T>
    static MdStaticArray<double> reciprocal(
        const MdStaticArrayReference<T> &__ndarray__reference);

    /**
     * @brief Compute sinh from array of values
     * @tparam T array type
     * @param __ndarray n-dimensional array
     * @returns boolean value
     */
    template <typename T>
    static MdStaticArray<double> sinh(const MdStaticArray<T> &__ndarray);

    /**
     * @brief Compute sinh from array of values
     * @tparam T array type
     * @param __ndarray n-dimensional array
     * @returns boolean value
     */
    template <typename T>
    static MdStaticArray<double> sinh(
        const MdStaticArrayReference<T> &__ndarray);

    /**
     * @brief Compute cosh from array of values
     * @tparam T array type
     * @param __ndarray n-dimensional array
     * @returns boolean value
     */
    template <typename T>
    static MdStaticArray<double> cosh(
        const MdStaticArray<T> &__ndarray__reference);

    /**
     * @brief Compute cosh from array of values
     * @tparam T array type
     * @param __ndarray n-dimensional array
     * @returns boolean value
     */
    template <typename T>
    static MdStaticArray<double> cosh(
        const MdStaticArrayReference<T> &__ndarray__reference);

    /**
     * @brief Compute tanh from array of values
     * @tparam T array type
     * @param __ndarray n-dimensional array
     * @returns boolean value
     */
    template <typename T>
    static MdStaticArray<double> tanh(const MdStaticArray<T> &__ndarray);

    /**
     * @brief Compute tanh from array of values
     * @tparam T array type
     * @param __ndarray n-dimensional array

     * @returns boolean value
     */
    template <typename T>
    static MdStaticArray<double> tanh(
        const MdStaticArrayReference<T> &__ndarray);

    /**
     * @brief Compare if two arrays are equal
     * @tparam T array type
     * @param first n-dimensional array
     * @param other n-dimensional array
     * @returns boolean value
     */
    template <typename T1, typename T2>
    static bool compare(const MdStaticArray<T1> &first,
                        const MdStaticArray<T2> &other);

    /**
     * @brief Compute tanh from array of values
     * @tparam T array type
     * @param ndarray n-dimensional array
     * @param func function that test for every element
     * @returns boolean value
     */
    template <typename T>
    static void sort(
        MdStaticArray<T> &,
        const std::function<bool(const T first, const T second)> &comp =
            [](const T first, const T sec) { return first < sec; },
        const int axis = -1);

    /**
     * @brief Sort array in place
     * @tparam T array type
     * @param ndarray n-dimensional array
     * @param comp function that test for every element
     * @returns boolean value
     */
    template <typename T>
    static void sort(
        MdStaticArrayReference<T> &,
        const std::function<bool(const T first, const T second)> &comp =
            [](const T first, const T sec) { return first < sec; },
        const int axis = -1);

    /**
     * @brief Sort array in place along the axis
     * @tparam T array type
     * @param ndarray n-dimensional array
     * @param comp function that test for every element
     * @returns boolean value
     */
    template <typename T>
    static void sort(
        MdStaticAxisReference<T> &, MdStaticArray<T> &,
        const std::function<bool(const T first, const T second)> &comp);
};

#endif
