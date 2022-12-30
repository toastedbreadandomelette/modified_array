#pragma once
#ifndef _MD_STATIC_UTILITY_HPP_
#define _MD_STATIC_UTILITY_HPP_

#include <cassert>

#include "md_static_array.hpp"

struct MdUtility {
    template <typename _T>
    friend class MdStaticArray;

    template <typename _T1, typename _T2, typename _T3>
    static MdStaticArray<_T3> dot(const MdStaticArray<_T1>& __first,
                                  const MdStaticArray<_T2>& __other) {
        // Basically, compute dot product of vector:::
        // Last axis of vector __first should be multiplied with second last
        // axis of __other
        if (__other.get_shape_size() >= 2 && __first.get_shape_size() >= 2) {
            const size_t overall_size =
                __first.get_shape_size() - 2 + __other.get_shape_size();
            if (__first.shape[__first.shp_size - 1] !=
                __other.shape[__other.shp_size - 2]) {
                throw std::runtime_error(
                    "Axis count do not match for dot multiplication.");
            }
            std::vector<size_t> overall_shape(overall_size);
            size_t index = 0;
            for (int i = 0; i < __first.get_shape_size() - 1; ++i) {
                overall_shape[index++] = __first.shape[i];
            }
            for (int i = 0; i < __other.get_shape_size(); ++i) {
                if (i != __first.get_shape_size() - 2) {
                    overall_shape[index++] = __other.shape[i];
                }
            }
            const size_t cam = __first.shape[__first.shp_size - 1];
            // const size_t mat_base_size =

            MdStaticArray<_T3> result(overall_shape, 0);
            const size_t res_base_matrix_size =
                (result.shape[result.shp_size - 1] *
                 result.shape[result.shp_size - 2]);

            const size_t res_loop_times =
                result.get_size() / res_base_matrix_size;
            size_t res_index = 0, first_index = 0, other_index = 0;
            const size_t m = __first.shape[__first.shp_size - 2];
            const size_t n = cam;
            const size_t p = __other.shape[__other.shp_size - 1];

            assert(m == __first.shape[__first.shp_size - 2] &&
                   n == __first.shape[__first.shp_size - 1]);

            assert(n == __other.shape[__other.shp_size - 2] &&
                   p == __other.shape[__other.shp_size - 1]);

            const size_t first_base_matrix_size = m * n;
            const size_t other_base_matrix_size = n * p;

            index = 0;
            uint16_t threads = 16;
            size_t skip_count = __other.get_size() / n;
            auto __perform_dot_parallel = [&result, &__first, &__other, m, n, p,
                                           threads, other_base_matrix_size,
                                           skip_count](
                                              const size_t thread_number) {
                size_t index = thread_number * skip_count;
                for (size_t first_row = thread_number * n;
                     first_row < __first.get_size();
                     first_row += (threads * n)) {
                    for (size_t other_block = 0;
                         other_block < __other.get_size();
                         other_block += other_base_matrix_size) {
                        for (size_t other_col = 0; other_col < p; ++other_col) {
                            for (size_t j = 0; j < n; ++j) {
                                result.__array[index] +=
                                    __first.__array[first_row + j] *
                                    __other.__array[other_block + j * p +
                                                    other_col];
                            }
                            ++index;
                        }
                    }
                    index += ((threads - 1) * skip_count);
                }
            };
            std::vector<std::thread> thread_pool;
            for (int i = 0; i < threads; ++i) {
                thread_pool.emplace_back(
                    std::thread(__perform_dot_parallel, i));
            }

            for (auto& thread : thread_pool) {
                thread.join();
            }

            return result;
        }
    }
};

#endif
