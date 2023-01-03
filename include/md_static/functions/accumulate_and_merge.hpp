#pragma once
#include "md_static_array_utility.hpp"

template <typename _T, typename _func, typename _merge_func>
_T MdArrayUtility::accumulate_and_merge_fn(MdStaticArray<_T> &__values,
                                           const _func &function_exec,
                                           const _merge_func &merge_func,
                                           const _T init, const _T merge_init) {
    const size_t size = __values.get_size();
    _T result = merge_init;
    const uint8_t thread_count = ::s_thread_count;
    const size_t threshold_size = ::s_threshold_size;
    if (thread_count == 1 || size <= threshold_size) {
        for (size_t index = 0; index < size; ++index) {
            result = function_exec(result, __values[index]);
        }
    } else {
        std::vector<std::thread> st;
        st.reserve(thread_count);
        std::vector<_T> __res_total(thread_count, init);
        auto _add_int = [&__res_total, &__values, &function_exec](
                            const uint8_t thread_number, const size_t start,
                            const size_t end) {
            for (size_t index = start; index < end; ++index) {
                __res_total[thread_number] =
                    function_exec(__res_total[thread_number], __values[index]);
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