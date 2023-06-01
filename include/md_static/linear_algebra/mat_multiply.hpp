#pragma once
#ifndef _MAT_MULTIPLY_HPP_
#define _MAT_MULTIPLY_HPP_

#include "./md_linear_algebra.hpp"

/**
 * @note this is not as fast as MKL libraries but still better
 */
template <typename T3, typename T1, typename T2>
MdStaticArray<T3> Linalg::mat_multiply(const MdStaticArray<T1> &first,
                                       const MdStaticArray<T2> &other,
                                       const size_t threads) {
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

    size_t k_bound = 0, i_bound = 0, j_bound = 0;
    const size_t fshape0 = first.get_shape()[0], fshape1 = first.get_shape()[1],
                 oshape0 = other.get_shape()[0], oshape1 = other.get_shape()[1];

    MdStaticArray<T2> other_t({oshape1, oshape0}, 0);

    for (size_t i = 0; i < oshape1; ++i) {
        for (size_t j = 0; j < oshape0; ++j) {
            other_t.__array[i * oshape0 + j] = other.__array[j * oshape1 + i];
        }
    }

    for (size_t i = 0; i < oshape1; ++i) {
        for (size_t j = 0; j < oshape0; ++j) {
            other_t.__array[i * oshape0 + j] = other.__array[j * oshape1 + i];
        }
    }

    const size_t block_size = 32;

    if (result.get_size() > s_threshold_size && threads > 1) {
        auto __multiply_internal = [&first, &other_t, block_size, &result,
                                    fshape0, fshape1, oshape0, oshape1](
                                       const size_t start, const size_t end) {
            size_t k_bound = 0, i_bound = 0, j_bound = 0;

            for (size_t i_block = start; i_block < end; i_block += block_size) {
                i_bound = std::min(i_block + block_size, fshape0);

                for (size_t j_block = 0; j_block < oshape1;
                     j_block += block_size) {
                    j_bound = std::min(j_block + block_size, oshape1);

                    for (size_t i = i_block; i < i_bound; i += 4) {
                        for (size_t j = j_block; j < j_bound; j += 4) {
                            T3 answer0[4] = {0, 0, 0, 0};
                            T3 answer1[4] = {0, 0, 0, 0};
                            T3 answer2[4] = {0, 0, 0, 0};
                            T3 answer3[4] = {0, 0, 0, 0};
                            for (size_t k = 0; k < fshape1; ++k) {
                                auto av = first.__array[i * fshape1 + k];
                                auto bv0 = other_t.__array[j * oshape0 + k];
                                auto bv1 =
                                    other_t.__array[(j + 1) * oshape0 + k];
                                auto bv2 =
                                    other_t.__array[(j + 2) * oshape0 + k];
                                auto bv3 =
                                    other_t.__array[(j + 3) * oshape0 + k];
                                answer0[0] += av * bv0;
                                answer0[1] += av * bv1;
                                answer0[2] += av * bv2;
                                answer0[3] += av * bv3;

                                av = first.__array[(i + 1) * fshape1 + k];
                                answer1[0] += av * bv0;
                                answer1[1] += av * bv1;
                                answer1[2] += av * bv2;
                                answer1[3] += av * bv3;

                                av = first.__array[(i + 2) * fshape1 + k];
                                answer2[0] += av * bv0;
                                answer2[1] += av * bv1;
                                answer2[2] += av * bv2;
                                answer2[3] += av * bv3;

                                av = first.__array[(i + 2) * fshape1 + k];
                                answer3[0] += av * bv0;
                                answer3[1] += av * bv1;
                                answer3[2] += av * bv2;
                                answer3[3] += av * bv3;
                            }
                            result.__array[i * oshape1 + j] += answer0[0];
                            result.__array[i * oshape1 + j + 1] += answer0[1];
                            result.__array[i * oshape1 + j + 2] += answer0[2];
                            result.__array[i * oshape1 + j + 3] += answer0[3];

                            result.__array[(i + 1) * oshape1 + j] += answer1[0];
                            result.__array[(i + 1) * oshape1 + j + 1] +=
                                answer1[1];
                            result.__array[(i + 1) * oshape1 + j + 2] +=
                                answer1[2];
                            result.__array[(i + 1) * oshape1 + j + 3] +=
                                answer1[3];

                            result.__array[(i + 2) * oshape1 + j] += answer2[0];
                            result.__array[(i + 2) * oshape1 + j + 1] +=
                                answer2[1];
                            result.__array[(i + 2) * oshape1 + j + 2] +=
                                answer2[2];
                            result.__array[(i + 2) * oshape1 + j + 3] +=
                                answer2[3];

                            result.__array[(i + 3) * oshape1 + j] += answer3[0];
                            result.__array[(i + 3) * oshape1 + j + 1] +=
                                answer3[1];
                            result.__array[(i + 3) * oshape1 + j + 2] +=
                                answer3[2];
                            result.__array[(i + 3) * oshape1 + j + 3] +=
                                answer3[3];
                        }
                    }
                }
            }
        };

        size_t blocks = first.shape[0] / threads;
        std::vector<std::thread> thread_pool;
        for (int i = 0; i < threads - 1; ++i) {
            thread_pool.emplace_back(
                std::thread(__multiply_internal, blocks * i, blocks * (i + 1)));
        }

        thread_pool.emplace_back(std::thread(
            __multiply_internal, blocks * (threads - 1), other.shape[1]));

        for (auto &thread : thread_pool) {
            thread.join();
        }
    } else {
        for (size_t i_block = 0; i_block < fshape0; i_block += block_size) {
            i_bound = std::min(i_block + block_size, fshape0);

            for (size_t j_block = 0; j_block < oshape1; j_block += block_size) {
                j_bound = std::min(j_block + block_size, oshape1);

                for (size_t i = i_block; i < i_bound; i += 4) {
                    for (size_t j = j_block; j < j_bound; j += 4) {
                        T3 answer0[4] = {0, 0, 0, 0};
                        T3 answer1[4] = {0, 0, 0, 0};
                        T3 answer2[4] = {0, 0, 0, 0};
                        T3 answer3[4] = {0, 0, 0, 0};
                        for (size_t k = 0; k < fshape1; ++k) {
                            auto av = first.__array[i * fshape1 + k];
                            auto bv0 = other_t.__array[j * oshape0 + k];
                            auto bv1 = other_t.__array[(j + 1) * oshape0 + k];
                            auto bv2 = other_t.__array[(j + 2) * oshape0 + k];
                            auto bv3 = other_t.__array[(j + 3) * oshape0 + k];
                            answer0[0] += av * bv0;
                            answer0[1] += av * bv1;
                            answer0[2] += av * bv2;
                            answer0[3] += av * bv3;

                            av = first.__array[(i + 1) * fshape1 + k];
                            answer1[0] += av * bv0;
                            answer1[1] += av * bv1;
                            answer1[2] += av * bv2;
                            answer1[3] += av * bv3;

                            av = first.__array[(i + 2) * fshape1 + k];
                            answer2[0] += av * bv0;
                            answer2[1] += av * bv1;
                            answer2[2] += av * bv2;
                            answer2[3] += av * bv3;

                            av = first.__array[(i + 2) * fshape1 + k];
                            answer3[0] += av * bv0;
                            answer3[1] += av * bv1;
                            answer3[2] += av * bv2;
                            answer3[3] += av * bv3;
                        }
                        result.__array[i * oshape1 + j] += answer0[0];
                        result.__array[i * oshape1 + j + 1] += answer0[1];
                        result.__array[i * oshape1 + j + 2] += answer0[2];
                        result.__array[i * oshape1 + j + 3] += answer0[3];

                        result.__array[(i + 1) * oshape1 + j] += answer1[0];
                        result.__array[(i + 1) * oshape1 + j + 1] += answer1[1];
                        result.__array[(i + 1) * oshape1 + j + 2] += answer1[2];
                        result.__array[(i + 1) * oshape1 + j + 3] += answer1[3];

                        result.__array[(i + 2) * oshape1 + j] += answer2[0];
                        result.__array[(i + 2) * oshape1 + j + 1] += answer2[1];
                        result.__array[(i + 2) * oshape1 + j + 2] += answer2[2];
                        result.__array[(i + 2) * oshape1 + j + 3] += answer2[3];

                        result.__array[(i + 3) * oshape1 + j] += answer3[0];
                        result.__array[(i + 3) * oshape1 + j + 1] += answer3[1];
                        result.__array[(i + 3) * oshape1 + j + 2] += answer3[2];
                        result.__array[(i + 3) * oshape1 + j + 3] += answer3[3];
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
                                       const size_t threads) {
    return Linalg::mat_multiply<T3, T1, T2>(
        MdStaticArray<T1>(*first.__array_reference, first.offset,
                          first.shp_offset),
        other, threads);
}

template <typename T3, typename T1, typename T2>
MdStaticArray<T3> Linalg::mat_multiply(const MdStaticArray<T1> &first,
                                       const MdStaticArrayReference<T2> &other,
                                       const size_t threads) {
    return Linalg::mat_multiply<T3, T1, T2>(
        first,
        MdStaticArray<T2>(*other.__array_reference, other.offset,
                          other.shp_offset),
        threads);
}

template <typename T3, typename T1, typename T2>
MdStaticArray<T3> Linalg::mat_multiply(const MdStaticArrayReference<T1> &first,
                                       const MdStaticArrayReference<T2> &other,
                                       const size_t threads) {
    return Linalg::mat_multiply<T3, T1, T2>(
        MdStaticArray<T1>(*first.__array_reference, first.offset,
                          first.shp_offset),
        MdStaticArray<T2>(*other.__array_reference, other.offset,
                          other.shp_offset),
        threads);
}

#endif
