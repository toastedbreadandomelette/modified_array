#pragma once
#ifndef _EVERY_HPP_
#define _EVERY_HPP_

#include "./md_static_array_utility.hpp"

template <typename T>
bool MdArrayUtility::every(const MdStaticArray<T> &ndarray,
                           const std::function<bool(const T &)> &function,
                           const size_t threads) {
    if (ndarray.get_size() < s_threshold_size) {
        size_t index = 0;
        for (; index < ndarray.get_size() && function(ndarray.__array[index]);
             ++index) {
        }
        return index == ndarray.get_size();
    } else {
        std::vector<std::thread> thread_pool;
        std::vector<bool> thread_results(threads);

        auto __perform_every_parallel = [&ndarray, &function, &thread_results](
                                            const size_t thread_number,
                                            const size_t start,
                                            const size_t end) {
            size_t index = start;
            for (; index < end && function(ndarray.__array[index]); ++index) {
            }
            thread_results[thread_number] = (index == end);
        };
        const size_t block = ndarray.get_size() / threads;

        for (size_t index = 0; index < threads - 1; ++index) {
            thread_pool.emplace_back(std::thread(__perform_every_parallel,
                                                 index, block * index,
                                                 block * (index + 1)));
        }

        thread_pool.emplace_back(std::thread(__perform_every_parallel,
                                             threads - 1, block * (threads - 1),
                                             ndarray.get_size()));

        for (auto &thread : thread_pool) {
            thread.join();
        }

        for (size_t index = 0; index < thread_results.size(); ++index) {
            if (!thread_results[index]) {
                return false;
            }
        }

        return true;
    }
}

template <typename T>
bool MdArrayUtility::every(const MdStaticArrayReference<T> &__ndarray_reference,
                           const std::function<bool(const T &)> &function,
                           const size_t threads) {
    return every<T>(MdStaticArray<T>(*__ndarray_reference.__array_reference,
                                     __ndarray_reference.offset,
                                     __ndarray_reference.shp_offset),
                    function, threads);
}
#endif
