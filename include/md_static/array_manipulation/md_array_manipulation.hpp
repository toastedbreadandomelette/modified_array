#pragma once

#ifndef _MD_ARRAY_MANIPULATION_HPP_
#define _MD_ARRAY_MANIPULATION_HPP_

#include "../md_static_array.hpp"

struct MdArrayManipulate {
    /**
     * @brief Create array with entries zero
     * @tparam _T type of array
     * @param __size size to be created
     * @returns array of size __size with all entries as zeros
     */
    template <typename _T>
    static MdStaticArray<_T> zeros(const size_t __size);

    /**
     * @brief Create array with entries zero
     * @tparam _T type of array
     * @param __shape size to be created
     * @returns array of size __size with all entries as zeros
     */
    template <typename _T>
    static MdStaticArray<_T> zeros(const std::vector<size_t> &__shape);

    /**
     * @brief Create array with entries one
     * @tparam _T type of array
     * @param __size size to be created
     * @returns array of size __size with all entries as one
     */
    template <typename _T>
    static MdStaticArray<_T> ones(const size_t __size);

    /**
     * @brief Create array with entries one
     * @tparam _T type of array
     * @param __shape size to be created
     * @returns array of size __size with all entries as one
     */
    template <typename _T>
    static MdStaticArray<_T> ones(const std::vector<size_t> &__shape);

    /**
     * @brief Create an identity matrix
     * @tparam _T type of array
     * @param __rows total rows to create
     * @param __cols cols to create (optional, will create square matrix if not
     * mentioned)
     * @param __koffset filling ones will start from offset
     * @returns array of size __size with all entries as zeros
     */
    template <typename _T>
    static MdStaticArray<_T> eye(const size_t __rows, const size_t __cols = -1,
                                 const size_t __koffset = 0);

    /**
     * @brief Return diagonal from a 2d array
     * @tparam _T type of array
     * @param __2darray 2d array from which we read diagonal from
     * @param __koffset diagonal reading from start offset
     * @returns array of size __size with all entries as zeros
     */
    template <typename _T>
    static MdStaticArray<_T> mat_diag(const MdStaticArray<_T> &__2darray,
                                      const size_t __koffset = 0);
    /**
     * @brief Return diagonal from a 2d array
     * @tparam _T type of array
     * @param __2darray 2d array from which we read diagonal from
     * @param __koffset diagonal reading from start offset
     * @returns array of size __size with all entries as zeros
     */
    template <typename _T>
    static MdStaticArray<_T> mat_diag(const MdStaticArrayReference<_T> &__rows,
                                      const size_t __koffset = 0);

    /**
     * @brief Create array with entries as vandermonte
     * @tparam _T type of array
     * @param __1darray 1d array
     * @param __n total number of columns (optional, will create a square
     * matrix)
     * @param increasing_order will arrange each rows with ascending order of
     * exponents when set to true
     * @returns array of size {|__1darray|, __n}
     */
    template <typename _T>
    static MdStaticArray<_T> vandermonte(const MdStaticArray<_T> &__1darray,
                                         const int64_t __n = -1,
                                         const bool increasing_order = false);
    /**
     * @brief Create array with entries as vandermonte
     * @tparam _T type of array
     * @param __1darray 1d array
     * @param __n total number of columns (optional, will create a square
     * matrix)
     * @param increasing_order will arrange each rows with ascending order of
     * exponents when set to true
     * @returns array of size {|__1darray|, __n}
     */
    template <typename _T>
    static MdStaticArray<_T> vandermonte(
        const MdStaticArrayReference<_T> &__rows, const int64_t __n = -1,
        const bool increasing_order = false);

    template <typename _T>
    static MdStaticArray<_T> flip(const MdStaticArray<_T> &__ndarray,
                                  const size_t axis = -1);

    template <typename _T>
    static MdStaticArray<_T> flip(const MdStaticArrayReference<_T> &__ndarray,
                                  const size_t axis = -1);

    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> linspace(const MdStaticArray<_T1> &__first,
                                       const MdStaticArray<_T2> &__other,
                                       const size_t numbers = 50);

    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> linspace(
        const MdStaticArrayReference<_T1> &__first,
        const MdStaticArray<_T2> &__other, const size_t numbers = 50);

    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> linspace(
        const MdStaticArrayReference<_T1> &__first,
        const MdStaticArrayReference<_T2> &__other, const size_t numbers = 50);

    template <typename _T3, typename _T1, typename _T2>
    static MdStaticArray<_T3> linspace(
        const MdStaticArray<_T1> &__first,
        const MdStaticArrayReference<_T2> &__other, const size_t numbers = 50);
};

#endif
