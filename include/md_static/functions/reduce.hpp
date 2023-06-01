#pragma once
#ifndef _REDUCE_HPP_
#define _REDUCE_HPP_
#include <vector>

#include "./md_static_array_utility.hpp"

template <typename T, typename _func>
MdStaticArray<T> MdArrayUtility::reduce(const MdStaticArray<T> &values,
                                        const _func &function_exec,
                                        const T init, const int axis) {
    if (axis == -1) {
        const size_t size = values.get_size();
        MdStaticArray<T> result(1, init);
        const uint8_t thread_count = ::s_thread_count;
        const size_t threshold_size = ::s_threshold_size;
        if (thread_count == 1 || size <= threshold_size) {
            for (size_t index = 0; index < size; ++index) {
                result.__array[0] =
                    function_exec(result.__array[0], values.__array[index]);
            }
        } else {
            std::vector<std::thread> st;
            std::vector<T> __res_total(thread_count, init);
            auto _add_int = [&__res_total, &values, &function_exec](
                                const uint8_t thread_number, const size_t start,
                                const size_t end) {
                for (size_t index = start; index < end; ++index) {
                    __res_total[thread_number] = function_exec(
                        __res_total[thread_number], values.__array[index]);
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
                result.__array[0] = function_exec(result.__array[0], result_th);
            }
        }
        return result;
    } else {
        if (axis < 0 || axis >= values.get_shape_size()) {
            throw std::runtime_error(
                "Unknown axis requested for function map.");
        }
        std::vector<size_t> shp;
        for (size_t index = 0; index < values.get_shape_size(); ++index) {
            if (axis != index) {
                shp.emplace_back(values.shape[index]);
            }
        }

        MdStaticArray<T> result(shp, init);

        const size_t skip_index = values.skip_vec[axis];

        const size_t loop_index =
            axis - 1 >= 0 ? values.skip_vec[axis - 1] : values.get_size();

        const size_t total_threads = ::s_thread_count;

        auto __perform_reduce_parallel =
            [&values, &function_exec, &result, skip_index, loop_index,
             total_threads](const size_t thread_number) {
                size_t value_index = thread_number * loop_index;
                for (size_t index = thread_number * skip_index;
                     index < result.get_size();
                     index += (total_threads * skip_index),
                            value_index += (total_threads * loop_index)) {
                    for (size_t loop_time = 0; loop_time < loop_index;
                         loop_time += skip_index) {
                        for (size_t block_index = 0; block_index < skip_index;
                             ++block_index) {
                            result.__array[index + block_index] = function_exec(
                                result.__array[index + block_index],
                                values.__array[value_index + loop_time +
                                               block_index]);
                        }
                    }
                }
            };

        std::vector<std::thread> thread_pool;

        const size_t total_dispatchable_threads =
            std::min({result.get_size(), total_threads});
        for (size_t index = 0; index < total_dispatchable_threads; ++index) {
            thread_pool.emplace_back(
                std::thread(__perform_reduce_parallel, index));
        }

        for (auto &thread : thread_pool) {
            thread.join();
        }

        return result;
    }
}

template <typename T, typename _func>
MdStaticArray<T> MdArrayUtility::reduce(const MdStaticArrayReference<T> &values,
                                        const _func &function_exec,
                                        const T init, const int axis) {
    return reduce<T, _func>(MdStaticArray<T>(*values.__array_reference,
                                             values.offset, values.shp_offset),
                            function_exec, init, axis);
}

#endif
