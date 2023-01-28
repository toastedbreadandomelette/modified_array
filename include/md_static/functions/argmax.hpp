#pragma once
#ifndef _ARGMAX_HPP_
#define _ARGMAX_HPP_

#include "./md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<size_t> MdArrayUtility::argmax(const MdStaticArray<_T> &__values,
                                             const int axis) {
    if (axis == -1) {
        const size_t size = __values.get_size();
        MdStaticArray<size_t> result(1, 0);
        const uint8_t thread_count = ::s_thread_count;
        const size_t threshold_size = ::s_threshold_size;
        if (thread_count == 1 || size <= threshold_size) {
            for (size_t index = 0; index < size; ++index) {
                result.__array[0] = __values.__array[result.__array[0]] >
                                            __values.__array[index]
                                        ? result.__array[0]
                                        : index;
                ;
            }
        } else {
            std::vector<std::thread> st;
            std::vector<size_t> __res_total(thread_count, 0);
            auto _add_int = [&__res_total, &__values](
                                const uint8_t thread_number, const size_t start,
                                const size_t end) {
                for (size_t index = start; index < end; ++index) {
                    __res_total[thread_number] =
                        __values.__array[__res_total[thread_number]] >
                                __values.__array[index]
                            ? __res_total[thread_number]
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

            for (auto &result_th : __res_total) {
                result.__array[0] = __values.__array[result_th] >
                                            __values.__array[result.__array[0]]
                                        ? result_th
                                        : result.__array[0];
            }
        }
        return result;
    } else {
        if (axis < 0 || axis >= __values.get_shape_size()) {
            throw std::runtime_error(
                "Unknown axis requested for function map.");
        }
        std::vector<size_t> shp;
        for (size_t index = 0; index < __values.get_shape_size(); ++index) {
            if (axis != index) {
                shp.emplace_back(__values.shape[index]);
            }
        }

        MdStaticArray<size_t> result(shp, 0);

        const size_t skip_index = __values.skip_vec[axis];

        const size_t loop_index =
            axis - 1 >= 0 ? __values.skip_vec[axis - 1] : __values.get_size();

        const size_t total_threads = ::s_thread_count;

        auto __perform_reduce_parallel = [&__values, &result, skip_index,
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
                            __values.__array[value_index +
                                             (result.__array[index +
                                                             block_index] *
                                              skip_index) +
                                             block_index] >
                                    __values.__array[value_index + loop_time +
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
            std::cout << index * loop_index << '\n';
            thread_pool.emplace_back(
                std::thread(__perform_reduce_parallel, index));
        }

        for (auto &thread : thread_pool) {
            thread.join();
        }

        return result;
    }
}

#endif
