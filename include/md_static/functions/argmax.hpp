#pragma once
#ifndef _ARGMAX_HPP_
#define _ARGMAX_HPP_

#include "./md_static_array_utility.hpp"

template <typename T>
MdStaticArray<usize> MdArrayUtility::argmax(const MdStaticArray<T> &values,
                                            const i32 axis) {
    if (axis == -1) {
        const usize size = values.get_size();
        MdStaticArray<usize> result(1, 0);
        const u8 thread_count = ::s_thread_count;
        const usize threshold_size = ::s_threshold_size;
        if (thread_count == 1 || size <= threshold_size) {
            for (usize index = 0; index < size; ++index) {
                result.__array[0] =
                    values.__array[result.__array[0]] > values.__array[index]
                        ? result.__array[0]
                        : index;
            }
        } else {
            std::vector<std::thread> st;
            std::vector<usize> accumulator(thread_count, 0);
            auto _add_int = [&accumulator, &values](const u8 thread_number,
                                                    const usize start,
                                                    const usize end) {
                for (usize index = start; index < end; ++index) {
                    accumulator[thread_number] =
                        values.__array[accumulator[thread_number]] >
                                values.__array[index]
                            ? accumulator[thread_number]
                            : index;
                }
            };

            const usize block = size / thread_count;
            const u8 thread_but_one = thread_count - 1;
            for (i32 i = 0; i < thread_but_one; ++i) {
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
        std::vector<usize> shp;
        for (usize index = 0; index < values.get_shape_size(); ++index) {
            if (axis != index) {
                shp.emplace_back(values.shape[index]);
            }
        }

        MdStaticArray<usize> result(shp, 0);

        const usize skip_index = values.skip_vec[axis];

        const usize loop_index =
            axis - 1 >= 0 ? values.skip_vec[axis - 1] : values.get_size();

        const usize total_threads = ::s_thread_count;

        auto __perform_argmin_parallel = [&values, &result, skip_index,
                                          loop_index, total_threads,
                                          axis](const usize thread_number) {
            usize value_index = thread_number * loop_index;
            for (usize index = thread_number * skip_index;
                 index < result.get_size();
                 index += (total_threads * skip_index),
                       value_index += (total_threads * loop_index)) {
                for (usize loop_time = 0, axis_index = 0;
                     loop_time < loop_index;
                     loop_time += skip_index, ++axis_index) {
                    for (usize block_index = 0; block_index < skip_index;
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

        const usize total_dispatchable_threads =
            std::min({result.get_size(), total_threads});
        for (usize index = 0; index < total_dispatchable_threads; ++index) {
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
MdStaticArray<usize> MdArrayUtility::argmax(
    const MdStaticArrayReference<T> &values, const i32 axis) {
    return argmax<T>(MdStaticArray<T>(*values.__array_reference, values.offset,
                                      values.shp_offset),
                     axis);
}

#endif
