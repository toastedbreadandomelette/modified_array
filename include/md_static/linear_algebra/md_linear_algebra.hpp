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
                                           const _T3 as = 0,
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
     * @param _T matrix type
     * @param __other test matrix
     * @return true if matrix is identity, else false
     */
    template <typename _T>
    static bool is_identity(const MdStaticArray<_T> &__other);
};

#endif
