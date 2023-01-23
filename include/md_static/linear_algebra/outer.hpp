#pragma once
#ifndef _OUTER_HPP_
#define _OUTER_HPP_

#include "./md_linear_algebra.hpp"

template <typename _T3, typename _T1, typename _T2>
MdStaticArray<_T3> MdLinearAlgebra::outer(const MdStaticArray<_T1> &__first,
                                          const MdStaticArray<_T2> &__other,
                                          const size_t threads) {
    MdStaticArray<_T3> result({__first.get_size(), __other.get_size()}, 0);

    auto __perform_outer_internal = [&result, &__first, &__other](
                                        const size_t start, const size_t end) {
        const size_t fsize = __first.get_size(), osize = __other.get_size();
        for (size_t i = 0; i < fsize; ++i) {
            for (size_t j = start; j < end; ++j) {
                result.__array[i * osize + j] =
                    __first.__array[i] * __other.__array[j];
            }
        }
    };

    std::vector<std::thread> thread_pool;

    size_t block_size = __other.get_size() / threads;

    for (size_t index = 0; index < threads - 1; ++index) {
        thread_pool.emplace_back(std::thread(__perform_outer_internal,
                                             block_size * index,
                                             block_size * (index + 1)));
    }

    thread_pool.emplace_back(std::thread(__perform_outer_internal,
                                         block_size * (threads - 1),
                                         __first.get_size()));

    for (auto &thread : thread_pool) {
        thread.join();
    }

    return result;
}

template <typename _T3, typename _T1, typename _T2>
MdStaticArray<_T3> MdLinearAlgebra::outer(
    const MdStaticArrayReference<_T1> &__first,
    const MdStaticArray<_T2> &__other, const size_t threads) {
    return MdLinearAlgebra::outer<_T3, _T1, _T2>(
        MdStaticArray<_T1>(*__first.__array_reference, __first.offset,
                           __first.shp_offset),
        __other, threads);
}

template <typename _T3, typename _T1, typename _T2>
MdStaticArray<_T3> MdLinearAlgebra::outer(
    const MdStaticArray<_T1> &__first,
    const MdStaticArrayReference<_T2> &__other, const size_t threads) {
    return MdLinearAlgebra::outer<_T3, _T1, _T2>(
        __first,
        MdStaticArray<_T1>(*__other.__array_reference, __other.offset,
                           __other.shp_offset),
        threads);
}

template <typename _T3, typename _T1, typename _T2>
MdStaticArray<_T3> MdLinearAlgebra::outer(
    const MdStaticArrayReference<_T1> &__first,
    const MdStaticArrayReference<_T2> &__other, const size_t threads) {
    return MdLinearAlgebra::outer<_T3, _T1, _T2>(
        MdStaticArray<_T1>(*__first.__array_reference, __first.offset,
                           __first.shp_offset),
        MdStaticArray<_T1>(*__other.__array_reference, __other.offset,
                           __other.shp_offset),
        threads);
}

#endif
