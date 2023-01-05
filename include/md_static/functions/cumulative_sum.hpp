#pragma once
#include "md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::cumulative_sum(
    const MdStaticArray<_T>& __other) {
    MdStaticArray<_T> result(__other.get_size());

    result.__array[0] = __other.__array[0];

    // Multithreading will be inefficient for cumulative sum of array,
    // instead, use it when user provides axis.
    for (size_t index = 0; index < __other.get_size(); ++index) {
        result.__array[index] =
            result.__array[index - 1] + __other.__array[index];
    }
    return result;
}

// template <typename _T>
// MdStaticArray<_T> cumulative_sum(const MdStaticArray<_T>& __ndarray,
//                                  const size_t axis = -1) {
//     if (axis == -1) {
//         return MdArrayUtility::cumulative_sum(__ndarray);
//     }
//     MdStaticArray<_T> result(__ndarray.get_size());
//     result.init_shape(__ndarray.get_shape(), __ndarray.get_shape_size());

//     const uint8_t total_threads =
//     std::min(static_cast<size_t>(s_thread_count),
//                                            __ndarray.get_shape()[axis]);

//     auto __perform_cumulative_sum_internal =
//         [&result, &__ndarray](const size_t start, const size_t end,
//                               const size_t stride) -> void {
//         result.__array[start] = __ndarray.__array[index];
//         for (size_t index = start + stride; index < end; index += stride) {
//             result.__array[index] =
//                 result.__array[index - stride] + __ndarray.__array[index];
//         }
//     };

//     std::vector<std::thread> thread_pool;
//     for (size_t index = 0; index < total_threads; ++index) {
//         thread_pool.emplace_back(
//             std::thread(__perform_cumulative_sum_internal, ))
//     }
//     return result;
// }
