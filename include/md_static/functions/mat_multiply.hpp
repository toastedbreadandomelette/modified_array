#pragma once
#include "./md_static_array_utility.hpp"

template <typename _T1, typename _T2, typename _T3>
MdStaticArray<_T3> MdArrayUtility::mat_multiply(
    const MdStaticArray<_T1> &__first, const MdStaticArray<_T2> &__other,
    const size_t threads) {
    if (__first.shp_size != 2 || __other.shp_size != 2) {
        throw std::runtime_error("Matrix dimension do not match.");
    }

    if (__first.shape[1] != __other.shape[0]) {
        throw std::runtime_error(
            "Total column of first matrix are not same as total rows in "
            "second "
            "matrix.");
    }

    MdStaticArray<_T3> result({__first.shape[0], __other.shape[1]}, 0);
    // To do: reduce extra memory usage here.
    size_t sz = result.get_size();
    _T3 **res_ptr = new _T3 *[__first.shape[0]];
    _T1 **first_ptr = new _T1 *[__first.shape[0]];
    _T2 **other_ptr = new _T2 *[__other.shape[0]];
    for (size_t index = 0, rindex = 0; index < result.get_size();
         index += __other.shape[1], ++rindex) {
        res_ptr[rindex] = &result.__array[index];
    }

    for (size_t index = 0, rindex = 0; index < __first.get_size();
         index += __first.shape[1], ++rindex) {
        first_ptr[rindex] = &__first.__array[index];
    }

    for (size_t index = 0, rindex = 0; index < __other.get_size();
         index += __other.shape[1], ++rindex) {
        other_ptr[rindex] = &__other.__array[index];
    }

    /// This loop is kept outside due to performance reasons.
    /// Split i or j into blocks
    size_t block_size = 64;

    auto __multiply_internal = [&res_ptr, &first_ptr, &other_ptr, &__first,
                                &__other, block_size](const size_t start,
                                                      const size_t end) {
        for (size_t k_block = start; k_block < __first.shape[1];
             k_block += block_size) {
            const size_t k_bound =
                std::min(k_block + block_size, __first.shape[1]);
            for (size_t i_block = start; i_block < end; i_block += block_size) {
                const size_t i_bound = std::min(i_block + block_size, end);
                for (size_t i = i_block; i < i_bound; ++i) {
                    for (size_t k = k_block; k < k_bound; ++k) {
                        const auto c = first_ptr[i][k];
                        for (size_t j = 0; j < __other.shape[1]; ++j) {
                            res_ptr[i][j] += c * other_ptr[k][j];
                        }
                    }
                }
            }
        }
    };

    size_t blocks = __first.shape[0] / threads;
    std::vector<std::thread> thread_pool;
    for (int i = 0; i < threads - 1; ++i) {
        thread_pool.emplace_back(
            std::thread(__multiply_internal, blocks * i, blocks * (i + 1)));
    }

    thread_pool.emplace_back(std::thread(
        __multiply_internal, blocks * (threads - 1), __first.shape[0]));

    for (auto &thread : thread_pool) {
        thread.join();
    }

    return result;
}