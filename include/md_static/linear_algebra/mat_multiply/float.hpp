#pragma once
#ifndef _MAT_MULTIPLY_FLOAT_HPP_
#define _MAT_MULTIPLY_FLOAT_HPP_

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
void mul_st_f32(float *a, float *tb, float *c, int m, int n, int p) {
    int rem = (m * p) & 7;

    // Initialize vector to zero
    for (size_t index = 0; index < m * p - rem; index += 8) {
        _mm256_store_ps(c + index, _mm256_setzero_ps());
    }

    // Set remainder values to zero as well
    for (size_t index = m * p - rem; index < m * p; ++index) {
        c[index] = 0;
    }

    const int block_size = 256;
    const int remainder_cols = p & 3;
    const int remainder_rows = m & 3;
    const int remainder_vec = n & 31;

    // Compute block by block=
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
                    __m256 acc00 = _mm256_setzero_ps();
                    __m256 acc01 = _mm256_setzero_ps();
                    __m256 acc02 = _mm256_setzero_ps();
                    __m256 acc03 = _mm256_setzero_ps();

                    __m256 acc10 = _mm256_setzero_ps();
                    __m256 acc11 = _mm256_setzero_ps();
                    __m256 acc12 = _mm256_setzero_ps();
                    __m256 acc13 = _mm256_setzero_ps();

                    __m256 acc20 = _mm256_setzero_ps();
                    __m256 acc21 = _mm256_setzero_ps();
                    __m256 acc22 = _mm256_setzero_ps();
                    __m256 acc23 = _mm256_setzero_ps();

                    __m256 acc30 = _mm256_setzero_ps();
                    __m256 acc31 = _mm256_setzero_ps();
                    __m256 acc32 = _mm256_setzero_ps();
                    __m256 acc33 = _mm256_setzero_ps();

                    // Loop over second axis of A and first axis of B
                    // Processing 8 values at a time, loop unrolled by 4,
                    // we get
                    for (int k = 0; k < n - remainder_vec; k += 32) {
                        auto avec = _mm256_loadu_ps(a + (i * n + k));

                        auto bvec00 = _mm256_loadu_ps(tb + (j * n + k));
                        auto bvec01 = _mm256_loadu_ps(tb + (j * n + k + 8));
                        auto bvec02 = _mm256_loadu_ps(tb + (j * n + k + 16));
                        auto bvec03 = _mm256_loadu_ps(tb + (j * n + k + 24));

                        auto bvec10 = _mm256_loadu_ps(tb + ((j + 1) * n + k));
                        auto bvec11 =
                            _mm256_loadu_ps(tb + ((j + 1) * n + k + 8));
                        auto bvec12 =
                            _mm256_loadu_ps(tb + ((j + 1) * n + k + 16));
                        auto bvec13 =
                            _mm256_loadu_ps(tb + ((j + 1) * n + k + 24));

                        auto bvec20 = _mm256_loadu_ps(tb + ((j + 2) * n + k));
                        auto bvec21 =
                            _mm256_loadu_ps(tb + ((j + 2) * n + k + 16));
                        auto bvec22 =
                            _mm256_loadu_ps(tb + ((j + 2) * n + k + 8));
                        auto bvec23 =
                            _mm256_loadu_ps(tb + ((j + 2) * n + k + 24));

                        auto bvec30 = _mm256_loadu_ps(tb + ((j + 3) * n + k));
                        auto bvec31 =
                            _mm256_loadu_ps(tb + ((j + 3) * n + k + 8));
                        auto bvec32 =
                            _mm256_loadu_ps(tb + ((j + 3) * n + k + 16));
                        auto bvec33 =
                            _mm256_loadu_ps(tb + ((j + 3) * n + k + 24));

                        acc00 = _mm256_fmadd_ps(avec, bvec00, acc00);
                        acc01 = _mm256_fmadd_ps(avec, bvec10, acc01);
                        acc02 = _mm256_fmadd_ps(avec, bvec20, acc02);
                        acc03 = _mm256_fmadd_ps(avec, bvec30, acc03);

                        avec = _mm256_loadu_ps(a + (i * n + k + 8));

                        acc00 = _mm256_fmadd_ps(avec, bvec01, acc00);
                        acc01 = _mm256_fmadd_ps(avec, bvec11, acc01);
                        acc02 = _mm256_fmadd_ps(avec, bvec21, acc02);
                        acc03 = _mm256_fmadd_ps(avec, bvec31, acc03);

                        avec = _mm256_loadu_ps(a + (i * n + k + 16));

                        acc00 = _mm256_fmadd_ps(avec, bvec02, acc00);
                        acc01 = _mm256_fmadd_ps(avec, bvec12, acc01);
                        acc02 = _mm256_fmadd_ps(avec, bvec22, acc02);
                        acc03 = _mm256_fmadd_ps(avec, bvec32, acc03);

                        avec = _mm256_loadu_ps(a + (i * n + k + 24));

                        acc00 = _mm256_fmadd_ps(avec, bvec03, acc00);
                        acc01 = _mm256_fmadd_ps(avec, bvec13, acc01);
                        acc02 = _mm256_fmadd_ps(avec, bvec23, acc02);
                        acc03 = _mm256_fmadd_ps(avec, bvec33, acc03);

                        /////////////////////////////////////////////////////////////////

                        avec = _mm256_loadu_ps(a + ((i + 1) * n + k + 24));

                        acc10 = _mm256_fmadd_ps(avec, bvec03, acc10);
                        acc11 = _mm256_fmadd_ps(avec, bvec13, acc11);
                        acc12 = _mm256_fmadd_ps(avec, bvec23, acc12);
                        acc13 = _mm256_fmadd_ps(avec, bvec33, acc13);

                        avec = _mm256_loadu_ps(a + ((i + 1) * n + k));

                        acc10 = _mm256_fmadd_ps(avec, bvec00, acc10);
                        acc11 = _mm256_fmadd_ps(avec, bvec10, acc11);
                        acc12 = _mm256_fmadd_ps(avec, bvec20, acc12);
                        acc13 = _mm256_fmadd_ps(avec, bvec30, acc13);

                        avec = _mm256_loadu_ps(a + ((i + 1) * n + k + 8));

                        acc10 = _mm256_fmadd_ps(avec, bvec01, acc10);
                        acc11 = _mm256_fmadd_ps(avec, bvec11, acc11);
                        acc12 = _mm256_fmadd_ps(avec, bvec21, acc12);
                        acc13 = _mm256_fmadd_ps(avec, bvec31, acc13);

                        avec = _mm256_loadu_ps(a + ((i + 1) * n + k + 16));

                        acc10 = _mm256_fmadd_ps(avec, bvec02, acc10);
                        acc11 = _mm256_fmadd_ps(avec, bvec12, acc11);
                        acc12 = _mm256_fmadd_ps(avec, bvec22, acc12);
                        acc13 = _mm256_fmadd_ps(avec, bvec32, acc13);

                        ///////////////////////////////////////////////////////////////////

                        avec = _mm256_loadu_ps(a + ((i + 2) * n + k + 16));

                        acc20 = _mm256_fmadd_ps(avec, bvec02, acc20);
                        acc21 = _mm256_fmadd_ps(avec, bvec12, acc21);
                        acc22 = _mm256_fmadd_ps(avec, bvec22, acc22);
                        acc23 = _mm256_fmadd_ps(avec, bvec32, acc23);

                        avec = _mm256_loadu_ps(a + ((i + 2) * n + k + 24));

                        acc20 = _mm256_fmadd_ps(avec, bvec03, acc20);
                        acc21 = _mm256_fmadd_ps(avec, bvec13, acc21);
                        acc22 = _mm256_fmadd_ps(avec, bvec23, acc22);
                        acc23 = _mm256_fmadd_ps(avec, bvec33, acc23);

                        avec = _mm256_loadu_ps(a + ((i + 2) * n + k));

                        acc20 = _mm256_fmadd_ps(avec, bvec00, acc20);
                        acc21 = _mm256_fmadd_ps(avec, bvec10, acc21);
                        acc22 = _mm256_fmadd_ps(avec, bvec20, acc22);
                        acc23 = _mm256_fmadd_ps(avec, bvec30, acc23);

                        avec = _mm256_loadu_ps(a + ((i + 2) * n + k + 8));

                        acc20 = _mm256_fmadd_ps(avec, bvec01, acc20);
                        acc21 = _mm256_fmadd_ps(avec, bvec11, acc21);
                        acc22 = _mm256_fmadd_ps(avec, bvec21, acc22);
                        acc23 = _mm256_fmadd_ps(avec, bvec31, acc23);

                        /////////////////////////////////////////////////////////////

                        avec = _mm256_loadu_ps(a + ((i + 3) * n + k + 8));

                        acc30 = _mm256_fmadd_ps(avec, bvec01, acc30);
                        acc31 = _mm256_fmadd_ps(avec, bvec11, acc31);
                        acc32 = _mm256_fmadd_ps(avec, bvec21, acc32);
                        acc33 = _mm256_fmadd_ps(avec, bvec31, acc33);

                        avec = _mm256_loadu_ps(a + ((i + 3) * n + k + 16));

                        acc30 = _mm256_fmadd_ps(avec, bvec02, acc30);
                        acc31 = _mm256_fmadd_ps(avec, bvec12, acc31);
                        acc32 = _mm256_fmadd_ps(avec, bvec22, acc32);
                        acc33 = _mm256_fmadd_ps(avec, bvec32, acc33);

                        avec = _mm256_loadu_ps(a + ((i + 3) * n + k + 24));

                        acc30 = _mm256_fmadd_ps(avec, bvec03, acc30);
                        acc31 = _mm256_fmadd_ps(avec, bvec13, acc31);
                        acc32 = _mm256_fmadd_ps(avec, bvec23, acc32);
                        acc33 = _mm256_fmadd_ps(avec, bvec33, acc33);

                        avec = _mm256_loadu_ps(a + ((i + 3) * n + k));

                        acc30 = _mm256_fmadd_ps(avec, bvec00, acc30);
                        acc31 = _mm256_fmadd_ps(avec, bvec10, acc31);
                        acc32 = _mm256_fmadd_ps(avec, bvec20, acc32);
                        acc33 = _mm256_fmadd_ps(avec, bvec30, acc33);
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

                    float ans[8] = {0, 0, 0, 0, 0, 0, 0, 0};
                    _mm256_store_ps(ans, acc00);
                    c[i * p + j] += ans[0] + ans[1] + ans[2] + ans[3] + ans[4] +
                                    ans[5] + ans[6] + ans[7];
                    _mm256_store_ps(ans, acc01);
                    c[i * p + j + 1] += ans[0] + ans[1] + ans[2] + ans[3] +
                                        ans[4] + ans[5] + ans[6] + ans[7];
                    _mm256_store_ps(ans, acc02);
                    c[i * p + j + 2] += ans[0] + ans[1] + ans[2] + ans[3] +
                                        ans[4] + ans[5] + ans[6] + ans[7];
                    _mm256_store_ps(ans, acc03);
                    c[i * p + j + 3] += ans[0] + ans[1] + ans[2] + ans[3] +
                                        ans[4] + ans[5] + ans[6] + ans[7];

                    _mm256_store_ps(ans, acc10);
                    c[(i + 1) * p + j] += ans[0] + ans[1] + ans[2] + ans[3] +
                                          ans[4] + ans[5] + ans[6] + ans[7];
                    _mm256_store_ps(ans, acc11);
                    c[(i + 1) * p + j + 1] += ans[0] + ans[1] + ans[2] +
                                              ans[3] + ans[4] + ans[5] +
                                              ans[6] + ans[7];
                    _mm256_store_ps(ans, acc12);
                    c[(i + 1) * p + j + 2] += ans[0] + ans[1] + ans[2] +
                                              ans[3] + ans[4] + ans[5] +
                                              ans[6] + ans[7];
                    _mm256_store_ps(ans, acc13);
                    c[(i + 1) * p + j + 3] += ans[0] + ans[1] + ans[2] +
                                              ans[3] + ans[4] + ans[5] +
                                              ans[6] + ans[7];

                    _mm256_store_ps(ans, acc20);
                    c[(i + 2) * p + j] += ans[0] + ans[1] + ans[2] + ans[3] +
                                          ans[4] + ans[5] + ans[6] + ans[7];
                    _mm256_store_ps(ans, acc21);
                    c[(i + 2) * p + j + 1] += ans[0] + ans[1] + ans[2] +
                                              ans[3] + ans[4] + ans[5] +
                                              ans[6] + ans[7];
                    _mm256_store_ps(ans, acc22);
                    c[(i + 2) * p + j + 2] += ans[0] + ans[1] + ans[2] +
                                              ans[3] + ans[4] + ans[5] +
                                              ans[6] + ans[7];
                    _mm256_store_ps(ans, acc23);
                    c[(i + 2) * p + j + 3] += ans[0] + ans[1] + ans[2] +
                                              ans[3] + ans[4] + ans[5] +
                                              ans[6] + ans[7];

                    _mm256_store_ps(ans, acc30);
                    c[(i + 3) * p + j] += ans[0] + ans[1] + ans[2] + ans[3] +
                                          ans[4] + ans[5] + ans[6] + ans[7];
                    _mm256_store_ps(ans, acc31);
                    c[(i + 3) * p + j + 1] += ans[0] + ans[1] + ans[2] +
                                              ans[3] + ans[4] + ans[5] +
                                              ans[6] + ans[7];
                    _mm256_store_ps(ans, acc32);
                    c[(i + 3) * p + j + 2] += ans[0] + ans[1] + ans[2] +
                                              ans[3] + ans[4] + ans[5] +
                                              ans[6] + ans[7];
                    _mm256_store_ps(ans, acc33);
                    c[(i + 3) * p + j + 3] += ans[0] + ans[1] + ans[2] +
                                              ans[3] + ans[4] + ans[5] +
                                              ans[6] + ans[7];
                }
                for (int j = p - remainder_cols; j < p; ++j) {
                    float ans0 = 0;
                    float ans1 = 0;
                    float ans2 = 0;
                    float ans3 = 0;
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
            float ans = 0;
            for (int k = 0; k < n; ++k) {
                ans += a[i * n + k] * tb[j * n + k];
            }
            c[i * p + j] = ans;
        }
    }
}

#endif
