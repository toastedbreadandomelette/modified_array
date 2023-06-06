#pragma once
#ifndef _MAT_MULTIPLY_HPP_
#define _MAT_MULTIPLY_HPP_

#include "./mat_multiply/double.hpp"
#include "./mat_multiply/double_mt.hpp"
#include "./mat_multiply/float.hpp"
#include "./mat_multiply/float_mt.hpp"
#include "./md_linear_algebra.hpp"

/**
 * @note this is not as fast as MKL libraries but still better
 */
template <typename T3, typename T1, typename T2>
MdStaticArray<T3> Linalg::mat_multiply(const MdStaticArray<T1> &first,
                                       const MdStaticArray<T2> &other,
                                       const i32 threads) {
    if (first.shp_size != 2 || other.shp_size != 2) {
        throw std::runtime_error(
            "Matrix dimension do not match for matrix multiplication.");
    }

    if (first.shape[1] != other.shape[0]) {
        throw std::runtime_error(
            "Total column of first matrix are not same as total rows in "
            "second "
            "matrix.");
    }
    const usize fshape0 = first.get_shape()[0], fshape1 = first.get_shape()[1],
                oshape0 = other.get_shape()[0], oshape1 = other.get_shape()[1];

    usize k_bound = 0, i_bound = 0, j_bound = 0;

    MdStaticArray<T3> result({fshape0, oshape1}, 0);
    MdStaticArray<T2> other_t({oshape1, oshape0}, 0);

    for (usize i = 0; i < oshape1; ++i) {
        for (usize j = 0; j < oshape0; ++j) {
            other_t.__array[i * oshape0 + j] = other.__array[j * oshape1 + i];
        }
    }

    const usize block_size = 32;

    if (result.get_size() > s_threshold_size && threads > 1) {
        if constexpr (std::is_same<T1, f64>::value &&
                      std::is_same<T2, f64>::value &&
                      std::is_same<T3, f64>::value) {
            mul_mt(first.__array, other_t.__array, result.__array, fshape0,
                   fshape1, oshape1);
        } else if constexpr (std::is_same<T1, f32>::value &&
                             std::is_same<T2, f32>::value &&
                             std::is_same<T3, f32>::value) {
            mul_mt_f32(first.__array, other_t.__array, result.__array, fshape0,
                       fshape1, oshape1);
        } else {
            auto __multiply_internal = [&first, &other_t, block_size, &result,
                                        fshape0, fshape1, oshape0, oshape1](
                                           const usize start, const usize end) {
                usize k_bound = 0, i_bound = 0, j_bound = 0;

                for (usize i_block = start; i_block < end;
                     i_block += block_size) {
                    i_bound = std::min(i_block + block_size, fshape0);

                    for (usize j_block = 0; j_block < oshape1;
                         j_block += block_size) {
                        j_bound = std::min(j_block + block_size, oshape1);

                        for (usize i = i_block; i < i_bound; ++i) {
                            for (usize j = j_block; j < j_bound; ++j) {
                                T3 answer = 0;
                                for (usize k = 0; k < fshape1; ++k) {
                                    answer += first.__array[i * fshape1 + k] *
                                              other_t.__array[j * oshape1 + k];
                                }
                                result.__array[i * oshape0 + j] = answer;
                            }
                        }
                    }
                }
            };

            usize blocks = first.shape[0] / threads;
            std::vector<std::thread> thread_pool;
            for (int i = 0; i < threads - 1; ++i) {
                thread_pool.emplace_back(std::thread(
                    __multiply_internal, blocks * i, blocks * (i + 1)));
            }

            thread_pool.emplace_back(std::thread(
                __multiply_internal, blocks * (threads - 1), other.shape[1]));

            for (auto &thread : thread_pool) {
                thread.join();
            }
        }
    } else {
        if constexpr (std::is_same<T1, f64>::value &&
                      std::is_same<T2, f64>::value &&
                      std::is_same<T3, f64>::value) {
            mul_st(first.__array, other_t.__array, result.__array, fshape0,
                   fshape1, oshape1);
        } else if constexpr (std::is_same<T1, f32>::value &&
                             std::is_same<T2, f32>::value &&
                             std::is_same<T3, f32>::value) {
            mul_st_f32(first.__array, other_t.__array, result.__array, fshape0,
                       fshape1, oshape1);
        } else {
            for (usize i_block = 0; i_block < fshape0; i_block += block_size) {
                i_bound = std::min(i_block + block_size, fshape0);

                for (usize j_block = 0; j_block < oshape1;
                     j_block += block_size) {
                    j_bound = std::min(j_block + block_size, oshape1);

                    for (usize i = i_block; i < i_bound; ++i) {
                        for (usize j = j_block; j < j_bound; ++j) {
                            T3 answer = 0;
                            for (usize k = 0; k < fshape1; ++k) {
                                answer += first.__array[i * fshape1 + k] *
                                          other_t.__array[j * oshape1 + k];
                            }
                            result.__array[i * oshape0 + j] = answer;
                        }
                    }
                }
            }
        }
    }

    return result;
}

template <typename T3, typename T1, typename T2>
MdStaticArray<T3> Linalg::mat_multiply(const MdStaticArrayReference<T1> &first,
                                       const MdStaticArray<T2> &other,
                                       const int threads) {
    return Linalg::mat_multiply<T3, T1, T2>(
        MdStaticArray<T1>(*first.__array_reference, first.offset,
                          first.shp_offset),
        other, threads);
}

template <typename T3, typename T1, typename T2>
MdStaticArray<T3> Linalg::mat_multiply(const MdStaticArray<T1> &first,
                                       const MdStaticArrayReference<T2> &other,
                                       const int threads) {
    return Linalg::mat_multiply<T3, T1, T2>(
        first,
        MdStaticArray<T2>(*other.__array_reference, other.offset,
                          other.shp_offset),
        threads);
}

template <typename T3, typename T1, typename T2>
MdStaticArray<T3> Linalg::mat_multiply(const MdStaticArrayReference<T1> &first,
                                       const MdStaticArrayReference<T2> &other,
                                       const int threads) {
    return Linalg::mat_multiply<T3, T1, T2>(
        MdStaticArray<T1>(*first.__array_reference, first.offset,
                          first.shp_offset),
        MdStaticArray<T2>(*other.__array_reference, other.offset,
                          other.shp_offset),
        threads);
}

#endif
