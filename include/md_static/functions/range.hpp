#pragma once
#ifndef _RANGE_HPP_
#define _RANGE_HPP_

#include "./md_static_array_utility.hpp"

// To do: improve and update since it does not work for all cases
template <typename T, class _T1>
MdStaticArray<T> MdArrayUtility::range(const T start, const T end,
                                       const T spacing) {
    usize size = 0;
    usize start_value = 0;
    T increment = 1;
    if (end < start && spacing > 0) {
        throw std::runtime_error(
            "Spacing given should be negative for ranges: [end (" +
            std::to_string(end) + ") < start (" + std::to_string(start) + ")]");
    }
    if (end == -1 && spacing == 0) {
        size = start;
        increment = 1;
    } else if (spacing == 0 && end > start) {
        const auto value = end - start;
        size = static_cast<usize>(
            ::ceil(std::max(value, static_cast<decltype(value)>(0))));
        start_value = start;
        increment = 1;
    } else {
        const double value = ::abs((end - start) / (spacing * 1.0));
        start_value = start;
        size =
            static_cast<usize>(::ceil(std::max(value, static_cast<double>(0))));
        increment = spacing;
    }

    // std::cout << size << " " << start << " " << end << " " << spacing << " "
    //           << increment << '\n';

    MdStaticArray<T> result(size);

    const auto __allocate_internal = [&result](const usize start, const T init,
                                               const usize end,
                                               const T increment) {
        T value = init;
        for (usize index = start; index < end; ++index, value += increment) {
            result.__array[index] = value;
        }
    };

    if (::s_thread_count == 1 || size < ::s_threshold_size) {
        __allocate_internal(0, start_value, size, increment);
        return result;
    }

    const usize block = size / s_thread_count;
    const T b_increment = increment * block;

    std::vector<std::thread> thread_pool;
    T b_start = start_value;
    for (usize thread_i = 0; thread_i < s_thread_count - 1;
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
