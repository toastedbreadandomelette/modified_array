#pragma once
#ifndef _MAT_MULTIPLY_DOUBLE_HPP_
#define _MAT_MULTIPLY_DOUBLE_HPP_

#include <immintrin.h>

#include "../../utility/alloc.hpp"

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
void mul_st(double *a, double *tb, double *c, int m, int n, int p) {
    int rem = (m * p) & 3;

    const int block_size = 128;
    const int remainder_cols = p & 3;
    const int remainder_rows = m & 3;
    const int remainder_vec = n & 15;

    __m256d acc00 = _mm256_setzero_pd();
    __m256d acc01 = _mm256_setzero_pd();
    __m256d acc02 = _mm256_setzero_pd();
    __m256d acc03 = _mm256_setzero_pd();

    __m256d acc10 = _mm256_setzero_pd();
    __m256d acc11 = _mm256_setzero_pd();
    __m256d acc12 = _mm256_setzero_pd();
    __m256d acc13 = _mm256_setzero_pd();

    __m256d acc20 = _mm256_setzero_pd();
    __m256d acc21 = _mm256_setzero_pd();
    __m256d acc22 = _mm256_setzero_pd();
    __m256d acc23 = _mm256_setzero_pd();

    __m256d acc30 = _mm256_setzero_pd();
    __m256d acc31 = _mm256_setzero_pd();
    __m256d acc32 = _mm256_setzero_pd();
    __m256d acc33 = _mm256_setzero_pd();
    // Compute block by block
    for (int iblock = 0; iblock < m - remainder_rows; iblock += block_size) {
        // This will compute c tile by tile
        int ibound = iblock + block_size > m - remainder_rows
                         ? m - remainder_rows
                         : iblock + block_size;
        for (int jblock = 0; jblock < p - remainder_cols;
             jblock += block_size) {
            // now compute inner block_size x block_size matrices
            int jbound = jblock + block_size > p - remainder_cols
                             ? p - remainder_cols
                             : jblock + block_size;
            // Compute
            for (int i = iblock; i < ibound; i += 4) {
                // Process 4 values at a time
                for (int j = jblock; j < jbound; j += 4) {
                    // Accumulator:
                    // we compute 4x4 matrix at a time
                    acc00 = _mm256_setzero_pd();
                    acc01 = _mm256_setzero_pd();
                    acc02 = _mm256_setzero_pd();
                    acc03 = _mm256_setzero_pd();

                    acc10 = _mm256_setzero_pd();
                    acc11 = _mm256_setzero_pd();
                    acc12 = _mm256_setzero_pd();
                    acc13 = _mm256_setzero_pd();

                    acc20 = _mm256_setzero_pd();
                    acc21 = _mm256_setzero_pd();
                    acc22 = _mm256_setzero_pd();
                    acc23 = _mm256_setzero_pd();

                    acc30 = _mm256_setzero_pd();
                    acc31 = _mm256_setzero_pd();
                    acc32 = _mm256_setzero_pd();
                    acc33 = _mm256_setzero_pd();

                    // Loop over second axis of A and first axis of B
                    // Processing 4 values at a time, loop unrolled by 4,
                    // we get
                    for (int k = 0; k < n - remainder_vec; k += 16) {
                        auto avec = _mm256_loadu_pd(a + (i * n + k));

                        auto bvec00 = _mm256_loadu_pd(tb + (j * n + k));
                        auto bvec01 = _mm256_loadu_pd(tb + (j * n + k + 4));
                        auto bvec02 = _mm256_loadu_pd(tb + (j * n + k + 8));
                        auto bvec03 = _mm256_loadu_pd(tb + (j * n + k + 12));

                        auto bvec10 = _mm256_loadu_pd(tb + ((j + 1) * n + k));
                        auto bvec11 =
                            _mm256_loadu_pd(tb + ((j + 1) * n + k + 4));
                        auto bvec12 =
                            _mm256_loadu_pd(tb + ((j + 1) * n + k + 8));
                        auto bvec13 =
                            _mm256_loadu_pd(tb + ((j + 1) * n + k + 12));

                        auto bvec20 = _mm256_loadu_pd(tb + ((j + 2) * n + k));
                        auto bvec21 =
                            _mm256_loadu_pd(tb + ((j + 2) * n + k + 8));
                        auto bvec22 =
                            _mm256_loadu_pd(tb + ((j + 2) * n + k + 4));
                        auto bvec23 =
                            _mm256_loadu_pd(tb + ((j + 2) * n + k + 12));

                        auto bvec30 = _mm256_loadu_pd(tb + ((j + 3) * n + k));
                        auto bvec31 =
                            _mm256_loadu_pd(tb + ((j + 3) * n + k + 4));
                        auto bvec32 =
                            _mm256_loadu_pd(tb + ((j + 3) * n + k + 8));
                        auto bvec33 =
                            _mm256_loadu_pd(tb + ((j + 3) * n + k + 12));

                        acc00 = _mm256_fmadd_pd(avec, bvec00, acc00);
                        acc01 = _mm256_fmadd_pd(avec, bvec10, acc01);
                        acc02 = _mm256_fmadd_pd(avec, bvec20, acc02);
                        acc03 = _mm256_fmadd_pd(avec, bvec30, acc03);

                        avec = _mm256_loadu_pd(a + (i * n + k + 4));

                        acc00 = _mm256_fmadd_pd(avec, bvec01, acc00);
                        acc01 = _mm256_fmadd_pd(avec, bvec11, acc01);
                        acc02 = _mm256_fmadd_pd(avec, bvec21, acc02);
                        acc03 = _mm256_fmadd_pd(avec, bvec31, acc03);

                        avec = _mm256_loadu_pd(a + (i * n + k + 8));

                        acc00 = _mm256_fmadd_pd(avec, bvec02, acc00);
                        acc01 = _mm256_fmadd_pd(avec, bvec12, acc01);
                        acc02 = _mm256_fmadd_pd(avec, bvec22, acc02);
                        acc03 = _mm256_fmadd_pd(avec, bvec32, acc03);

                        avec = _mm256_loadu_pd(a + (i * n + k + 12));

                        acc00 = _mm256_fmadd_pd(avec, bvec03, acc00);
                        acc01 = _mm256_fmadd_pd(avec, bvec13, acc01);
                        acc02 = _mm256_fmadd_pd(avec, bvec23, acc02);
                        acc03 = _mm256_fmadd_pd(avec, bvec33, acc03);

                        /////////////////////////////////////////////////////////////////

                        avec = _mm256_loadu_pd(a + ((i + 1) * n + k + 12));

                        acc10 = _mm256_fmadd_pd(avec, bvec03, acc10);
                        acc11 = _mm256_fmadd_pd(avec, bvec13, acc11);
                        acc12 = _mm256_fmadd_pd(avec, bvec23, acc12);
                        acc13 = _mm256_fmadd_pd(avec, bvec33, acc13);

                        avec = _mm256_loadu_pd(a + ((i + 1) * n + k));

                        acc10 = _mm256_fmadd_pd(avec, bvec00, acc10);
                        acc11 = _mm256_fmadd_pd(avec, bvec10, acc11);
                        acc12 = _mm256_fmadd_pd(avec, bvec20, acc12);
                        acc13 = _mm256_fmadd_pd(avec, bvec30, acc13);

                        avec = _mm256_loadu_pd(a + ((i + 1) * n + k + 4));

                        acc10 = _mm256_fmadd_pd(avec, bvec01, acc10);
                        acc11 = _mm256_fmadd_pd(avec, bvec11, acc11);
                        acc12 = _mm256_fmadd_pd(avec, bvec21, acc12);
                        acc13 = _mm256_fmadd_pd(avec, bvec31, acc13);

                        avec = _mm256_loadu_pd(a + ((i + 1) * n + k + 8));

                        acc10 = _mm256_fmadd_pd(avec, bvec02, acc10);
                        acc11 = _mm256_fmadd_pd(avec, bvec12, acc11);
                        acc12 = _mm256_fmadd_pd(avec, bvec22, acc12);
                        acc13 = _mm256_fmadd_pd(avec, bvec32, acc13);

                        ///////////////////////////////////////////////////////////////////

                        avec = _mm256_loadu_pd(a + ((i + 2) * n + k + 8));

                        acc20 = _mm256_fmadd_pd(avec, bvec02, acc20);
                        acc21 = _mm256_fmadd_pd(avec, bvec12, acc21);
                        acc22 = _mm256_fmadd_pd(avec, bvec22, acc22);
                        acc23 = _mm256_fmadd_pd(avec, bvec32, acc23);

                        avec = _mm256_loadu_pd(a + ((i + 2) * n + k + 12));

                        acc20 = _mm256_fmadd_pd(avec, bvec03, acc20);
                        acc21 = _mm256_fmadd_pd(avec, bvec13, acc21);
                        acc22 = _mm256_fmadd_pd(avec, bvec23, acc22);
                        acc23 = _mm256_fmadd_pd(avec, bvec33, acc23);

                        avec = _mm256_loadu_pd(a + ((i + 2) * n + k));

                        acc20 = _mm256_fmadd_pd(avec, bvec00, acc20);
                        acc21 = _mm256_fmadd_pd(avec, bvec10, acc21);
                        acc22 = _mm256_fmadd_pd(avec, bvec20, acc22);
                        acc23 = _mm256_fmadd_pd(avec, bvec30, acc23);

                        avec = _mm256_loadu_pd(a + ((i + 2) * n + k + 4));

                        acc20 = _mm256_fmadd_pd(avec, bvec01, acc20);
                        acc21 = _mm256_fmadd_pd(avec, bvec11, acc21);
                        acc22 = _mm256_fmadd_pd(avec, bvec21, acc22);
                        acc23 = _mm256_fmadd_pd(avec, bvec31, acc23);

                        /////////////////////////////////////////////////////////////

                        avec = _mm256_loadu_pd(a + ((i + 3) * n + k + 4));

                        acc30 = _mm256_fmadd_pd(avec, bvec01, acc30);
                        acc31 = _mm256_fmadd_pd(avec, bvec11, acc31);
                        acc32 = _mm256_fmadd_pd(avec, bvec21, acc32);
                        acc33 = _mm256_fmadd_pd(avec, bvec31, acc33);

                        avec = _mm256_loadu_pd(a + ((i + 3) * n + k + 8));

                        acc30 = _mm256_fmadd_pd(avec, bvec02, acc30);
                        acc31 = _mm256_fmadd_pd(avec, bvec12, acc31);
                        acc32 = _mm256_fmadd_pd(avec, bvec22, acc32);
                        acc33 = _mm256_fmadd_pd(avec, bvec32, acc33);

                        avec = _mm256_loadu_pd(a + ((i + 3) * n + k + 12));

                        acc30 = _mm256_fmadd_pd(avec, bvec03, acc30);
                        acc31 = _mm256_fmadd_pd(avec, bvec13, acc31);
                        acc32 = _mm256_fmadd_pd(avec, bvec23, acc32);
                        acc33 = _mm256_fmadd_pd(avec, bvec33, acc33);

                        avec = _mm256_loadu_pd(a + ((i + 3) * n + k));

                        acc30 = _mm256_fmadd_pd(avec, bvec00, acc30);
                        acc31 = _mm256_fmadd_pd(avec, bvec10, acc31);
                        acc32 = _mm256_fmadd_pd(avec, bvec20, acc32);
                        acc33 = _mm256_fmadd_pd(avec, bvec30, acc33);
                    }

                    for (int k = n - remainder_vec; k < n; ++k) {
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

                    double ans[4] = {0, 0, 0, 0};
                    auto dd = _mm256_hadd_pd(acc00, acc01);
                    _mm256_store_pd(ans, dd);
                    c[i * p + j] += ans[0] + ans[2];
                    c[i * p + j + 1] += ans[1] + ans[3];
                    dd = _mm256_hadd_pd(acc02, acc03);
                    _mm256_store_pd(ans, dd);
                    c[i * p + j + 2] += ans[0] + ans[2];
                    c[i * p + j + 3] += ans[1] + ans[3];

                    dd = _mm256_hadd_pd(acc10, acc11);
                    _mm256_store_pd(ans, dd);
                    c[(i + 1) * p + j] += ans[0] + ans[2];
                    c[(i + 1) * p + j + 1] += ans[1] + ans[3];
                    dd = _mm256_hadd_pd(acc12, acc13);
                    _mm256_store_pd(ans, dd);
                    c[(i + 1) * p + j + 2] += ans[0] + ans[2];
                    c[(i + 1) * p + j + 3] += ans[1] + ans[3];

                    dd = _mm256_hadd_pd(acc20, acc21);
                    _mm256_store_pd(ans, dd);
                    c[(i + 2) * p + j] += ans[0] + ans[2];
                    c[(i + 2) * p + j + 1] += ans[1] + ans[3];
                    dd = _mm256_hadd_pd(acc22, acc23);
                    _mm256_store_pd(ans, dd);
                    c[(i + 2) * p + j + 2] += ans[0] + ans[2];
                    c[(i + 2) * p + j + 3] += ans[1] + ans[3];

                    dd = _mm256_hadd_pd(acc30, acc31);
                    _mm256_store_pd(ans, dd);
                    c[(i + 3) * p + j] += ans[0] + ans[2];
                    c[(i + 3) * p + j + 1] += ans[1] + ans[3];
                    dd = _mm256_hadd_pd(acc32, acc33);
                    _mm256_store_pd(ans, dd);
                    c[(i + 3) * p + j + 2] += ans[0] + ans[2];
                    c[(i + 3) * p + j + 3] += ans[1] + ans[3];
                }
                for (int j = p - remainder_cols; j < p; ++j) {
                    double ans0 = 0;
                    double ans1 = 0;
                    double ans2 = 0;
                    double ans3 = 0;
                    for (int k = 0; k < n; ++k) {
                        ans0 += a[i * n + k] * tb[j * n + k];
                        ans1 += a[(i + 1) * n + k] * tb[j * n + k];
                        ans2 += a[(i + 2) * n + k] * tb[j * n + k];
                        ans3 += a[(i + 3) * n + k] * tb[j * n + k];
                    }
                    c[i * p + j] = ans0;
                    c[(i + 1) * p + j] = ans1;
                    c[(i + 2) * p + j] = ans2;
                    c[(i + 3) * p + j] = ans3;
                }
            }
        }
    }
    for (int i = m - remainder_rows; i < m; ++i) {
        for (int j = 0; j < p; ++j) {
            double ans = 0;
            for (int k = 0; k < n; ++k) {
                ans += a[i * n + k] * tb[j * n + k];
            }
            c[i * p + j] = ans;
        }
    }
}

#endif
