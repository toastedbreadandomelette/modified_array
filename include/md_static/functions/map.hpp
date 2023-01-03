#pragma once
#include "md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::map(
    const MdStaticArray<_T> &__values,
    const std::function<_T(const _T &)> &function_exec) {
    const size_t size = __values.get_size();

    MdStaticArray<_T> result(size);

    const uint8_t thread_count = ::s_thread_count;
    const size_t threshold_size = ::s_threshold_size;

    if (thread_count == 1 || size <= threshold_size) {
        for (size_t index = 0; index < size; ++index) {
            result.__array[index] = function_exec(__values[index]);
        }
    } else {
        std::vector<std::thread> st;
        st.reserve(thread_count);
        auto _add_int = [&result, &__values, &function_exec](const size_t start,
                                                             const size_t end) {
            for (size_t index = start; index < end; ++index) {
                result.__array[index] = function_exec(__values.__array[index]);
            }
        };

        const size_t block = size / thread_count;
        const uint8_t thread_but_one = thread_count - 1;
        for (int i = 0; i < thread_but_one; ++i) {
            st.emplace_back(std::thread(_add_int, block * i, block * (i + 1)));
        }

        st.emplace_back(std::thread(_add_int, block * thread_but_one, size));

        for (auto &th : st) {
            th.join();
        }
    }
    return result;
}
