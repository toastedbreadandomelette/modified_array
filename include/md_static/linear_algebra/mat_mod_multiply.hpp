#pragma once
#ifndef _MAT_MOD_MULTIPLY_HPP_
#define _MAT_MOD_MULTIPLY_HPP_

#include "./md_linear_algebra.hpp"

template <typename T3, typename T1, typename T2, class T>
MdStaticArray<T3> Linalg::mat_mod_multiply(const MdStaticArray<T1> &first,
                                           const MdStaticArray<T2> &other,
                                           const usize mod,
                                           const usize threads) {
    if (first.shp_size != 2 || other.shp_size != 2) {
        throw std::runtime_error("Matrix dimension do not match.");
    }

    if (first.shape[1] != other.shape[0]) {
        throw std::runtime_error(
            "Total column of first matrix are not same as total rows in "
            "second "
            "matrix.");
    }

    MdStaticArray<T3> result({first.shape[0], other.shape[1]}, 0);

    /// This loop is kept outside due to performance reasons.
    /// Split i or j into blocks
    const usize block_size = 32;

    if (first.get_size() > s_threshold_size) {
        auto __multiply_internal = [&first, &other, block_size, &result, mod](
                                       const usize start, const usize end) {
            usize k_bound = 0, i_bound = 0, j_bound = 0;
            const usize fshape0 = first.get_shape()[0],
                        fshape1 = first.get_shape()[1],
                        oshape1 = other.get_shape()[1];

            for (usize k_block = 0; k_block < fshape1; k_block += block_size) {
                k_bound = std::min(k_block + block_size, fshape1);

                for (usize i_block = start; i_block < end;
                     i_block += block_size) {
                    i_bound = std::min(i_block + block_size, end);

                    for (usize i = i_block; i < i_bound; ++i) {
                        for (usize k = k_block; k < k_bound; ++k) {
                            const auto c = first.__array[i * fshape1 + k] % mod;

                            for (usize j = 0; j < fshape1; ++j) {
                                result.__array[i * oshape1 + j] =
                                    (result.__array[i * oshape1 + j] +
                                     c * (other.__array[k * oshape1 + j] %
                                          mod)) %
                                    mod;
                            }
                        }
                    }
                }
            }
        };

        usize blocks = first.shape[0] / threads;
        std::vector<std::thread> thread_pool;
        for (i32 i = 0; i < threads - 1; ++i) {
            thread_pool.emplace_back(
                std::thread(__multiply_internal, blocks * i, blocks * (i + 1)));
        }

        thread_pool.emplace_back(std::thread(
            __multiply_internal, blocks * (threads - 1), other.shape[1]));

        for (auto &thread : thread_pool) {
            thread.join();
        }
    } else {
        usize k_bound = 0, i_bound = 0, j_bound = 0;
        const usize fshape0 = first.get_shape()[0],
                    fshape1 = first.get_shape()[1],
                    oshape1 = other.get_shape()[1];

        for (usize k_block = 0; k_block < fshape1; k_block += block_size) {
            k_bound = std::min(k_block + block_size, fshape1);

            for (usize i_block = 0; i_block < fshape0; i_block += block_size) {
                i_bound = std::min(i_block + block_size, fshape0);

                for (usize i = i_block; i < i_bound; ++i) {
                    for (usize k = k_block; k < k_bound; ++k) {
                        const auto c = (first.__array[i * fshape1 + k] % mod);

                        for (usize j = 0; j < fshape1; ++j) {
                            result.__array[i * oshape1 + j] +=
                                c * (other.__array[k * oshape1 + j] % mod);
                            result.__array[i * oshape1 + j] %= mod;
                        }
                    }
                }
            }
        }
    }

    return result;
}

template <typename T3, typename T1, typename T2, class T>
MdStaticArray<T3> Linalg::mat_mod_multiply(
    const MdStaticArrayReference<T1> &first, const MdStaticArray<T2> &other,
    const usize mod, const usize threads) {
    return Linalg::mat_multiply<T3, T1, T2>(
        MdStaticArray<T1>(*first.__array_reference, first.offset,
                          first.shp_offset),
        other, threads);
}

template <typename T3, typename T1, typename T2, class T>
MdStaticArray<T3> Linalg::mat_mod_multiply(
    const MdStaticArray<T1> &first, const MdStaticArrayReference<T2> &other,
    const usize mod, const usize threads) {
    return Linalg::mat_multiply<T3, T1, T2>(
        first,
        MdStaticArray<T2>(*other.__array_reference, other.offset,
                          other.shp_offset),
        threads);
}

template <typename T3, typename T1, typename T2, class T>
MdStaticArray<T3> Linalg::mat_mod_multiply(
    const MdStaticArrayReference<T1> &first,
    const MdStaticArrayReference<T2> &other, const usize mod,
    const usize threads) {
    return Linalg::mat_multiply<T3, T1, T2>(
        MdStaticArray<T1>(*first.__array_reference, first.offset,
                          first.shp_offset),
        MdStaticArray<T2>(*other.__array_reference, other.offset,
                          other.shp_offset),
        threads);
}

#endif
