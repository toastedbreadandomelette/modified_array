#pragma once
#ifndef _MAP_HPP_
#define _MAP_HPP_
#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<T> MdArrayUtility::map(
    const MdStaticArray<T> &values,
    const std::function<T(const T &)> &function_exec) {
    const size_t size = values.get_size();

    std::vector<size_t> shp;
    for (size_t index = 0; index < values.get_shape_size(); ++index) {
        shp.emplace_back(values.shape[index]);
    }

    MdStaticArray<T> result(shp, 0);

    const uint8_t thread_count = ::s_thread_count;
    const size_t threshold_size = ::s_threshold_size;

    if (thread_count == 1 || size <= threshold_size) {
#pragma omp parallel for
        for (size_t index = 0; index < size; ++index) {
            result.__array[index] = function_exec(values.__array[index]);
        }
    } else {
        std::vector<std::thread> st;
        st.reserve(thread_count);
        auto _add_int = [&result, &values, &function_exec](const size_t start,
                                                           const size_t end) {
            for (size_t index = start; index < end; ++index) {
                result.__array[index] = function_exec(values.__array[index]);
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

template <typename T>
MdStaticArray<T> MdArrayUtility::map(
    const MdStaticArrayReference<T> &values,
    const std::function<T(const T &)> &function_exec) {
    return map<T>(MdStaticArray(*values.__array_reference, values.offset,
                                values.shp_offset),
                  function_exec);
}

#endif
