#pragma once
#ifndef _MAT_MULTIPLY_COMPLEX64_HPP_
#define _MAT_MULTIPLY_COMPLEX64_HPP_

#include <immintrin.h>

#include "../../../utility/alloc.hpp"
#include "../../../utility/simd.hpp"

/**
 * @brief Multiply two matrices A and transposed B matrix
 * This is a single-thread operation.
 * @param a matrix A
 * @param tb Transposed matrix B
 * @param m first axis of A
 * @param n second axis of A | first axis of B
 * @param p second axis of B
 * @returns third array containing result of matmul
 */
void mul_st_c64(c64 *a, c64 *tb, c64 *c, i32 m, i32 n, i32 p) {
    i32 rem = (m * p) & 3;

    const i32 block_size = 64;
    const i32 remainder_cols = p & 3;
    const i32 remainder_rows = m & 3;
    const i32 remainder_vec = n & 7;

    c64x2 acc00 = C64x2::zero();
    c64x2 acc01 = C64x2::zero();
    c64x2 acc02 = C64x2::zero();
    c64x2 acc03 = C64x2::zero();

    c64x2 acc10 = C64x2::zero();
    c64x2 acc11 = C64x2::zero();
    c64x2 acc12 = C64x2::zero();
    c64x2 acc13 = C64x2::zero();

    c64x2 acc20 = C64x2::zero();
    c64x2 acc21 = C64x2::zero();
    c64x2 acc22 = C64x2::zero();
    c64x2 acc23 = C64x2::zero();

    c64x2 acc30 = C64x2::zero();
    c64x2 acc31 = C64x2::zero();
    c64x2 acc32 = C64x2::zero();
    c64x2 acc33 = C64x2::zero();
    // Compute block by block
    for (i32 iblock = 0; iblock < m - remainder_rows; iblock += block_size) {
        // This will compute c tile by tile
        i32 ibound = iblock + block_size > m - remainder_rows
                         ? m - remainder_rows
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
                    acc00 = C64x2::zero();
                    acc01 = C64x2::zero();
                    acc02 = C64x2::zero();
                    acc03 = C64x2::zero();

                    acc10 = C64x2::zero();
                    acc11 = C64x2::zero();
                    acc12 = C64x2::zero();
                    acc13 = C64x2::zero();

                    acc20 = C64x2::zero();
                    acc21 = C64x2::zero();
                    acc22 = C64x2::zero();
                    acc23 = C64x2::zero();

                    acc30 = C64x2::zero();
                    acc31 = C64x2::zero();
                    acc32 = C64x2::zero();
                    acc33 = C64x2::zero();

                    // Loop over second axis of A and first axis of B
                    // Processing 4 values at a time, loop unrolled by 4,
                    // we get
                    for (i32 k = 0; k < n - remainder_vec; k += 8) {
                        auto avec = C64x2::fromptr(a + (i * n + k));

                        auto bvec00 = C64x2::fromptr(tb + (j * n + k));
                        auto bvec01 = C64x2::fromptr(tb + (j * n + k + 2));
                        auto bvec02 = C64x2::fromptr(tb + (j * n + k + 4));
                        auto bvec03 = C64x2::fromptr(tb + (j * n + k + 6));

                        auto bvec10 = C64x2::fromptr(tb + ((j + 1) * n + k));
                        auto bvec11 =
                            C64x2::fromptr(tb + ((j + 1) * n + k + 2));
                        auto bvec12 =
                            C64x2::fromptr(tb + ((j + 1) * n + k + 4));
                        auto bvec13 =
                            C64x2::fromptr(tb + ((j + 1) * n + k + 6));

                        auto bvec20 = C64x2::fromptr(tb + ((j + 2) * n + k));
                        auto bvec21 =
                            C64x2::fromptr(tb + ((j + 2) * n + k + 4));
                        auto bvec22 =
                            C64x2::fromptr(tb + ((j + 2) * n + k + 2));
                        auto bvec23 =
                            C64x2::fromptr(tb + ((j + 2) * n + k + 6));

                        auto bvec30 = C64x2::fromptr(tb + ((j + 3) * n + k));
                        auto bvec31 =
                            C64x2::fromptr(tb + ((j + 3) * n + k + 2));
                        auto bvec32 =
                            C64x2::fromptr(tb + ((j + 3) * n + k + 4));
                        auto bvec33 =
                            C64x2::fromptr(tb + ((j + 3) * n + k + 6));

                        acc00 = C64x2::fmadd(avec, bvec00, acc00);
                        acc01 = C64x2::fmadd(avec, bvec10, acc01);
                        acc02 = C64x2::fmadd(avec, bvec20, acc02);
                        acc03 = C64x2::fmadd(avec, bvec30, acc03);

                        avec = C64x2::fromptr(a + (i * n + k + 2));

                        acc00 = C64x2::fmadd(avec, bvec01, acc00);
                        acc01 = C64x2::fmadd(avec, bvec11, acc01);
                        acc02 = C64x2::fmadd(avec, bvec21, acc02);
                        acc03 = C64x2::fmadd(avec, bvec31, acc03);

                        avec = C64x2::fromptr(a + (i * n + k + 4));

                        acc00 = C64x2::fmadd(avec, bvec02, acc00);
                        acc01 = C64x2::fmadd(avec, bvec12, acc01);
                        acc02 = C64x2::fmadd(avec, bvec22, acc02);
                        acc03 = C64x2::fmadd(avec, bvec32, acc03);

                        avec = C64x2::fromptr(a + (i * n + k + 6));

                        acc00 = C64x2::fmadd(avec, bvec03, acc00);
                        acc01 = C64x2::fmadd(avec, bvec13, acc01);
                        acc02 = C64x2::fmadd(avec, bvec23, acc02);
                        acc03 = C64x2::fmadd(avec, bvec33, acc03);

                        /////////////////////////////////////////////////////////////////

                        avec = C64x2::fromptr(a + ((i + 1) * n + k + 6));

                        acc10 = C64x2::fmadd(avec, bvec03, acc10);
                        acc11 = C64x2::fmadd(avec, bvec13, acc11);
                        acc12 = C64x2::fmadd(avec, bvec23, acc12);
                        acc13 = C64x2::fmadd(avec, bvec33, acc13);

                        avec = C64x2::fromptr(a + ((i + 1) * n + k));

                        acc10 = C64x2::fmadd(avec, bvec00, acc10);
                        acc11 = C64x2::fmadd(avec, bvec10, acc11);
                        acc12 = C64x2::fmadd(avec, bvec20, acc12);
                        acc13 = C64x2::fmadd(avec, bvec30, acc13);

                        avec = C64x2::fromptr(a + ((i + 1) * n + k + 2));

                        acc10 = C64x2::fmadd(avec, bvec01, acc10);
                        acc11 = C64x2::fmadd(avec, bvec11, acc11);
                        acc12 = C64x2::fmadd(avec, bvec21, acc12);
                        acc13 = C64x2::fmadd(avec, bvec31, acc13);

                        avec = C64x2::fromptr(a + ((i + 1) * n + k + 4));

                        acc10 = C64x2::fmadd(avec, bvec02, acc10);
                        acc11 = C64x2::fmadd(avec, bvec12, acc11);
                        acc12 = C64x2::fmadd(avec, bvec22, acc12);
                        acc13 = C64x2::fmadd(avec, bvec32, acc13);

                        ///////////////////////////////////////////////////////////////////

                        avec = C64x2::fromptr(a + ((i + 2) * n + k + 4));

                        acc20 = C64x2::fmadd(avec, bvec02, acc20);
                        acc21 = C64x2::fmadd(avec, bvec12, acc21);
                        acc22 = C64x2::fmadd(avec, bvec22, acc22);
                        acc23 = C64x2::fmadd(avec, bvec32, acc23);

                        avec = C64x2::fromptr(a + ((i + 2) * n + k + 6));

                        acc20 = C64x2::fmadd(avec, bvec03, acc20);
                        acc21 = C64x2::fmadd(avec, bvec13, acc21);
                        acc22 = C64x2::fmadd(avec, bvec23, acc22);
                        acc23 = C64x2::fmadd(avec, bvec33, acc23);

                        avec = C64x2::fromptr(a + ((i + 2) * n + k));

                        acc20 = C64x2::fmadd(avec, bvec00, acc20);
                        acc21 = C64x2::fmadd(avec, bvec10, acc21);
                        acc22 = C64x2::fmadd(avec, bvec20, acc22);
                        acc23 = C64x2::fmadd(avec, bvec30, acc23);

                        avec = C64x2::fromptr(a + ((i + 2) * n + k + 2));

                        acc20 = C64x2::fmadd(avec, bvec01, acc20);
                        acc21 = C64x2::fmadd(avec, bvec11, acc21);
                        acc22 = C64x2::fmadd(avec, bvec21, acc22);
                        acc23 = C64x2::fmadd(avec, bvec31, acc23);

                        /////////////////////////////////////////////////////////////

                        avec = C64x2::fromptr(a + ((i + 3) * n + k + 2));

                        acc30 = C64x2::fmadd(avec, bvec01, acc30);
                        acc31 = C64x2::fmadd(avec, bvec11, acc31);
                        acc32 = C64x2::fmadd(avec, bvec21, acc32);
                        acc33 = C64x2::fmadd(avec, bvec31, acc33);

                        avec = C64x2::fromptr(a + ((i + 3) * n + k + 4));

                        acc30 = C64x2::fmadd(avec, bvec02, acc30);
                        acc31 = C64x2::fmadd(avec, bvec12, acc31);
                        acc32 = C64x2::fmadd(avec, bvec22, acc32);
                        acc33 = C64x2::fmadd(avec, bvec32, acc33);

                        avec = C64x2::fromptr(a + ((i + 3) * n + k + 6));

                        acc30 = C64x2::fmadd(avec, bvec03, acc30);
                        acc31 = C64x2::fmadd(avec, bvec13, acc31);
                        acc32 = C64x2::fmadd(avec, bvec23, acc32);
                        acc33 = C64x2::fmadd(avec, bvec33, acc33);

                        avec = C64x2::fromptr(a + ((i + 3) * n + k));

                        acc30 = C64x2::fmadd(avec, bvec00, acc30);
                        acc31 = C64x2::fmadd(avec, bvec10, acc31);
                        acc32 = C64x2::fmadd(avec, bvec20, acc32);
                        acc33 = C64x2::fmadd(avec, bvec30, acc33);
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

                        c[(i + 2) * p + j] += a3 * tb0;
                        c[(i + 2) * p + j + 1] += a3 * tb1;
                        c[(i + 2) * p + j + 2] += a3 * tb2;
                        c[(i + 2) * p + j + 3] += a3 * tb3;

                        c[(i + 3) * p + j] += a3 * tb0;
                        c[(i + 3) * p + j + 1] += a3 * tb1;
                        c[(i + 3) * p + j + 2] += a3 * tb2;
                        c[(i + 3) * p + j + 3] += a3 * tb3;
                    }
                    c[i * p + j] += C64x2::reduce_sum(acc00);
                    c[i * p + j + 1] += C64x2::reduce_sum(acc01);
                    c[i * p + j + 2] += C64x2::reduce_sum(acc02);
                    c[i * p + j + 3] += C64x2::reduce_sum(acc03);

                    c[(i + 1) * p + j] += C64x2::reduce_sum(acc10);
                    c[(i + 1) * p + j + 1] += C64x2::reduce_sum(acc11);
                    c[(i + 1) * p + j + 2] += C64x2::reduce_sum(acc12);
                    c[(i + 1) * p + j + 3] += C64x2::reduce_sum(acc13);

                    c[(i + 2) * p + j] += C64x2::reduce_sum(acc20);
                    c[(i + 2) * p + j + 1] += C64x2::reduce_sum(acc21);
                    c[(i + 2) * p + j + 2] += C64x2::reduce_sum(acc22);
                    c[(i + 2) * p + j + 3] += C64x2::reduce_sum(acc23);

                    c[(i + 3) * p + j] += C64x2::reduce_sum(acc30);
                    c[(i + 3) * p + j + 1] += C64x2::reduce_sum(acc31);
                    c[(i + 3) * p + j + 2] += C64x2::reduce_sum(acc32);
                    c[(i + 3) * p + j + 3] += C64x2::reduce_sum(acc33);
                }
                for (i32 j = p - remainder_cols; j < p; ++j) {
                    c64 ans0 = 0, ans1 = 0, ans2 = 0, ans3 = 0;
                    for (i32 k = 0; k < n; ++k) {
                        c64 tbv = tb[j * n + k];
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
    for (i32 i = m - remainder_rows; i < m; ++i) {
        for (i32 j = 0; j < p; ++j) {
            c64 ans = 0;
            for (i32 k = 0; k < n; ++k) {
                ans += a[i * n + k] * tb[j * n + k];
            }
            c[i * p + j] = ans;
        }
    }
}

#endif
