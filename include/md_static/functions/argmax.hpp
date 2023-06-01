#pragma once
#ifndef _ARGMAX_HPP_
#define _ARGMAX_HPP_

#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<size_t> MdArrayUtility::argmax(const MdStaticArray<T> &values,
                                             const int axis) {
    if (axis == -1) {
        const size_t size = values.get_size();
        MdStaticArray<size_t> result(1, 0);
        const uint8_t thread_count = ::s_thread_count;
        const size_t threshold_size = ::s_threshold_size;
        if (thread_count == 1 || size <= threshold_size) {
            for (size_t index = 0; index < size; ++index) {
                result.__array[0] =
                    values.__array[result.__array[0]] > values.__array[index]
                        ? result.__array[0]
                        : index;
            }
        } else {
            std::vector<std::thread> st;
            std::vector<size_t> accumulator(thread_count, 0);
            auto _add_int = [&accumulator, &values](const uint8_t thread_number,
                                                    const size_t start,
                                                    const size_t end) {
                for (size_t index = start; index < end; ++index) {
                    accumulator[thread_number] =
                        values.__array[accumulator[thread_number]] >
                                values.__array[index]
                            ? accumulator[thread_number]
                            : index;
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
                result.__array[0] = values.__array[result_th] >
                                            values.__array[result.__array[0]]
                                        ? result_th
                                        : result.__array[0];
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

        MdStaticArray<size_t> result(shp, 0);

        const size_t skip_index = values.skip_vec[axis];

        const size_t loop_index =
            axis - 1 >= 0 ? values.skip_vec[axis - 1] : values.get_size();

        const size_t total_threads = ::s_thread_count;

        auto __perform_argmin_parallel = [&values, &result, skip_index,
                                          loop_index, total_threads,
                                          axis](const size_t thread_number) {
            size_t value_index = thread_number * loop_index;
            for (size_t index = thread_number * skip_index;
                 index < result.get_size();
                 index += (total_threads * skip_index),
                        value_index += (total_threads * loop_index)) {
                for (size_t loop_time = 0, axis_index = 0;
                     loop_time < loop_index;
                     loop_time += skip_index, ++axis_index) {
                    for (size_t block_index = 0; block_index < skip_index;
                         ++block_index) {
                        result.__array[index + block_index] =
                            values.__array[value_index +
                                           (result
                                                .__array[index + block_index] *
                                            skip_index) +
                                           block_index] >
                                    values.__array[value_index + loop_time +
                                                   block_index]
                                ? result.__array[index + block_index]
                                : axis_index;
                    }
                }
            }
        };

        std::vector<std::thread> thread_pool;

        const size_t total_dispatchable_threads =
            std::min({result.get_size(), total_threads});
        for (size_t index = 0; index < total_dispatchable_threads; ++index) {
            thread_pool.emplace_back(
                std::thread(__perform_argmin_parallel, index));
        }

        for (auto &thread : thread_pool) {
            thread.join();
        }

        return result;
    }
}

template <typename T>
MdStaticArray<size_t> MdArrayUtility::argmax(
    const MdStaticArrayReference<T> &values, const int axis) {
    return argmax<T>(MdStaticArray<T>(*values.__array_reference, values.offset,
                                      values.shp_offset),
                     axis);
}

#endif
