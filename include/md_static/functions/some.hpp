#pragma once
#ifndef _SOME_HPP_
#define _SOME_HPP_

#include "./md_static_array_utility.hpp"

template <typename T>
bool MdArrayUtility::some(const MdStaticArray<T> &ndarray,
                          const fn<bool(const T &)> &function,
                          const usize threads) {
    if (ndarray.get_size() < s_threshold_size) {
        usize index = 0;
        for (; index < ndarray.get_size() && !function(ndarray.__array[index]);
             ++index) {
        }
        return index < ndarray.get_size();
    } else {
        std::vector<std::thread> thread_pool;
        std::vector<bool> thread_results(threads);

        auto __perform_every_parallel = [&ndarray, &function, &thread_results](
                                            const usize thread_number,
                                            const usize start,
                                            const usize end) {
            usize index = start;
            for (; index < end && !function(ndarray.__array[index]); ++index) {
            }
            thread_results[thread_number] = (index < end);
        };
        const usize block = ndarray.get_size() / threads;

        for (usize index = 0; index < threads - 1; ++index) {
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

        for (usize index = 0; index < thread_results.size(); ++index) {
            if (thread_results[index]) {
                return true;
            }
        }

        return false;
    }
}

template <typename T>
bool MdArrayUtility::some(const MdStaticArrayReference<T> &ndarray,
                          const fn<bool(const T &)> &function,
                          const usize threads) {
    return some<T>(MdStaticArray<T>(*ndarray.__array_reference, ndarray.offset,
                                    ndarray.shp_offset),
                   function, threads);
}
#endif
