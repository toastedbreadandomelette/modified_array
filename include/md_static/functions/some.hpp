#pragma once
#ifndef _SOME_HPP_
#define _SOME_HPP_

#include "./md_static_array_utility.hpp"

template <typename _T>
bool MdArrayUtility::some(const MdStaticArray<_T> &__ndarray,
                          const std::function<bool(const _T &)> &__function,
                          const size_t threads) {
    if (__ndarray.get_size() < s_threshold_size) {
        size_t index = 0;
        for (; index < __ndarray.get_size() &&
               !__function(__ndarray.__array[index]);
             ++index) {
        }
        return index < __ndarray.get_size();
    } else {
        std::vector<std::thread> thread_pool;
        std::vector<bool> thread_results(threads);

        auto __perform_every_parallel =
            [&__ndarray, &__function, &thread_results](
                const size_t thread_number, const size_t start,
                const size_t end) {
                size_t index = start;
                for (; index < end && !__function(__ndarray.__array[index]);
                     ++index) {
                }
                thread_results[thread_number] = (index < end);
            };
        const size_t block = __ndarray.get_size() / threads;

        for (size_t index = 0; index < threads - 1; ++index) {
            thread_pool.emplace_back(std::thread(__perform_every_parallel,
                                                 index, block * index,
                                                 block * (index + 1)));
        }

        thread_pool.emplace_back(std::thread(__perform_every_parallel,
                                             threads - 1, block * (threads - 1),
                                             __ndarray.get_size()));

        for (auto &thread : thread_pool) {
            thread.join();
        }

        for (size_t index = 0; index < thread_results.size(); ++index) {
            if (thread_results[index]) {
                return true;
            }
        }

        return false;
    }
}

template <typename _T>
bool MdArrayUtility::some(
    const typename MdStaticArray<_T>::reference &__ndarray_reference,
    const std::function<bool(const _T &)> &__function, const size_t threads) {
    return some<_T>(MdStaticArray<_T>(*__ndarray_reference.__array_reference,
                                      __ndarray_reference.offset,
                                      __ndarray_reference.shp_offset),
                    __function, threads);
}
#endif
