#pragma once
#ifndef _MAT_MULTIPLY_DOUBLE_HPP_
#define _MAT_MULTIPLY_DOUBLE_HPP_

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
void mul_st(f64 *a, f64 *tb, f64 *c, i32 m, i32 n, i32 p) {
    i32 rem = (m * p) & 3;

    constexpr i32 block_size = 32;
    const i32 remainder_cols = p & 3;
    const i32 remainder_rows = m & 3;
    const i32 remainder_vec = n & 15;

    f64x4 acc00 = F64x4::zero();
    f64x4 acc01 = F64x4::zero();
    f64x4 acc02 = F64x4::zero();
    f64x4 acc03 = F64x4::zero();

    f64x4 acc10 = F64x4::zero();
    f64x4 acc11 = F64x4::zero();
    f64x4 acc12 = F64x4::zero();
    f64x4 acc13 = F64x4::zero();

    f64x4 acc20 = F64x4::zero();
    f64x4 acc21 = F64x4::zero();
    f64x4 acc22 = F64x4::zero();
    f64x4 acc23 = F64x4::zero();

    f64x4 acc30 = F64x4::zero();
    f64x4 acc31 = F64x4::zero();
    f64x4 acc32 = F64x4::zero();
    f64x4 acc33 = F64x4::zero();
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
                    acc00 = F64x4::zero();
                    acc01 = F64x4::zero();
                    acc02 = F64x4::zero();
                    acc03 = F64x4::zero();

                    acc10 = F64x4::zero();
                    acc11 = F64x4::zero();
                    acc12 = F64x4::zero();
                    acc13 = F64x4::zero();

                    acc20 = F64x4::zero();
                    acc21 = F64x4::zero();
                    acc22 = F64x4::zero();
                    acc23 = F64x4::zero();

                    acc30 = F64x4::zero();
                    acc31 = F64x4::zero();
                    acc32 = F64x4::zero();
                    acc33 = F64x4::zero();

                    // Loop over second axis of A and first axis of B
                    // Processing 4 values at a time, loop unrolled by 4,
                    // we get
                    for (i32 k = 0; k < n - remainder_vec; k += 16) {
                        auto bvec00 = F64x4::fromptr(tb + (j * n + k));
                        auto bvec01 = F64x4::fromptr(tb + (j * n + k + 4));
                        auto bvec02 = F64x4::fromptr(tb + (j * n + k + 8));
                        auto bvec03 = F64x4::fromptr(tb + (j * n + k + 12));

                        auto bvec10 = F64x4::fromptr(tb + ((j + 1) * n + k));
                        auto bvec11 =
                            F64x4::fromptr(tb + ((j + 1) * n + k + 4));
                        auto bvec12 =
                            F64x4::fromptr(tb + ((j + 1) * n + k + 8));
                        auto bvec13 =
                            F64x4::fromptr(tb + ((j + 1) * n + k + 12));

                        auto bvec20 = F64x4::fromptr(tb + ((j + 2) * n + k));
                        auto bvec21 =
                            F64x4::fromptr(tb + ((j + 2) * n + k + 4));
                        auto bvec22 =
                            F64x4::fromptr(tb + ((j + 2) * n + k + 8));
                        auto bvec23 =
                            F64x4::fromptr(tb + ((j + 2) * n + k + 12));

                        auto bvec30 = F64x4::fromptr(tb + ((j + 3) * n + k));
                        auto bvec31 =
                            F64x4::fromptr(tb + ((j + 3) * n + k + 4));
                        auto bvec32 =
                            F64x4::fromptr(tb + ((j + 3) * n + k + 8));
                        auto bvec33 =
                            F64x4::fromptr(tb + ((j + 3) * n + k + 12));

                        auto avec0 = F64x4::fromptr(a + (i * n + k));
                        auto avec1 = F64x4::fromptr(a + (i * n + k + 4));
                        auto avec2 = F64x4::fromptr(a + (i * n + k + 8));
                        auto avec3 = F64x4::fromptr(a + (i * n + k + 12));

                        acc00 = F64x4::fmadd(avec0, bvec00, acc00);
                        acc01 = F64x4::fmadd(avec0, bvec10, acc01);
                        acc02 = F64x4::fmadd(avec0, bvec20, acc02);
                        acc03 = F64x4::fmadd(avec0, bvec30, acc03);

                        acc00 = F64x4::fmadd(avec1, bvec01, acc00);
                        acc01 = F64x4::fmadd(avec1, bvec11, acc01);
                        acc02 = F64x4::fmadd(avec1, bvec21, acc02);
                        acc03 = F64x4::fmadd(avec1, bvec31, acc03);

                        acc00 = F64x4::fmadd(avec2, bvec02, acc00);
                        acc01 = F64x4::fmadd(avec2, bvec12, acc01);
                        acc02 = F64x4::fmadd(avec2, bvec22, acc02);
                        acc03 = F64x4::fmadd(avec2, bvec32, acc03);

                        acc00 = F64x4::fmadd(avec3, bvec03, acc00);
                        acc01 = F64x4::fmadd(avec3, bvec13, acc01);
                        acc02 = F64x4::fmadd(avec3, bvec23, acc02);
                        acc03 = F64x4::fmadd(avec3, bvec33, acc03);

                        /////////////////////////////////////////////////////////////////

                        avec0 = F64x4::fromptr(a + ((i + 1) * n + k));
                        avec1 = F64x4::fromptr(a + ((i + 1) * n + k + 4));
                        avec2 = F64x4::fromptr(a + ((i + 1) * n + k + 8));
                        avec3 = F64x4::fromptr(a + ((i + 1) * n + k + 12));

                        acc10 = F64x4::fmadd(avec0, bvec00, acc10);
                        acc11 = F64x4::fmadd(avec0, bvec10, acc11);
                        acc12 = F64x4::fmadd(avec0, bvec20, acc12);
                        acc13 = F64x4::fmadd(avec0, bvec30, acc13);

                        acc10 = F64x4::fmadd(avec1, bvec01, acc10);
                        acc11 = F64x4::fmadd(avec1, bvec11, acc11);
                        acc12 = F64x4::fmadd(avec1, bvec21, acc12);
                        acc13 = F64x4::fmadd(avec1, bvec31, acc13);

                        acc10 = F64x4::fmadd(avec2, bvec02, acc10);
                        acc11 = F64x4::fmadd(avec2, bvec12, acc11);
                        acc12 = F64x4::fmadd(avec2, bvec22, acc12);
                        acc13 = F64x4::fmadd(avec2, bvec32, acc13);

                        acc10 = F64x4::fmadd(avec3, bvec03, acc10);
                        acc11 = F64x4::fmadd(avec3, bvec13, acc11);
                        acc12 = F64x4::fmadd(avec3, bvec23, acc12);
                        acc13 = F64x4::fmadd(avec3, bvec33, acc13);

                        ///////////////////////////////////////////////////////////////////

                        avec0 = F64x4::fromptr(a + ((i + 2) * n + k));
                        avec1 = F64x4::fromptr(a + ((i + 2) * n + k + 4));
                        avec2 = F64x4::fromptr(a + ((i + 2) * n + k + 8));
                        avec3 = F64x4::fromptr(a + ((i + 2) * n + k + 12));

                        acc20 = F64x4::fmadd(avec0, bvec00, acc20);
                        acc21 = F64x4::fmadd(avec0, bvec10, acc21);
                        acc22 = F64x4::fmadd(avec0, bvec20, acc22);
                        acc23 = F64x4::fmadd(avec0, bvec30, acc23);

                        acc20 = F64x4::fmadd(avec1, bvec01, acc20);
                        acc21 = F64x4::fmadd(avec1, bvec11, acc21);
                        acc22 = F64x4::fmadd(avec1, bvec21, acc22);
                        acc23 = F64x4::fmadd(avec1, bvec31, acc23);

                        acc20 = F64x4::fmadd(avec2, bvec02, acc20);
                        acc21 = F64x4::fmadd(avec2, bvec12, acc21);
                        acc22 = F64x4::fmadd(avec2, bvec22, acc22);
                        acc23 = F64x4::fmadd(avec2, bvec32, acc23);

                        acc20 = F64x4::fmadd(avec3, bvec03, acc20);
                        acc21 = F64x4::fmadd(avec3, bvec13, acc21);
                        acc22 = F64x4::fmadd(avec3, bvec23, acc22);
                        acc23 = F64x4::fmadd(avec3, bvec33, acc23);

                        /////////////////////////////////////////////////////////////

                        avec0 = F64x4::fromptr(a + ((i + 3) * n + k));
                        avec1 = F64x4::fromptr(a + ((i + 3) * n + k + 4));
                        avec2 = F64x4::fromptr(a + ((i + 3) * n + k + 8));
                        avec3 = F64x4::fromptr(a + ((i + 3) * n + k + 12));

                        acc30 = F64x4::fmadd(avec0, bvec00, acc30);
                        acc31 = F64x4::fmadd(avec0, bvec10, acc31);
                        acc32 = F64x4::fmadd(avec0, bvec20, acc32);
                        acc33 = F64x4::fmadd(avec0, bvec30, acc33);

                        acc30 = F64x4::fmadd(avec1, bvec01, acc30);
                        acc31 = F64x4::fmadd(avec1, bvec11, acc31);
                        acc32 = F64x4::fmadd(avec1, bvec21, acc32);
                        acc33 = F64x4::fmadd(avec1, bvec31, acc33);

                        acc30 = F64x4::fmadd(avec2, bvec02, acc30);
                        acc31 = F64x4::fmadd(avec2, bvec12, acc31);
                        acc32 = F64x4::fmadd(avec2, bvec22, acc32);
                        acc33 = F64x4::fmadd(avec2, bvec32, acc33);

                        acc30 = F64x4::fmadd(avec3, bvec03, acc30);
                        acc31 = F64x4::fmadd(avec3, bvec13, acc31);
                        acc32 = F64x4::fmadd(avec3, bvec23, acc32);
                        acc33 = F64x4::fmadd(avec3, bvec33, acc33);
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
                    c[i * p + j] += F64x4::reduce_sum(acc00);
                    c[i * p + j + 1] += F64x4::reduce_sum(acc01);
                    c[i * p + j + 2] += F64x4::reduce_sum(acc02);
                    c[i * p + j + 3] += F64x4::reduce_sum(acc03);

                    c[(i + 1) * p + j] += F64x4::reduce_sum(acc10);
                    c[(i + 1) * p + j + 1] += F64x4::reduce_sum(acc11);
                    c[(i + 1) * p + j + 2] += F64x4::reduce_sum(acc12);
                    c[(i + 1) * p + j + 3] += F64x4::reduce_sum(acc13);

                    c[(i + 2) * p + j] += F64x4::reduce_sum(acc20);
                    c[(i + 2) * p + j + 1] += F64x4::reduce_sum(acc21);
                    c[(i + 2) * p + j + 2] += F64x4::reduce_sum(acc22);
                    c[(i + 2) * p + j + 3] += F64x4::reduce_sum(acc23);

                    c[(i + 3) * p + j] += F64x4::reduce_sum(acc30);
                    c[(i + 3) * p + j + 1] += F64x4::reduce_sum(acc31);
                    c[(i + 3) * p + j + 2] += F64x4::reduce_sum(acc32);
                    c[(i + 3) * p + j + 3] += F64x4::reduce_sum(acc33);
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
    for (i32 i = m - remainder_rows; i < m; ++i) {
        for (i32 j = 0; j < p; ++j) {
            f64 ans = 0;
            for (i32 k = 0; k < n; ++k) {
                ans += a[i * n + k] * tb[j * n + k];
            }
            c[i * p + j] = ans;
        }
    }
}

#endif
