#pragma once
#ifndef _OUTER_HPP_
#define _OUTER_HPP_

#include "./md_linear_algebra.hpp"

template <typename T3, typename T1, typename T2>
Array<T3> Linalg::outer(const Array<T1> &__first,
                                         const Array<T2> &__other,
                                         const usize threads) {
    Array<T3> result({__first.get_size(), __other.get_size()}, 0);

    auto __perform_outer_internal = [&result, &__first, &__other](
                                        const usize start, const usize end) {
        const usize fsize = __first.get_size(), osize = __other.get_size();
        for (usize i = 0; i < fsize; ++i) {
            for (usize j = start; j < end; ++j) {
                result.__array[i * osize + j] =
                    __first.__array[i] * __other.__array[j];
            }
        }
    };

    std::vector<std::thread> thread_pool;

    usize block_size = __other.get_size() / threads;

    for (usize index = 0; index < threads - 1; ++index) {
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

template <typename T3, typename T1, typename T2>
Array<T3> Linalg::outer(
    const Reference<T1> &__first, const Array<T2> &__other,
    const usize threads) {
    return Linalg::outer<T3, T1, T2>(
        Array<T1>(*__first.__array_reference, __first.offset,
                          __first.shp_offset),
        __other, threads);
}

template <typename T3, typename T1, typename T2>
Array<T3> Linalg::outer(
    const Array<T1> &__first, const Reference<T2> &__other,
    const usize threads) {
    return Linalg::outer<T3, T1, T2>(
        __first,
        Array<T1>(*__other.__array_reference, __other.offset,
                          __other.shp_offset),
        threads);
}

template <typename T3, typename T1, typename T2>
Array<T3> Linalg::outer(
    const Reference<T1> &__first,
    const Reference<T2> &__other, const usize threads) {
    return Linalg::outer<T3, T1, T2>(
        Array<T1>(*__first.__array_reference, __first.offset,
                          __first.shp_offset),
        Array<T1>(*__other.__array_reference, __other.offset,
                          __other.shp_offset),
        threads);
}

#endif
