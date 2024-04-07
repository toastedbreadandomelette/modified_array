#pragma once
#ifndef _MAT_MULTIPLY_DOUBLE_MT_HPP_
#define _MAT_MULTIPLY_DOUBLE_MT_HPP_

#include <immintrin.h>

#include <thread>
#include <vector>

#include "../../../utility/alloc.hpp"
#include "../../../utility/simd.hpp"
#include "../../md_static_array/md_static_array.hpp"

void mul_mt_internal_f64(f64 *a, f64 *tb, f64 *c, i32 m, i32 n, i32 p,
                         i32 start_row, i32 end_row) {
    constexpr i32 block_size = 64;
    const i32 remainder_cols = p & 3;
    const i32 remainder_rows = (end_row - start_row) & 3;
    const i32 remainder_vec = n & 15;
    // Compute block by block
    for (i32 iblock = start_row; iblock < end_row - remainder_rows;
         iblock += block_size) {
        // This will compute c tile by tile
        i32 ibound = iblock + block_size > end_row - remainder_rows
                         ? end_row - remainder_rows
                         : iblock + block_size;
        for (i32 jblock = 0; jblock < p - remainder_cols;
             jblock += block_size) {
            // now compute inner block_size x block_size matrices
            i32 jbound = jblock + block_size > p - remainder_cols
                             ? p - remainder_cols
                             : jblock + block_size;
            // Compute
            for (i32 i = iblock; i < ibound; i += 4) {
                // Process 4 values at a time
                for (i32 j = jblock; j < jbound; j += 4) {
                    // Accumulator:
                    // we compute 4x4 matrix at a time
                    f64x4 acc00 = f64x4::def();
                    f64x4 acc01 = f64x4::def();
                    f64x4 acc02 = f64x4::def();
                    f64x4 acc03 = f64x4::def();

                    f64x4 acc10 = f64x4::def();
                    f64x4 acc11 = f64x4::def();
                    f64x4 acc12 = f64x4::def();
                    f64x4 acc13 = f64x4::def();

                    f64x4 acc20 = f64x4::def();
                    f64x4 acc21 = f64x4::def();
                    f64x4 acc22 = f64x4::def();
                    f64x4 acc23 = f64x4::def();

                    f64x4 acc30 = f64x4::def();
                    f64x4 acc31 = f64x4::def();
                    f64x4 acc32 = f64x4::def();
                    f64x4 acc33 = f64x4::def();

                    // Loop over second axis of A and first axis of B
                    // Processing 4 values at a time, loop unrolled by 4,
                    // we get
                    for (i32 k = 0; k < n - remainder_vec; k += 16) {
                        auto bvec00 = f64x4(tb + (j * n + k));
                        auto bvec01 = f64x4(tb + (j * n + k + 4));
                        auto bvec02 = f64x4(tb + (j * n + k + 8));
                        auto bvec03 = f64x4(tb + (j * n + k + 12));

                        auto bvec10 = f64x4(tb + ((j + 1) * n + k));
                        auto bvec11 = f64x4(tb + ((j + 1) * n + k + 4));
                        auto bvec12 = f64x4(tb + ((j + 1) * n + k + 8));
                        auto bvec13 = f64x4(tb + ((j + 1) * n + k + 12));

                        auto bvec20 = f64x4(tb + ((j + 2) * n + k));
                        auto bvec21 = f64x4(tb + ((j + 2) * n + k + 4));
                        auto bvec22 = f64x4(tb + ((j + 2) * n + k + 8));
                        auto bvec23 = f64x4(tb + ((j + 2) * n + k + 12));

                        auto bvec30 = f64x4(tb + ((j + 3) * n + k));
                        auto bvec31 = f64x4(tb + ((j + 3) * n + k + 4));
                        auto bvec32 = f64x4(tb + ((j + 3) * n + k + 8));
                        auto bvec33 = f64x4(tb + ((j + 3) * n + k + 12));

                        auto avec0 = f64x4(a + (i * n + k));
                        auto avec1 = f64x4(a + (i * n + k + 4));
                        auto avec2 = f64x4(a + (i * n + k + 8));
                        auto avec3 = f64x4(a + (i * n + k + 12));

                        acc00 += avec0 * bvec00;
                        acc01 += avec0 * bvec10;
                        acc02 += avec0 * bvec20;
                        acc03 += avec0 * bvec30;

                        acc00 += avec1 * bvec01;
                        acc01 += avec1 * bvec11;
                        acc02 += avec1 * bvec21;
                        acc03 += avec1 * bvec31;

                        acc00 += avec2 * bvec02;
                        acc01 += avec2 * bvec12;
                        acc02 += avec2 * bvec22;
                        acc03 += avec2 * bvec32;

                        acc00 += avec3 * bvec03;
                        acc01 += avec3 * bvec13;
                        acc02 += avec3 * bvec23;
                        acc03 += avec3 * bvec33;

                        /////////////////////////////////////////////////////////////////

                        avec0 = f64x4(a + ((i + 1) * n + k));
                        avec1 = f64x4(a + ((i + 1) * n + k + 4));
                        avec2 = f64x4(a + ((i + 1) * n + k + 8));
                        avec3 = f64x4(a + ((i + 1) * n + k + 12));

                        acc10 += avec0 * bvec00;
                        acc11 += avec0 * bvec10;
                        acc12 += avec0 * bvec20;
                        acc13 += avec0 * bvec30;

                        acc10 += avec1 * bvec01;
                        acc11 += avec1 * bvec11;
                        acc12 += avec1 * bvec21;
                        acc13 += avec1 * bvec31;

                        acc10 += avec2 * bvec02;
                        acc11 += avec2 * bvec12;
                        acc12 += avec2 * bvec22;
                        acc13 += avec2 * bvec32;

                        acc10 += avec3 * bvec03;
                        acc11 += avec3 * bvec13;
                        acc12 += avec3 * bvec23;
                        acc13 += avec3 * bvec33;

                        ///////////////////////////////////////////////////////////////////

                        avec0 = f64x4(a + ((i + 2) * n + k));
                        avec1 = f64x4(a + ((i + 2) * n + k + 4));
                        avec2 = f64x4(a + ((i + 2) * n + k + 8));
                        avec3 = f64x4(a + ((i + 2) * n + k + 12));

                        acc20 += avec0 * bvec00;
                        acc21 += avec0 * bvec10;
                        acc22 += avec0 * bvec20;
                        acc23 += avec0 * bvec30;

                        acc20 += avec1 * bvec01;
                        acc21 += avec1 * bvec11;
                        acc22 += avec1 * bvec21;
                        acc23 += avec1 * bvec31;

                        acc20 += avec2 * bvec02;
                        acc21 += avec2 * bvec12;
                        acc22 += avec2 * bvec22;
                        acc23 += avec2 * bvec32;

                        acc20 += avec3 * bvec03;
                        acc21 += avec3 * bvec13;
                        acc22 += avec3 * bvec23;
                        acc23 += avec3 * bvec33;

                        /////////////////////////////////////////////////////////////

                        avec0 = f64x4(a + ((i + 3) * n + k));
                        avec1 = f64x4(a + ((i + 3) * n + k + 4));
                        avec2 = f64x4(a + ((i + 3) * n + k + 8));
                        avec3 = f64x4(a + ((i + 3) * n + k + 12));

                        acc30 += avec0 * bvec00;
                        acc31 += avec0 * bvec10;
                        acc32 += avec0 * bvec20;
                        acc33 += avec0 * bvec30;

                        acc30 += avec1 * bvec01;
                        acc31 += avec1 * bvec11;
                        acc32 += avec1 * bvec21;
                        acc33 += avec1 * bvec31;

                        acc30 += avec2 * bvec02;
                        acc31 += avec2 * bvec12;
                        acc32 += avec2 * bvec22;
                        acc33 += avec2 * bvec32;

                        acc30 += avec3 * bvec03;
                        acc31 += avec3 * bvec13;
                        acc32 += avec3 * bvec23;
                        acc33 += avec3 * bvec33;
                    }

                    for (i32 k = n - remainder_vec; k < n; ++k) {
                        const auto tb0 = tb[j * n + k],
                                   tb1 = tb[(j + 1) * n + k],
                                   tb2 = tb[(j + 2) * n + k],
                                   tb3 = tb[(j + 3) * n + k];
                        const auto a0 = a[i * n + k], a1 = a[(i + 1) * n + k],
                                   a2 = a[(i + 2) * n + k],
                                   a3 = a[(i + 3) * n + k];

                        c[i * p + j] += a0 * tb0;
                        c[i * p + j + 1] += a0 * tb1;
                        c[i * p + j + 2] += a0 * tb2;
                        c[i * p + j + 3] += a0 * tb3;

                        c[(i + 1) * p + j] += a1 * tb0;
                        c[(i + 1) * p + j + 1] += a1 * tb1;
                        c[(i + 1) * p + j + 2] += a1 * tb2;
                        c[(i + 1) * p + j + 3] += a1 * tb3;

                        c[(i + 2) * p + j] += a2 * tb0;
                        c[(i + 2) * p + j + 1] += a2 * tb1;
                        c[(i + 2) * p + j + 2] += a2 * tb2;
                        c[(i + 2) * p + j + 3] += a2 * tb3;

                        c[(i + 3) * p + j] += a3 * tb0;
                        c[(i + 3) * p + j + 1] += a3 * tb1;
                        c[(i + 3) * p + j + 2] += a3 * tb2;
                        c[(i + 3) * p + j + 3] += a3 * tb3;
                    }

                    c[i * p + j] += acc00.reduce_sum();
                    c[i * p + j + 1] += acc01.reduce_sum();
                    c[i * p + j + 2] += acc02.reduce_sum();
                    c[i * p + j + 3] += acc03.reduce_sum();

                    c[(i + 1) * p + j] += acc10.reduce_sum();
                    c[(i + 1) * p + j + 1] += acc11.reduce_sum();
                    c[(i + 1) * p + j + 2] += acc12.reduce_sum();
                    c[(i + 1) * p + j + 3] += acc13.reduce_sum();

                    c[(i + 2) * p + j] += acc20.reduce_sum();
                    c[(i + 2) * p + j + 1] += acc21.reduce_sum();
                    c[(i + 2) * p + j + 2] += acc22.reduce_sum();
                    c[(i + 2) * p + j + 3] += acc23.reduce_sum();

                    c[(i + 3) * p + j] += acc30.reduce_sum();
                    c[(i + 3) * p + j + 1] += acc31.reduce_sum();
                    c[(i + 3) * p + j + 2] += acc32.reduce_sum();
                    c[(i + 3) * p + j + 3] += acc33.reduce_sum();
                }
                for (i32 j = p - remainder_cols; j < p; ++j) {
                    f64 ans0 = 0, ans1 = 0, ans2 = 0, ans3 = 0;
                    for (i32 k = 0; k < n; ++k) {
                        f64 tbv = tb[j * n + k];
                        ans0 += a[i * n + k] * tbv;
                        ans1 += a[(i + 1) * n + k] * tbv;
                        ans2 += a[(i + 2) * n + k] * tbv;
                        ans3 += a[(i + 3) * n + k] * tbv;
                    }
                    c[i * p + j] += ans0;
                    c[(i + 1) * p + j] += ans1;
                    c[(i + 2) * p + j] += ans2;
                    c[(i + 3) * p + j] += ans3;
                }
            }
        }
    }
    for (i32 i = end_row - remainder_rows; i < end_row; ++i) {
        for (i32 j = 0; j < p; ++j) {
            f64 ans = 0;
            for (i32 k = 0; k < n; ++k) {
                ans += a[i * n + k] * tb[j * n + k];
            }
            c[i * p + j] = ans;
        }
    }
}

/**
 * @brief Multiply two matrices A and transposed B matrix
 * This is a single-thread operation.
 * @param a matrix A
 * @param tb Transposed matrix B
 * @param m first axis of A
 * @param n second axis of A | first axis of B
 * @param p second axis of B
 */
void mul_mt(f64 *a, f64 *tb, f64 *c, i32 m, i32 n, i32 p) {
    i32 rem = (m * p) & 3;

    std::vector<std::thread> threads;

    i32 clamped_thread_count = std::min(i32(::s_thread_count), m / 64);

    i32 total_rows_per_thread = m / clamped_thread_count;

    for (usize index = 0; index < clamped_thread_count - 1; ++index) {
        threads.emplace_back(std::thread(mul_mt_internal_f64, a, tb, c, m, n, p,
                                         index * total_rows_per_thread,
                                         (index + 1) * total_rows_per_thread));
    }

    threads.emplace_back(
        std::thread(mul_mt_internal_f64, a, tb, c, m, n, p,
                    (clamped_thread_count - 1) * total_rows_per_thread, m));

    for (auto &thread : threads) {
        thread.join();
    }
}

#endif
