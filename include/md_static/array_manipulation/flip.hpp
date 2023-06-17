#pragma once
#ifndef _FLIP_HPP_
#define _FLIP_HPP_

#include "./md_array_manipulation.hpp"

template <typename T>
Array<T> Manip::flip(const Array<T> &ndarray,
                             const i32 axis) {
    if (axis == -1) {
        Array<T> result(ndarray);

        for (usize index = 0; index < result.get_size() / 2; ++index) {
            const auto temp = result.array_[index];
            result.array_[index] = result.array_[result.get_size() - 1 - index];
            result.array_[result.get_size() - 1 - index] = temp;
        }

        return result;
    }
    if (axis >= ndarray.get_shape_size()) {
        throw std::runtime_error("Unknown axis " + std::to_string(axis) +
                                 " requested for operation flip");
    }

    Array<T> result(ndarray);

    const usize total_axes = result.get_axis_reference(axis).get_total_axes();

    if (s_thread_count == 1 || s_threshold_size > ndarray.get_size()) {
        for (usize index = 0; index < total_axes; ++index) {
            const auto axis_ref = result.get_nth_axis_reference(axis, index);
            for (usize i = 0; i < axis_ref.get_size() - i; ++i) {
                std::swap(axis_ref[i], axis_ref[axis_ref.get_size() - 1 - i]);
            }
        }
    } else {
        // Use multi-threading
        auto __perform_flip_internal = [&result, axis](const usize start,
                                                       const usize end) {
            auto axis_ref = result.get_nth_axis_reference(axis, start);
            for (usize index = start; index < end; ++index) {
                for (usize i = 0; i < axis_ref.get_size() - i; ++i) {
                    std::swap(axis_ref[i],
                              axis_ref[axis_ref.get_size() - 1 - i]);
                }
                axis_ref.switch_to_next_axis_index();
            }
        };

        const usize total_axes_for_single_thread = total_axes / s_thread_count;

        std::vector<std::thread> thread_pool;

        for (usize index = 0; index < s_thread_count - 1; ++index) {
            thread_pool.emplace_back(
                __perform_flip_internal, total_axes_for_single_thread * (index),
                total_axes_for_single_thread * (index + 1));
        }

        thread_pool.emplace_back(
            __perform_flip_internal,
            total_axes_for_single_thread * (s_thread_count - 1), total_axes);

        for (auto &thread : thread_pool) {
            thread.join();
        }
    }

    return result;
}

#endif
