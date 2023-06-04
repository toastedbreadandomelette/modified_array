#pragma once

#ifndef _MD_LINEAR_ALGEBRA_HPP_
#define _MD_LINEAR_ALGEBRA_HPP_

#include "../md_static_array/md_static_array.hpp"

struct MdLinearAlgebra {
    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> dot(const MdStaticArray<T1> &first,
                                 const MdStaticArray<T2> &other,
                                 const size_t threads = 16);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> dot(const MdStaticArray<T1> &first,
                                 const MdStaticArrayReference<T2> &other,
                                 const size_t threads = 16);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> dot(const MdStaticArrayReference<T1> &first,
                                 const MdStaticArray<T2> &other,
                                 const size_t threads = 16);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> dot(const MdStaticArrayReference<T1> &first,
                                 const MdStaticArrayReference<T2> &other,
                                 const size_t threads = 16);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2, typename... arg>
    static MdStaticArray<_Tfinal> multi_dot(
        const MdStaticArray<T1> &first, const MdStaticArray<T2> &other,
        const MdStaticArray<arg> &...arguments);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2, typename... arg>
    static MdStaticArray<_Tfinal> multi_dot(
        const MdStaticArrayReference<T1> &first,
        const MdStaticArrayReference<T2> &other,
        const MdStaticArray<arg> &...arguments);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2, typename... arg>
    static MdStaticArray<_Tfinal> multi_dot(
        const MdStaticArray<T1> &first, const MdStaticArrayReference<T2> &other,
        const MdStaticArray<arg> &...arguments);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2, typename... arg>
    static MdStaticArray<_Tfinal> multi_dot(
        const MdStaticArrayReference<T1> &first, const MdStaticArray<T2> &other,
        const MdStaticArray<arg> &...arguments);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2, typename... arg>
    static MdStaticArray<_Tfinal> multi_dot(
        const MdStaticArray<T1> &first, const MdStaticArray<T2> &other,
        const MdStaticArrayReference<arg> &...arguments);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2, typename... arg>
    static MdStaticArray<_Tfinal> multi_dot(
        const MdStaticArrayReference<T1> &first,
        const MdStaticArrayReference<T2> &other,
        const MdStaticArrayReference<arg> &...arguments);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2, typename... arg>
    static MdStaticArray<_Tfinal> multi_dot(
        const MdStaticArray<T1> &first, const MdStaticArrayReference<T2> &other,
        const MdStaticArrayReference<arg> &...arguments);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2, typename... arg>
    static MdStaticArray<_Tfinal> multi_dot(
        const MdStaticArrayReference<T1> &first, const MdStaticArray<T2> &other,
        const MdStaticArrayReference<arg> &...arguments);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2>
    static MdStaticArray<_Tfinal> multi_dot(const MdStaticArray<T1> &first,
                                            const MdStaticArray<T2> &other);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2>
    static MdStaticArray<_Tfinal> multi_dot(
        const MdStaticArrayReference<T1> &first,
        const MdStaticArrayReference<T2> &other);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2>
    static MdStaticArray<_Tfinal> multi_dot(
        const MdStaticArrayReference<T1> &first,
        const MdStaticArray<T2> &other);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2>
    static MdStaticArray<_Tfinal> multi_dot(const MdStaticArray<T1> &,
                                            const MdStaticArrayReference<T2> &);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2, typename... arg>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const MdStaticArray<T1> &first, const MdStaticArray<T2> &other,
        const MdStaticArray<arg> &...arguments);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2, typename... arg>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const MdStaticArrayReference<T1> &first,
        const MdStaticArrayReference<T2> &other,
        const MdStaticArray<arg> &...arguments);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2, typename... arg>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const MdStaticArray<T1> &first, const MdStaticArrayReference<T2> &other,
        const MdStaticArray<arg> &...arguments);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2, typename... arg>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const MdStaticArrayReference<T1> &first, const MdStaticArray<T2> &other,
        const MdStaticArray<arg> &...arguments);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2, typename... arg>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const MdStaticArray<T1> &first, const MdStaticArray<T2> &other,
        const MdStaticArrayReference<arg> &...arguments);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2, typename... arg>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const MdStaticArrayReference<T1> &first,
        const MdStaticArrayReference<T2> &other,
        const MdStaticArrayReference<arg> &...arguments);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2, typename... arg>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const MdStaticArray<T1> &first, const MdStaticArrayReference<T2> &other,
        const MdStaticArrayReference<arg> &...arguments);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2, typename... arg>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const MdStaticArrayReference<T1> &first, const MdStaticArray<T2> &other,
        const MdStaticArrayReference<arg> &...arguments);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const MdStaticArray<T1> &first, const MdStaticArray<T2> &other);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const MdStaticArrayReference<T1> &first,
        const MdStaticArrayReference<T2> &other);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const MdStaticArrayReference<T1> &first,
        const MdStaticArray<T2> &other);

    /**
     * @brief Dot product of two N-dimensional array
     * @todo perform operations for 1D arrays as well
     * @tparam T1 type of first array
     * @tparam T2 type of other array
     * @tparam T3 type of result array
     * @param first first nd array of shape (a1, a2, ... , a(m-1), am) (m are
     * total dimensions of array a)
     * @param other second nd array of shape (b1, b2, ... , b(n-1), bn) (n are
     * total dimensions of array b)
     * @returns new nd array of shape (a1, a2, ... , a(x-1), b1, b2, ... ,
     * b(n-2), bn)
     * @throws Exceptions when axis 'b(n-1)' is not the same size as axis 'am'
     */
    template <typename _Tfinal, typename T1, typename T2>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const MdStaticArray<T1> &, const MdStaticArrayReference<T2> &);

    /**
     * @brief Multiply two matrices
     * @tparam T1 type of first matrix
     * @tparam T2 type of second matrix
     * @tparam T3 type of third matrix (upto user)
     * @param first first matrix
     * @param other second matrix
     * @param threads (optional) number of threads to operate on
     * @returns new matrix of type T3
     * @throws Runtime error when
     *  1. matrix dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> mat_multiply(const MdStaticArray<T1> &first,
                                          const MdStaticArray<T2> &other,
                                          const int threads = -1);

    /**
     * @brief Multiply two matrices
     * @tparam T1 type of first matrix
     * @tparam T2 type of second matrix
     * @tparam T3 type of third matrix (upto user)
     * @param first first matrix
     * @param other second matrix
     * @param threads (optional) number of threads to operate on
     * @returns new matrix of type T3
     * @throws Runtime error when
     *  1. matrix dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> mat_multiply(
        const MdStaticArrayReference<T1> &first, const MdStaticArray<T2> &other,
        const int threads = -1);

    /**
     * @brief Multiply two matrices
     * @tparam T1 type of first matrix
     * @tparam T2 type of second matrix
     * @tparam T3 type of third matrix (upto user)
     * @param first first matrix
     * @param other second matrix
     * @param threads (optional) number of threads to operate on
     * @returns new matrix of type T3
     * @throws Runtime error when
     *  1. matrix dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> mat_multiply(
        const MdStaticArray<T1> &first, const MdStaticArrayReference<T2> &other,
        const int threads = -1);

    /**
     * @brief Multiply two matrices
     * @tparam T1 type of first matrix
     * @tparam T2 type of second matrix
     * @tparam T3 type of third matrix (upto user)
     * @param first first matrix
     * @param other second matrix
     * @param threads (optional) number of threads to operate on
     * @returns new matrix of type T3
     * @throws Runtime error when
     *  1. matrix dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> mat_multiply(
        const MdStaticArrayReference<T1> &first,
        const MdStaticArrayReference<T2> &other, const int threads = -1);

    /**
     * @brief Multiply two matrices
     * @tparam T1 type of first matrix
     * @tparam T2 type of second matrix
     * @tparam T3 type of third matrix (upto user)
     * @param first first matrix
     * @param other second matrix
     * @param mod modulo to operate
     * @param threads (optional) number of threads to operate on
     * @returns new matrix of type T3
     * @throws Runtime error when
     *  1. matrix dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2,
              class = typename std::enable_if<
                  std::is_integral<T1>::value && std::is_integral<T2>::value &&
                  std::is_integral<T3>::value>::type>
    static MdStaticArray<T3> mat_mod_multiply(const MdStaticArray<T1> &first,
                                              const MdStaticArray<T2> &other,
                                              const size_t mod,
                                              const size_t threads = 16);

    /**
     * @brief Multiply two matrices
     * @tparam T1 type of first matrix
     * @tparam T2 type of second matrix
     * @tparam T3 type of third matrix (upto user)
     * @param first first matrix
     * @param other second matrix
     * @param threads (optional) number of threads to operate on
     * @returns new matrix of type T3
     * @throws Runtime error when
     *  1. matrix dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2,
              class = typename std::enable_if<
                  std::is_integral<T1>::value && std::is_integral<T2>::value &&
                  std::is_integral<T3>::value>::type>
    static MdStaticArray<T3> mat_mod_multiply(
        const MdStaticArrayReference<T1> &first, const MdStaticArray<T2> &other,
        const size_t mod, const size_t threads = 16);

    /**
     * @brief Multiply two matrices
     * @tparam T1 type of first matrix
     * @tparam T2 type of second matrix
     * @tparam T3 type of third matrix (upto user)
     * @param first first matrix
     * @param other second matrix
     * @param threads (optional) number of threads to operate on
     * @returns new matrix of type T3
     * @throws Runtime error when
     *  1. matrix dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2,
              class = typename std::enable_if<
                  std::is_integral<T1>::value && std::is_integral<T2>::value &&
                  std::is_integral<T3>::value>::type>
    static MdStaticArray<T3> mat_mod_multiply(
        const MdStaticArray<T1> &first, const MdStaticArrayReference<T2> &other,
        const size_t mod, const size_t threads = 16);

    /**
     * @brief Multiply two matrices
     * @tparam T1 type of first matrix
     * @tparam T2 type of second matrix
     * @tparam T3 type of third matrix (upto user)
     * @param first first matrix
     * @param other second matrix
     * @param threads (optional) number of threads to operate on
     * @returns new matrix of type T3
     * @throws Runtime error when
     *  1. matrix dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2,
              class = typename std::enable_if<
                  std::is_integral<T1>::value && std::is_integral<T2>::value &&
                  std::is_integral<T3>::value>::type>
    static MdStaticArray<T3> mat_mod_multiply(
        const MdStaticArrayReference<T1> &first,
        const MdStaticArrayReference<T2> &other, const size_t mod,
        const size_t threads = 16);

    /**
     * @brief inner product of two nd arrays
     * @tparam T1 type of first ndarray
     * @tparam T2 type of second ndarray
     * @tparam T3 type of third ndarray (upto user)
     * @param first first ndarray
     * @param other second ndarray
     * @param threads (optional) number of threads to operate on
     * @returns new ndarray of type T3
     * @throws Runtime error when
     *  1. ndarray dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> inner(const MdStaticArray<T1> &first,
                                   const MdStaticArray<T2> &other,
                                   const size_t threads = 16);

    /**
     * @brief inner product of two nd arrays
     * @tparam T1 type of first ndarray
     * @tparam T2 type of second ndarray
     * @tparam T3 type of third ndarray (upto user)
     * @param first first ndarray
     * @param other second ndarray
     * @param threads (optional) number of threads to operate on
     * @returns new ndarray of type T3
     * @throws Runtime error when
     *  1. ndarray dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> inner(const MdStaticArrayReference<T1> &first,
                                   const MdStaticArray<T2> &other,
                                   const size_t threads = 16);

    /**
     * @brief inner product of two nd arrays
     * @tparam T1 type of first ndarray
     * @tparam T2 type of second ndarray
     * @tparam T3 type of third ndarray (upto user)
     * @param first first ndarray
     * @param other second ndarray
     * @param threads (optional) number of threads to operate on
     * @returns new ndarray of type T3
     * @throws Runtime error when
     *  1. ndarray dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> inner(const MdStaticArray<T1> &first,
                                   const MdStaticArrayReference<T2> &other,
                                   const size_t threads = 16);

    /**
     * @brief inner product of two nd arrays
     * @tparam T1 type of first ndarray
     * @tparam T2 type of second ndarray
     * @tparam T3 type of third ndarray (upto user)
     * @param first first ndarray
     * @param other second ndarray
     * @param threads (optional) number of threads to operate on
     * @returns new ndarray of type T3
     * @throws Runtime error when
     *  1. ndarray dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> inner(const MdStaticArrayReference<T1> &first,
                                   const MdStaticArrayReference<T2> &other,
                                   const size_t threads = 16);

    /**
     * @brief Generate cross product of two 1d array
     * @tparam T1 type of first matrix
     * @tparam T2 type of second matrix
     * @tparam T3 type of third matrix (upto user)
     * @param first first matrix
     * @param other second matrix
     * @param threads (optional) number of threads to operate on
     * @returns new matrix of type T3
     * @throws Runtime error when
     *  1. matrix dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> outer(const MdStaticArray<T1> &first,
                                   const MdStaticArray<T2> &other,
                                   const size_t threads = 16);

    /**
     * @brief Generate cross product of two 1d array
     * @tparam T1 type of first matrix
     * @tparam T2 type of second matrix
     * @tparam T3 type of third matrix (upto user)
     * @param first first matrix
     * @param other second matrix
     * @param threads (optional) number of threads to operate on
     * @returns new matrix of type T3
     * @throws Runtime error when
     *  1. matrix dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> outer(const MdStaticArrayReference<T1> &first,
                                   const MdStaticArray<T2> &other,
                                   const size_t threads = 16);

    /**
     * @brief Generate cross product of two 1d array
     * @tparam T1 type of first matrix
     * @tparam T2 type of second matrix
     * @tparam T3 type of third matrix (upto user)
     * @param first first matrix
     * @param other second matrix
     * @param threads (optional) number of threads to operate on
     * @returns new matrix of type T3
     * @throws Runtime error when
     *  1. matrix dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> outer(const MdStaticArray<T1> &first,
                                   const MdStaticArrayReference<T2> &other,
                                   const size_t threads = 16);

    /**
     * @brief Generate cross product of two 1d array
     * @tparam T1 type of first matrix
     * @tparam T2 type of second matrix
     * @tparam T3 type of third matrix (upto user)
     * @param first first matrix
     * @param other second matrix
     * @param threads (optional) number of threads to operate on
     * @returns new matrix of type T3
     * @throws Runtime error when
     *  1. matrix dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> outer(const MdStaticArrayReference<T1> &first,
                                   const MdStaticArrayReference<T2> &other,
                                   const size_t threads = 16);

    /**
     * @brief Create a identity matrix
     * @param T type for matrix
     * @param n size of matrix
     * @returns a n x n matrix
     */
    template <typename T>
    static MdStaticArray<T> identity(size_t n);

    /**
     * @brief Verify if matrix is boolean
     * @tparam T matrix type
     * @param other test matrix
     * @return true if matrix is identity, else false
     */
    template <typename T>
    static bool is_identity(const MdStaticArray<T> &other);

    /**
     * @brief Verify if matrix is boolean
     * @tparam T matrix type
     * @param other test matrix reference
     * @return true if matrix is identity, else false
     */
    template <typename T>
    static bool is_identity(const MdStaticArrayReference<T> &other);

    /**
     * @brief Perform kron operations between 2 n-d array
     * @tparam T1 nd array of type T1
     * @tparam T2 nd array of type T2
     * @tparam T3 nd array output of type T3
     * @param first first nd array
     * @param other other md array
     * @param total_threads total threads to perform the operation.
     * @returns resultant array of size max(n,m) dimension
     */
    template <typename T1, typename T2, typename T3>
    static MdStaticArray<T3> kron(const MdStaticArray<T1> &first,
                                  const MdStaticArray<T2> &other,
                                  const size_t total_threads = 16);

    /**
     * @brief Perform kron operations between 2 n-d array
     * @tparam T1 nd array of type T1
     * @tparam T2 nd array of type T2
     * @tparam T3 nd array output of type T3
     * @param first first nd array
     * @param other other md array
     * @param total_threads total threads to perform the operation.
     * @returns resultant array of size max(n,m) dimension
     */
    template <typename T1, typename T2, typename T3>
    static MdStaticArray<T3> kron(const MdStaticArrayReference<T1> &first,
                                  const MdStaticArrayReference<T2> &other,
                                  const size_t total_threads = 16);

    /**
     * @brief Perform kron operations between 2 n-d array
     * @tparam T1 nd array of type T1
     * @tparam T2 nd array of type T2
     * @tparam T3 nd array output of type T3
     * @param first first nd array
     * @param other other md array
     * @param total_threads total threads to perform the operation.
     * @returns resultant array of size max(n,m) dimension
     */
    template <typename T1, typename T2, typename T3>
    static MdStaticArray<T3> kron(const MdStaticArrayReference<T1> &first,
                                  const MdStaticArray<T2> &other,
                                  const size_t total_threads = 16);

    /**
     * @brief Perform kron operations between 2 n-d array
     * @tparam T1 nd array of type T1
     * @tparam T2 nd array of type T2
     * @tparam T3 nd array output of type T3
     * @param first first nd array
     * @param other other md array
     * @param total_threads total threads to perform the operation.
     * @returns resultant array of size max(n,m) dimension
     */
    template <typename T1, typename T2, typename T3>
    static MdStaticArray<T3> kron(const MdStaticArray<T1> &first,
                                  const MdStaticArrayReference<T2> &other,
                                  const size_t total_threads = 16);

    /**
     * @brief Multiply matrix to the power a positive integer.
     * @tparam T type of array
     * @param first first matrix
     * @param power the power
     * @returns new matrix
     */
    template <typename T, class = typename std::enable_if<
                              std::is_floating_point<T>::value>::type>
    static MdStaticArray<T> matrix_power(const MdStaticArray<T> &,
                                         const size_t power);

    /**
     * @brief Multiply matrix to the power a positive integer.
     * @tparam T type of array
     * @param first first matrix
     * @param power the power
     * @returns new matrix
     */
    template <typename T, class = typename std::enable_if<
                              std::is_floating_point<T>::value>::type>
    static MdStaticArray<T> matrix_power(const MdStaticArrayReference<T> &,
                                         const size_t power);

    /**
     * @brief Multiply matrix to the power a positive integer.
     * @tparam T type of array
     * @param first first matrix
     * @param power the power
     * @returns new matrix
     */
    template <typename T,
              class = typename std::enable_if<std::is_integral<T>::value>::type>
    static MdStaticArray<T> matrix_mod_power(const MdStaticArray<T> &,
                                             const size_t power,
                                             const size_t mod);

    /**
     * @brief Multiply matrix to the power a positive integer.
     * @tparam T type of array
     * @param first first matrix
     * @param power the power
     * @returns new matrix
     */
    template <typename T,
              class = typename std::enable_if<std::is_integral<T>::value>::type>
    static MdStaticArray<T> matrix_mod_power(const MdStaticArrayReference<T> &,
                                             const size_t power,
                                             const size_t mod);

    /**
     * @brief Evaluate determinant of a matrix.
     * @tparam T type of array
     * @param first first matrix
     * @returns new matrix
     */
    template <typename T>
    static long double det(const MdStaticArray<T> &);

    /**
     * @brief Evaluate determinant of a matrix.
     * @tparam T type of array
     * @param first first matrix
     * @returns new matrix
     */
    template <typename T>
    static long double det(const MdStaticArrayReference<T> &);

    /**
     * @brief Evaluate LU factorization of a matrix.
     * @tparam T type of array
     * @param first first matrix
     * @returns new matrix
     */
    template <typename _Tres, typename T>
    static std::tuple<MdStaticArray<_Tres>, MdStaticArray<_Tres>,
                      MdStaticArray<_Tres>, int>
    lu_decompose(const MdStaticArray<T> &);

    /**
     * @brief Evaluate LU factorization of a matrix.
     * @tparam T type of array
     * @param first first matrix
     * @returns new matrix
     */
    template <typename _Tres, typename T>
    static std::tuple<MdStaticArray<_Tres>, MdStaticArray<_Tres>,
                      MdStaticArray<_Tres>, int>
    lu_decompose(const MdStaticArrayReference<T> &);

    /**
     * @brief Evaluate complex determinant of a matrix.
     * @tparam T type of array
     * @param first first matrix
     * @returns new matrix
     */
    template <typename T>
    static clongdouble c_det(const MdStaticArray<T> &);

    /**
     * @brief Evaluate complex determinant of a matrix.
     * @tparam T type of array
     * @param first first matrix
     * @returns new matrix
     */
    template <typename T>
    static clongdouble c_det(const MdStaticArrayReference<T> &);

    /**
     * @brief Generate v_dot of two ndarray
     * @tparam T1 complex type of first ndarray
     * @tparam T2 type of second ndarray
     * @tparam T3 type of third ndarray (upto user)
     * @param first first ndarray
     * @param other second ndarray
     * @param threads (optional) number of threads to operate on
     * @returns new ndarray of type T3
     * @throws Runtime error when
     *  1. ndarray dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> vdot(const MdStaticArray<Complex<T1>> &first,
                                  const MdStaticArray<T2> &other,
                                  const size_t threads = 16);

    /**
     * @brief Generate v_dot of two ndarray
     * @tparam T1 complex type of first ndarray
     * @tparam T2 type of second ndarray
     * @tparam T3 type of third ndarray (upto user)
     * @param first first ndarray
     * @param other second ndarray
     * @param threads (optional) number of threads to operate on
     * @returns new ndarray of type T3
     * @throws Runtime error when
     *  1. ndarray dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> vdot(
        const MdStaticArrayReference<Complex<T1>> &first,
        const MdStaticArray<T2> &other, const size_t threads = 16);

    /**
     * @brief Generate v_dot of two ndarray
     * @tparam T1 complex type of first ndarray
     * @tparam T2 type of second ndarray
     * @tparam T3 type of third ndarray (upto user)
     * @param first first ndarray
     * @param other second ndarray
     * @param threads (optional) number of threads to operate on
     * @returns new ndarray of type T3
     * @throws Runtime error when
     *  1. ndarray dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> vdot(const MdStaticArray<Complex<T1>> &first,
                                  const MdStaticArrayReference<T2> &other,
                                  const size_t threads = 16);

    /**
     * @brief Generate v_dot of two ndarray
     * @tparam T1 complex type of first ndarray
     * @tparam T2 type of second ndarray
     * @tparam T3 type of third ndarray (upto user)
     * @param first first ndarray
     * @param other second ndarray
     * @param threads (optional) number of threads to operate on
     * @returns new ndarray of type T3
     * @throws Runtime error when
     *  1. ndarray dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> vdot(
        const MdStaticArrayReference<Complex<T1>> &first,
        const MdStaticArrayReference<T2> &other, const size_t threads = 16);

    /**
     * @brief Generate v_dot of two ndarray
     * @tparam T1 complex type of first ndarray
     * @tparam T2 type of second ndarray
     * @tparam T3 type of third ndarray (upto user)
     * @param first first ndarray
     * @param other second ndarray
     * @param threads (optional) number of threads to operate on
     * @returns new ndarray of type T3
     * @throws Runtime error when
     *  1. ndarray dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> vdot(const MdStaticArray<T1> &first,
                                  const MdStaticArray<T2> &other,
                                  const size_t threads = 16);

    /**
     * @brief Generate v_dot of two ndarray
     * @tparam T1 complex type of first ndarray
     * @tparam T2 type of second ndarray
     * @tparam T3 type of third ndarray (upto user)
     * @param first first ndarray
     * @param other second ndarray
     * @param threads (optional) number of threads to operate on
     * @returns new ndarray of type T3
     * @throws Runtime error when
     *  1. ndarray dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> vdot(const MdStaticArrayReference<T1> &first,
                                  const MdStaticArray<T2> &other,
                                  const size_t threads = 16);

    /**
     * @brief Generate v_dot of two ndarray
     * @tparam T1 complex type of first ndarray
     * @tparam T2 type of second ndarray
     * @tparam T3 type of third ndarray (upto user)
     * @param first first ndarray
     * @param other second ndarray
     * @param threads (optional) number of threads to operate on
     * @returns new ndarray of type T3
     * @throws Runtime error when
     *  1. ndarray dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> vdot(const MdStaticArray<T1> &first,
                                  const MdStaticArrayReference<T2> &other,
                                  const size_t threads = 16);

    /**
     * @brief Generate v_dot of two ndarray
     * @tparam T1 complex type of first ndarray
     * @tparam T2 type of second ndarray
     * @tparam T3 type of third ndarray (upto user)
     * @param first first ndarray
     * @param other second ndarray
     * @param threads (optional) number of threads to operate on
     * @returns new ndarray of type T3
     * @throws Runtime error when
     *  1. ndarray dimensions do not match
     *  2. size of second axis of first is not equal to size of first axis
     * of
     * other
     */
    template <typename T3, typename T1, typename T2>
    static MdStaticArray<T3> vdot(const MdStaticArrayReference<T1> &first,
                                  const MdStaticArrayReference<T2> &other,
                                  const size_t threads = 16);
};

typedef MdLinearAlgebra Linalg;

#endif
