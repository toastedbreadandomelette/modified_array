#pragma once
#ifndef _ACCUMULATE_AND_MERGE_HPP_
#define _ACCUMULATE_AND_MERGE_HPP_
#include <vector>

#include "./md_static_array_utility.hpp"

template <typename _T, typename _func, typename _merge_func>
_T MdArrayUtility::accumulate_and_merge_fn(const MdStaticArray<_T> &__values,
                                           const _func &function_exec,
                                           const _merge_func &merge_func,
                                           const _T init) {
    const size_t size = __values.get_size();
    _T result = init;
    const uint8_t thread_count = ::s_thread_count;
    const size_t threshold_size = ::s_threshold_size;
    if (thread_count == 1 || size <= threshold_size) {
        for (size_t index = 0; index < size; ++index) {
            result = function_exec(result, __values.__array[index]);
        }
    } else {
        std::vector<std::thread> st;
        std::vector<_T> __res_total(thread_count);
        auto _add_int = [&__res_total, &__values, &function_exec](
                            const uint8_t thread_number, const size_t start,
                            const size_t end) {
            for (size_t index = start; index < end; ++index) {
                __res_total[thread_number] = function_exec(
                    __res_total[thread_number], __values.__array[index]);
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

        for (auto &result_th : __res_total) {
            result = merge_func(result, result_th);
        }
    }
    return result;
}

template <typename _T, typename _func, typename _merge_func>
_T MdArrayUtility::accumulate_and_merge_fn(
    const MdStaticArrayReference<_T> &__values, const _func &function_exec,
    const _merge_func &merge_func, const _T init) {
    return MdArrayUtility::accumulate_and_merge_fn<_T, _func, _merge_func>(
        MdStaticArray<_T>(*__values.__array_reference, __values.offset,
                          __values.shp_offset),
        function_exec, merge_func, init);
}

#endif
