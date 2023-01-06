#pragma once
#ifndef _MAT_MULTIPLY_HPP_
#define _MAT_MULTIPLY_HPP_

#include "./md_linear_algebra.hpp"

template <typename _T1, typename _T2, typename _T3>
MdStaticArray<_T3> MdLinearAlgebra::mat_multiply(
    const MdStaticArray<_T1> &__first, const MdStaticArray<_T2> &__other,
    const _T3 as, const size_t threads) {
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

    /// This loop is kept outside due to performance reasons.
    /// Split i or j into blocks
    const size_t block_size = 32;

    auto __multiply_internal = [&__first, &__other, block_size, &result](
                                   const size_t start, const size_t end) {
        size_t k_bound = 0, i_bound = 0, j_bound = 0;
        const size_t fshape1 = __first.get_shape()[1],
                     oshape1 = __other.get_shape()[1];

        for (size_t k_block = 0; k_block < fshape1; k_block += block_size) {
            k_bound = std::min(k_block + block_size, fshape1);

            for (size_t i_block = start; i_block < end; i_block += block_size) {
                i_bound = std::min(i_block + block_size, end);

                for (size_t i = i_block; i < i_bound; ++i) {
                    for (size_t k = k_block; k < k_bound; ++k) {
                        const auto c = __first.__array[i * fshape1 + k];
                        for (size_t j = 0; j < oshape1; ++j) {
                            result.__array[i * fshape1 + j] +=
                                c * __other.__array[k * oshape1 + j];
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

#endif
