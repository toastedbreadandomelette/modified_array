#pragma once
#ifndef _RANGE_HPP_
#define _RANGE_HPP_

#include "./md_static_array_utility.hpp"

// To do: improve and update since it does not work for all cases
template <typename _T, class _T1>
MdStaticArray<_T> MdArrayUtility::range(const _T start, const _T end,
                                        const _T spacing) {
    size_t size = 0;
    size_t start_value = 0;
    _T increment = 1;
    if (end < start && spacing > 0) {
        throw std::runtime_error(
            "Spacing given should be negative for ranges: [end (" +
            std::to_string(end) + ") < start (" + std::to_string(start) + ")]");
    }
    if (end == -1 && spacing >= 0) {
        size = start;
        increment = 1;
    } else if (spacing == 1 && end > start) {
        const auto value = end - start;
        size = static_cast<size_t>(
            ::ceil(std::max(value, static_cast<decltype(value)>(0))));
        start_value = start;
        increment = 1;
    } else {
        const double value = ::abs((end - start) / (spacing * 1.0));
        start_value = start;
        size = static_cast<size_t>(
            ::ceil(std::max(value, static_cast<decltype(value)>(0))));
        increment = spacing;
    }

    MdStaticArray<_T> result(size);

    const auto __allocate_internal = [&result](const size_t start,
                                               const _T init, const size_t end,
                                               const _T increment) {
        _T value = init;
        for (size_t index = start; index < end; ++index, value += increment) {
            result.__array[index] = value;
        }
    };

    const size_t block = size / s_thread_count;
    const _T b_increment = increment * block;

    std::vector<std::thread> thread_pool;
    _T b_start = start_value;
    for (size_t thread_i = 0; thread_i < s_thread_count - 1;
         ++thread_i, b_start += b_increment) {
        thread_pool.emplace_back(__allocate_internal, block * thread_i, b_start,
                                 block * (thread_i + 1), increment);
    }

    thread_pool.emplace_back(__allocate_internal, block * (s_thread_count - 1),
                             b_start, size, increment);

    for (auto &thread : thread_pool) {
        thread.join();
    }

    return result;
}

#endif
