#pragma once
#ifndef _ACCUMULATE_AND_MERGE_HPP_
#define _ACCUMULATE_AND_MERGE_HPP_
#include <vector>

#include "./md_static_array_utility.hpp"

template <typename T, typename function, typename merge_function>
T MdArrayUtility::accumulate_and_merge_fn(const MdStaticArray<T> &values,
                                          const function &function_exec,
                                          const merge_function &merge_func,
                                          const T init) {
    const size_t size = values.get_size();
    T result = init;
    const uint8_t thread_count = ::s_thread_count;
    const size_t threshold_size = ::s_threshold_size;
    if (thread_count == 1 || size <= threshold_size) {
        for (size_t index = 0; index < size; ++index) {
            result = function_exec(result, values.__array[index]);
        }
    } else {
        std::vector<std::thread> st;
        std::vector<T> accumulator(thread_count);
        auto _add_int = [&accumulator, &values, &function_exec](
                            const uint8_t thread_number, const size_t start,
                            const size_t end) {
            for (size_t index = start; index < end; ++index) {
                accumulator[thread_number] = function_exec(
                    accumulator[thread_number], values.__array[index]);
            }
        };

        const size_t block = size / thread_count;
        const uint8_t thread_but_one = thread_count - 1;
        for (int i = 0; i < thread_but_one; ++i) {
            st.emplace_back(
                std::thread(_add_int, i, block * i, block * (i + 1)));
        }

        st.emplace_back(std::thread(_add_int, thread_but_one,
                                    block * thread_but_one, size));

        for (auto &th : st) {
            th.join();
        }

        for (auto &result_th : accumulator) {
            result = merge_func(result, result_th);
        }
    }
    return result;
}

template <typename T, typename function, typename merge_function>
T MdArrayUtility::accumulate_and_merge_fn(
    const MdStaticArrayReference<T> &values, const function &function_exec,
    const merge_function &merge_func, const T init) {
    return MdArrayUtility::accumulate_and_merge_fn<T, function, merge_function>(
        MdStaticArray<T>(*values.__array_reference, values.offset,
                         values.shp_offset),
        function_exec, merge_func, init);
}

#endif
