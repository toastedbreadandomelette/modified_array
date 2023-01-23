#pragma once

#ifndef _MD_ARRAY_MANIPULATION_HPP_
#define _MD_ARRAY_MANIPULATION_HPP_

#include "../md_static_array.hpp"

struct MdArrayManipulate {
    /**
     * @brief Create array with entries zeros
     * @tparam _T type of array
     * @param __size size to be created
     * @returns array of size __size with all entries as zeros
     */
    template <typename _T>
    static MdStaticArray<_T> zeros(const size_t __size);

    /**
     * @brief Create array with entries zeros
     * @tparam _T type of array
     * @param __size size to be created
     * @returns array of size __size with all entries as zeros
     */
    template <typename _T>
    static MdStaticArray<_T> zeros(const std::vector<size_t> &__shape);

    /**
     * @brief Create array with entries zeros
     * @tparam _T type of array
     * @param __size size to be created
     * @returns array of size __size with all entries as zeros
     */
    template <typename _T>
    static MdStaticArray<_T> ones(const size_t __size);

    /**
     * @brief Create array with entries zeros
     * @tparam _T type of array
     * @param __size size to be created
     * @returns array of size __size with all entries as zeros
     */
    template <typename _T>
    static MdStaticArray<_T> ones(const std::vector<size_t> &__shape);

    /**
     * @brief Create array with entries zeros
     * @tparam _T type of array
     * @param __size size to be created
     * @returns array of size __size with all entries as zeros
     */
    template <typename _T>
    static MdStaticArray<_T> eye(const size_t __rows, const size_t __cols = -1,
                                 const size_t __koffset = 0);

    /**
     * @brief Create array with entries zeros
     * @tparam _T type of array
     * @param __size size to be created
     * @returns array of size __size with all entries as zeros
     */
    template <typename _T>
    static MdStaticArray<_T> mat_diag(const MdStaticArray<_T> &__rows,
                                      const size_t __koffset = 0);
    /**
     * @brief Create array with entries zeros
     * @tparam _T type of array
     * @param __size size to be created
     * @returns array of size __size with all entries as zeros
     */
    template <typename _T>
    static MdStaticArray<_T> mat_diag(const MdStaticArrayReference<_T> &__rows,
                                      const size_t __koffset = 0);

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
