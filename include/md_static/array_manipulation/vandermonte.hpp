#pragma once
#ifndef _VANDERMONTE_HPP_
#define _VANDERMONTE_HPP_

#include "./md_array_manipulation.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayManipulate::vandermonte(
    const MdStaticArray<_T> &__rows, const int64_t __n,
    const bool increasing_order) {
    if (__rows.get_shape_size() != 1) {
        throw std::runtime_error("Given array must be 1-dimensional; found: " +
                                 std::to_string(__rows.get_shape_size()));
    }

    const size_t loop = (__n != -1 ? __n : __rows.get_size());

    MdStaticArray<_T> result({__rows.get_size(), loop}, 1);

    if (::s_thread_count == 1 || ::s_threshold_size > result.get_size()) {
        if (!increasing_order) {
            for (size_t row = 0; row < __rows.get_size(); ++row) {
                const auto c = __rows.__array[row];
                for (int index = loop - 2; index >= 0; --index) {
                    result.__array[row * loop + index] =
                        result.__array[row * loop + index + 1] * c;
                }
            }
        } else {
            for (size_t row = 0; row < __rows.get_size(); ++row) {
                const auto c = __rows.__array[row];
                for (size_t index = 1; index < loop; ++index) {
                    result.__array[row * loop + index] =
                        result.__array[row * loop + index - 1] * c;
                }
            }
        }
    } else {
        auto __perform_vandermonte_parallel =
            [&__rows, loop, &result, increasing_order](const size_t start,
                                                       const size_t end) {
                if (!increasing_order) {
                    for (size_t row = start; row < end; ++row) {
                        const auto c = __rows.__array[row];
                        for (int index = loop - 2; index >= 0; --index) {
                            result.__array[row * loop + index] =
                                result.__array[row * loop + index + 1] * c;
                        }
                    }
                } else {
                    for (size_t row = start; row < end; ++row) {
                        const auto c = __rows.__array[row];
                        for (size_t index = 1; index < loop; ++index) {
                            result.__array[row * loop + index] =
                                result.__array[row * loop + index - 1] * c;
                        }
                    }
                }
            };

        const size_t block_size = __rows.get_size() / ::s_thread_count;

        std::vector<std::thread> thread_pool;
        for (size_t index = 0; index < ::s_thread_count - 1; ++index) {
            thread_pool.emplace_back(std::thread(__perform_vandermonte_parallel,
                                                 index * block_size,
                                                 (index + 1) * block_size));
        }
        thread_pool.emplace_back(std::thread(
            __perform_vandermonte_parallel, (::s_thread_count - 1) * block_size,
            __rows.get_size()));

        for (auto &thread : thread_pool) {
            thread.join();
        }
    }
    return result;
}

template <typename _T>
MdStaticArray<_T> MdArrayManipulate::vandermonte(
    const MdStaticArrayReference<_T> &__rows, const int64_t __n,
    const bool increasing_order) {
    return vandermonte<_T>(MdStaticArray<_T>(*__rows.__array_reference,
                                             __rows.offset, __rows.shp_offset),
                           __n, increasing_order);
}
#endif
