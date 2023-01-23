#pragma once

#ifndef _MD_LINEAR_ALGEBRA_HPP_
#define _MD_LINEAR_ALGEBRA_HPP_

#include "../md_static_array.hpp"

struct MdLinearAlgebra {
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
    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> dot(const MdStaticArray<_T1> &__first,
                                  const MdStaticArray<_T2> &__other,
                                  const size_t threads = 16);

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
    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> dot(
        const MdStaticArray<_T1> &__first,
        const typename MdStaticArray<_T2>::reference &__other,
        const size_t threads = 16);

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
    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> dot(
        const typename MdStaticArray<_T1>::reference &__first,
        const MdStaticArray<_T2> &__other, const size_t threads = 16);

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
    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> dot(
        const typename MdStaticArray<_T1>::reference &__first,
        const typename MdStaticArray<_T2>::reference &__other,
        const size_t threads = 16);

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
    template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
    static MdStaticArray<_Tfinal> multi_dot(
        const MdStaticArray<_T1> &__first, const MdStaticArray<_T2> &__other,
        const MdStaticArray<arg> &...arguments);

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
    template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
    static MdStaticArray<_Tfinal> multi_dot(
        const typename MdStaticArray<_T1>::reference &__first,
        const typename MdStaticArray<_T2>::reference &__other,
        const MdStaticArray<arg> &...arguments);

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
    template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
    static MdStaticArray<_Tfinal> multi_dot(
        const MdStaticArray<_T1> &__first,
        const typename MdStaticArray<_T2>::reference &__other,
        const MdStaticArray<arg> &...arguments);

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
    template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
    static MdStaticArray<_Tfinal> multi_dot(
        const typename MdStaticArray<_T1>::reference &__first,
        const MdStaticArray<_T2> &__other,
        const MdStaticArray<arg> &...arguments);

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
    template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
    static MdStaticArray<_Tfinal> multi_dot(
        const MdStaticArray<_T1> &__first, const MdStaticArray<_T2> &__other,
        const typename MdStaticArray<arg>::reference &...arguments);

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
    template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
    static MdStaticArray<_Tfinal> multi_dot(
        const typename MdStaticArray<_T1>::reference &__first,
        const typename MdStaticArray<_T2>::reference &__other,
        const typename MdStaticArray<arg>::reference &...arguments);

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
    template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
    static MdStaticArray<_Tfinal> multi_dot(
        const MdStaticArray<_T1> &__first,
        const typename MdStaticArray<_T2>::reference &__other,
        const typename MdStaticArray<arg>::reference &...arguments);

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
    template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
    static MdStaticArray<_Tfinal> multi_dot(
        const typename MdStaticArray<_T1>::reference &__first,
        const MdStaticArray<_T2> &__other,
        const typename MdStaticArray<arg>::reference &...arguments);

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
    template <typename _Tfinal, typename _T1, typename _T2>
    static MdStaticArray<_Tfinal> multi_dot(const MdStaticArray<_T1> &__first,
                                            const MdStaticArray<_T2> &__other);

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
    template <typename _Tfinal, typename _T1, typename _T2>
    static MdStaticArray<_Tfinal> multi_dot(
        const typename MdStaticArray<_T1>::reference &__first,
        const typename MdStaticArray<_T2>::reference &__other);

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
    template <typename _Tfinal, typename _T1, typename _T2>
    static MdStaticArray<_Tfinal> multi_dot(
        const typename MdStaticArray<_T1>::reference &__first,
        const MdStaticArray<_T2> &__other);

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
    template <typename _Tfinal, typename _T1, typename _T2>
    static MdStaticArray<_Tfinal> multi_dot(
        const MdStaticArray<_T1> &,
        const typename MdStaticArray<_T2>::reference &);

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
    template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const MdStaticArray<_T1> &__first, const MdStaticArray<_T2> &__other,
        const MdStaticArray<arg> &...arguments);

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
    template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const typename MdStaticArray<_T1>::reference &__first,
        const typename MdStaticArray<_T2>::reference &__other,
        const MdStaticArray<arg> &...arguments);

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
    template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const MdStaticArray<_T1> &__first,
        const typename MdStaticArray<_T2>::reference &__other,
        const MdStaticArray<arg> &...arguments);

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
    template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const typename MdStaticArray<_T1>::reference &__first,
        const MdStaticArray<_T2> &__other,
        const MdStaticArray<arg> &...arguments);

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
    template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const MdStaticArray<_T1> &__first, const MdStaticArray<_T2> &__other,
        const typename MdStaticArray<arg>::reference &...arguments);

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
    template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const typename MdStaticArray<_T1>::reference &__first,
        const typename MdStaticArray<_T2>::reference &__other,
        const typename MdStaticArray<arg>::reference &...arguments);

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
    template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const MdStaticArray<_T1> &__first,
        const typename MdStaticArray<_T2>::reference &__other,
        const typename MdStaticArray<arg>::reference &...arguments);

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
    template <typename _Tfinal, typename _T1, typename _T2, typename... arg>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const typename MdStaticArray<_T1>::reference &__first,
        const MdStaticArray<_T2> &__other,
        const typename MdStaticArray<arg>::reference &...arguments);

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
    template <typename _Tfinal, typename _T1, typename _T2>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const MdStaticArray<_T1> &__first, const MdStaticArray<_T2> &__other);

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
    template <typename _Tfinal, typename _T1, typename _T2>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const typename MdStaticArray<_T1>::reference &__first,
        const typename MdStaticArray<_T2>::reference &__other);

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
    template <typename _Tfinal, typename _T1, typename _T2>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const typename MdStaticArray<_T1>::reference &__first,
        const MdStaticArray<_T2> &__other);

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
    template <typename _Tfinal, typename _T1, typename _T2>
    static MdStaticArray<_Tfinal> matrix_chain_multiply(
        const MdStaticArray<_T1> &,
        const typename MdStaticArray<_T2>::reference &);

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
    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> mat_multiply(const MdStaticArray<_T1> &__first,
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
    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> mat_multiply(
        const typename MdStaticArray<_T1>::reference &__first,
        const MdStaticArray<_T2> &__other, const size_t threads = 16);

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
    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> mat_multiply(
        const MdStaticArray<_T1> &__first,
        const typename MdStaticArray<_T2>::reference &__other,
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
    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> mat_multiply(
        const typename MdStaticArray<_T1>::reference &__first,
        const typename MdStaticArray<_T2>::reference &__other,
        const size_t threads = 16);

    /**
     * @brief Multiply two matrices
     * @tparam _T1 type of first matrix
     * @tparam _T2 type of second matrix
     * @tparam _T3 type of third matrix (upto user)
     * @param __first first matrix
     * @param __other second matrix
     * @param __mod modulo to operate
     * @param threads (optional) number of threads to operate on
     * @returns new matrix of type _T3
     * @throws Runtime error when
     *  1. matrix dimensions do not match
     *  2. size of second axis of __first is not equal to size of first axis
     * of
     * __other
     */
    template <
        typename _T3, typename _T1, typename _T2,
        class = typename std::enable_if<std::is_integral<_T1>::value &&
                                        std::is_integral<_T2>::value &&
                                        std::is_integral<_T3>::value>::type>
    static MdStaticArray<_T3> mat_mod_multiply(
        const MdStaticArray<_T1> &__first, const MdStaticArray<_T2> &__other,
        const size_t __mod, const size_t threads = 16);

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
    template <
        typename _T3, typename _T1, typename _T2,
        class = typename std::enable_if<std::is_integral<_T1>::value &&
                                        std::is_integral<_T2>::value &&
                                        std::is_integral<_T3>::value>::type>
    static MdStaticArray<_T3> mat_mod_multiply(
        const typename MdStaticArray<_T1>::reference &__first,
        const MdStaticArray<_T2> &__other, const size_t __mod,
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
    template <
        typename _T3, typename _T1, typename _T2,
        class = typename std::enable_if<std::is_integral<_T1>::value &&
                                        std::is_integral<_T2>::value &&
                                        std::is_integral<_T3>::value>::type>
    static MdStaticArray<_T3> mat_mod_multiply(
        const MdStaticArray<_T1> &__first,
        const typename MdStaticArray<_T2>::reference &__other,
        const size_t __mod, const size_t threads = 16);

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
    template <
        typename _T3, typename _T1, typename _T2,
        class = typename std::enable_if<std::is_integral<_T1>::value &&
                                        std::is_integral<_T2>::value &&
                                        std::is_integral<_T3>::value>::type>
    static MdStaticArray<_T3> mat_mod_multiply(
        const typename MdStaticArray<_T1>::reference &__first,
        const typename MdStaticArray<_T2>::reference &__other,
        const size_t __mod, const size_t threads = 16);

    /**
     * @brief inner product of two nd arrays
     * @tparam _T1 type of first ndarray
     * @tparam _T2 type of second ndarray
     * @tparam _T3 type of third ndarray (upto user)
     * @param __first first ndarray
     * @param __other second ndarray
     * @param threads (optional) number of threads to operate on
     * @returns new ndarray of type _T3
     * @throws Runtime error when
     *  1. ndarray dimensions do not match
     *  2. size of second axis of __first is not equal to size of first axis
     * of
     * __other
     */
    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> inner(const MdStaticArray<_T1> &__first,
                                    const MdStaticArray<_T2> &__other,
                                    const size_t threads = 16);

    /**
     * @brief inner product of two nd arrays
     * @tparam _T1 type of first ndarray
     * @tparam _T2 type of second ndarray
     * @tparam _T3 type of third ndarray (upto user)
     * @param __first first ndarray
     * @param __other second ndarray
     * @param threads (optional) number of threads to operate on
     * @returns new ndarray of type _T3
     * @throws Runtime error when
     *  1. ndarray dimensions do not match
     *  2. size of second axis of __first is not equal to size of first axis
     * of
     * __other
     */
    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> inner(
        const typename MdStaticArray<_T1>::reference &__first,
        const MdStaticArray<_T2> &__other, const size_t threads = 16);

    /**
     * @brief inner product of two nd arrays
     * @tparam _T1 type of first ndarray
     * @tparam _T2 type of second ndarray
     * @tparam _T3 type of third ndarray (upto user)
     * @param __first first ndarray
     * @param __other second ndarray
     * @param threads (optional) number of threads to operate on
     * @returns new ndarray of type _T3
     * @throws Runtime error when
     *  1. ndarray dimensions do not match
     *  2. size of second axis of __first is not equal to size of first axis
     * of
     * __other
     */
    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> inner(
        const MdStaticArray<_T1> &__first,
        const typename MdStaticArray<_T2>::reference &__other,
        const size_t threads = 16);

    /**
     * @brief inner product of two nd arrays
     * @tparam _T1 type of first ndarray
     * @tparam _T2 type of second ndarray
     * @tparam _T3 type of third ndarray (upto user)
     * @param __first first ndarray
     * @param __other second ndarray
     * @param threads (optional) number of threads to operate on
     * @returns new ndarray of type _T3
     * @throws Runtime error when
     *  1. ndarray dimensions do not match
     *  2. size of second axis of __first is not equal to size of first axis
     * of
     * __other
     */
    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> inner(
        const typename MdStaticArray<_T1>::reference &__first,
        const typename MdStaticArray<_T2>::reference &__other,
        const size_t threads = 16);

    /**
     * @brief Generate cross product of two 1d array
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
    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> outer(const MdStaticArray<_T1> &__first,
                                    const MdStaticArray<_T2> &__other,
                                    const size_t threads = 16);

    /**
     * @brief Generate cross product of two 1d array
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
    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> outer(
        const typename MdStaticArray<_T1>::reference &__first,
        const MdStaticArray<_T2> &__other, const size_t threads = 16);

    /**
     * @brief Generate cross product of two 1d array
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
    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> outer(
        const MdStaticArray<_T1> &__first,
        const typename MdStaticArray<_T2>::reference &__other,
        const size_t threads = 16);

    /**
     * @brief Generate cross product of two 1d array
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
    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> outer(
        const typename MdStaticArray<_T1>::reference &__first,
        const typename MdStaticArray<_T2>::reference &__other,
        const size_t threads = 16);

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
     * @tparam _T matrix type
     * @param __other test matrix
     * @return true if matrix is identity, else false
     */
    template <typename _T>
    static bool is_identity(const MdStaticArray<_T> &__other);

    /**
     * @brief Verify if matrix is boolean
     * @tparam _T matrix type
     * @param __other test matrix reference
     * @return true if matrix is identity, else false
     */
    template <typename _T>
    static bool is_identity(
        const typename MdStaticArray<_T>::reference &__other);

    /**
     * @brief Perform kron operations between 2 n-d array
     * @tparam _T1 nd array of type _T1
     * @tparam _T2 nd array of type _T2
     * @tparam _T3 nd array output of type _T3
     * @param __first first nd array
     * @param __other other md array
     * @param total_threads total threads to perform the operation.
     * @returns resultant array of size max(n,m) dimension
     */
    template <typename _T1, typename _T2, typename _T3>
    static MdStaticArray<_T3> kron(const MdStaticArray<_T1> &__first,
                                   const MdStaticArray<_T2> &__other,
                                   const size_t total_threads = 16);

    /**
     * @brief Perform kron operations between 2 n-d array
     * @tparam _T1 nd array of type _T1
     * @tparam _T2 nd array of type _T2
     * @tparam _T3 nd array output of type _T3
     * @param __first first nd array
     * @param __other other md array
     * @param total_threads total threads to perform the operation.
     * @returns resultant array of size max(n,m) dimension
     */
    template <typename _T1, typename _T2, typename _T3>
    static MdStaticArray<_T3> kron(
        const typename MdStaticArray<_T1>::reference &__first,
        const typename MdStaticArray<_T2>::reference &__other,
        const size_t total_threads = 16);

    /**
     * @brief Perform kron operations between 2 n-d array
     * @tparam _T1 nd array of type _T1
     * @tparam _T2 nd array of type _T2
     * @tparam _T3 nd array output of type _T3
     * @param __first first nd array
     * @param __other other md array
     * @param total_threads total threads to perform the operation.
     * @returns resultant array of size max(n,m) dimension
     */
    template <typename _T1, typename _T2, typename _T3>
    static MdStaticArray<_T3> kron(
        const typename MdStaticArray<_T1>::reference &__first,
        const MdStaticArray<_T2> &__other, const size_t total_threads = 16);

    /**
     * @brief Perform kron operations between 2 n-d array
     * @tparam _T1 nd array of type _T1
     * @tparam _T2 nd array of type _T2
     * @tparam _T3 nd array output of type _T3
     * @param __first first nd array
     * @param __other other md array
     * @param total_threads total threads to perform the operation.
     * @returns resultant array of size max(n,m) dimension
     */
    template <typename _T1, typename _T2, typename _T3>
    static MdStaticArray<_T3> kron(
        const MdStaticArray<_T1> &__first,
        const typename MdStaticArray<_T2>::reference &__other,
        const size_t total_threads = 16);

    /**
     * @brief Multiply matrix to the power a positive integer.
     * @tparam _T type of array
     * @param __first first matrix
     * @param power the power
     * @returns new matrix
     */
    template <typename _T, class = typename std::enable_if<
                               std::is_floating_point<_T>::value>::type>
    static MdStaticArray<_T> matrix_power(const MdStaticArray<_T> &,
                                          const size_t power);

    /**
     * @brief Multiply matrix to the power a positive integer.
     * @tparam _T type of array
     * @param __first first matrix
     * @param power the power
     * @returns new matrix
     */
    template <typename _T, class = typename std::enable_if<
                               std::is_floating_point<_T>::value>::type>
    static MdStaticArray<_T> matrix_power(
        const typename MdStaticArray<_T>::reference &, const size_t power);

    /**
     * @brief Multiply matrix to the power a positive integer.
     * @tparam _T type of array
     * @param __first first matrix
     * @param power the power
     * @returns new matrix
     */
    template <typename _T, class = typename std::enable_if<
                               std::is_integral<_T>::value>::type>
    static MdStaticArray<_T> matrix_mod_power(const MdStaticArray<_T> &,
                                              const size_t power,
                                              const size_t __mod);

    /**
     * @brief Multiply matrix to the power a positive integer.
     * @tparam _T type of array
     * @param __first first matrix
     * @param power the power
     * @returns new matrix
     */
    template <typename _T, class = typename std::enable_if<
                               std::is_integral<_T>::value>::type>
    static MdStaticArray<_T> matrix_mod_power(
        const typename MdStaticArray<_T>::reference &, const size_t power,
        const size_t __mod);

    /**
     * @brief Evaluate determinant of a matrix.
     * @tparam _T type of array
     * @param __first first matrix
     * @returns new matrix
     */
    template <typename _T>
    static long double det(const MdStaticArray<_T> &);

    /**
     * @brief Evaluate determinant of a matrix.
     * @tparam _T type of array
     * @param __first first matrix
     * @returns new matrix
     */
    template <typename _T>
    static long double det(const typename MdStaticArray<_T>::reference &);

    /**
     * @brief Evaluate LU factorization of a matrix.
     * @tparam _T type of array
     * @param __first first matrix
     * @returns new matrix
     */
    template <typename _Tres, typename _T>
    static std::tuple<MdStaticArray<_Tres>, MdStaticArray<_Tres>,
                      MdStaticArray<_Tres>, int>
    lu_decompose(const MdStaticArray<_T> &);

    /**
     * @brief Evaluate LU factorization of a matrix.
     * @tparam _T type of array
     * @param __first first matrix
     * @returns new matrix
     */
    template <typename _Tres, typename _T>
    static std::tuple<MdStaticArray<_Tres>, MdStaticArray<_Tres>,
                      MdStaticArray<_Tres>, int>
    lu_decompose(const typename MdStaticArray<_T>::reference &);

    /**
     * @brief Evaluate determinant of a matrix.
     * @tparam _T type of array
     * @param __first first matrix
     * @returns new matrix
     */
    template <typename _T>
    static clongdouble c_det(const MdStaticArray<_T> &);

    /**
     * @brief Evaluate determinant of a matrix.
     * @tparam _T type of array
     * @param __first first matrix
     * @returns new matrix
     */
    template <typename _T>
    static clongdouble c_det(const typename MdStaticArray<_T>::reference &);
};

#endif
