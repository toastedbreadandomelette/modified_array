#pragma once
#ifndef _REDUCE_HPP_
#define _REDUCE_HPP_
#include "./md_static_array_utility.hpp"

template <typename _T, typename _func>
_T MdArrayUtility::reduce(const MdStaticArray<_T> &__values,
                          const _func &function_exec, const _T init) {
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
        std::vector<_T> __res_total(thread_count, 0);
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
            result = function_exec(result, result_th);
        }
    }
    return result;
}

#endif
