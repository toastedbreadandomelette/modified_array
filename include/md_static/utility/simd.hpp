#pragma once
#ifndef _SIMD_HPP_
#define _SIMD_HPP_

#include <immintrin.h>

#include <initializer_list>

#include "./math.hpp"

typedef __m256 f32x8;
typedef __m256d f64x4;
typedef __m256i i32x8;
typedef __m256i i64x4;
typedef __m128 f32x4;
typedef __m128d f64x2;
typedef __m128i i32x4;
typedef __m128i i64x2;

namespace F32x8 {
__always_inline f32x8 add(f32x8 first, f32x8 second) {
    return _mm256_add_ps(first, second);
}

__always_inline f32x8 sub(f32x8 first, f32x8 second) {
    return _mm256_sub_ps(first, second);
}

__always_inline f32x8 mul(f32x8 first, f32x8 second) {
    return _mm256_mul_ps(first, second);
}

__always_inline f32x8 div(f32x8 first, f32x8 second) {
    return _mm256_div_ps(first, second);
}

__always_inline f32x8 fmadd(f32x8 a, f32x8 b, f32x8 c) {
    return _mm256_fmadd_ps(a, b, c);
}

__always_inline f32x8 uni(f32 val) { return _mm256_set1_ps(val); }

__always_inline f32x8 set(f32 a, f32 b, f32 c, f32 d, f32 e, f32 f, f32 g,
                          f32 h) {
    return _mm256_set_ps(a, b, c, d, e, f, g, h);
}

__always_inline f32x8 zero() { return _mm256_setzero_ps(); }

__always_inline f32x8 fromptr(f32 *val) { return _mm256_loadu_ps(val); }

__always_inline void storeptr(f32 *val, f32x8 vec) {
    _mm256_storeu_ps(val, vec);
}

__always_inline f32 reduce_sum(f32x8 val) {
    f32 ans[8] = {0, 0, 0, 0, 0, 0, 0, 0};
    storeptr(ans, val);
    return ans[0] + ans[1] + ans[2] + ans[3] + ans[4] + ans[5] + ans[6] +
           ans[7];
}

}  // namespace F32x8

namespace F64x4 {
__always_inline f64x4 add(f64x4 first, f64x4 second) {
    return _mm256_add_pd(first, second);
}

__always_inline f64x4 sub(f64x4 first, f64x4 second) {
    return _mm256_sub_pd(first, second);
}

__always_inline f64x4 mul(f64x4 first, f64x4 second) {
    return _mm256_mul_pd(first, second);
}

__always_inline f64x4 div(f64x4 first, f64x4 second) {
    return _mm256_div_pd(first, second);
}

__always_inline f64x4 fmadd(f64x4 a, f64x4 b, f64x4 c) {
    return _mm256_fmadd_pd(a, b, c);
}

__always_inline f64x4 uni(f64 val) { return _mm256_set1_pd(val); }

__always_inline f64x4 set(f64 a, f64 b, f64 c, f64 d) {
    return _mm256_set_pd(a, b, c, d);
}

__always_inline f64x4 zero() { return _mm256_setzero_pd(); }

__always_inline f64x4 fromptr(f64 *val) { return _mm256_loadu_pd(val); }

__always_inline void storeptr(f64 *val, f64x4 vec) {
    _mm256_storeu_pd(val, vec);
}

__always_inline f64 reduce_sum(f64x4 val) {
    f64 ans[4] = {0, 0, 0, 0};
    storeptr(ans, val);
    return ans[0] + ans[1] + ans[2] + ans[3];
}
}  // namespace F64x4

namespace F32x4 {
__always_inline f32x4 add(f32x4 first, f32x4 second) {
    return _mm_add_ps(first, second);
}

__always_inline f32x4 sub(f32x4 first, f32x4 second) {
    return _mm_sub_ps(first, second);
}

__always_inline f32x4 mul(f32x4 first, f32x4 second) {
    return _mm_mul_ps(first, second);
}

__always_inline f32x4 div(f32x4 first, f32x4 second) {
    return _mm_div_ps(first, second);
}

__always_inline f32x4 fmadd(f32x4 a, f32x4 b, f32x4 c) {
    return _mm_fmadd_ps(a, b, c);
}

__always_inline f32x4 uni(f64 val) { return _mm_set1_ps(val); }

__always_inline f32x4 set(f32 a, f32 b, f32 c, f32 d) {
    return _mm_set_ps(a, b, c, d);
}

__always_inline f32x4 zero() { return _mm_setzero_ps(); }

__always_inline f32x4 fromptr(f32 *val) { return _mm_loadu_ps(val); }

__always_inline void storeptr(f32 *val, f32x4 vec) { _mm_storeu_ps(val, vec); }

__always_inline f32 reduce_sum(f32x4 val) {
    f32 ans[4] = {0, 0, 0, 0};
    storeptr(ans, val);
    return ans[0] + ans[1] + ans[2] + ans[3];
}
}  // namespace F32x4

namespace F64x2 {
__always_inline f64x2 add(f64x2 first, f64x2 second) {
    return _mm_add_pd(first, second);
}

__always_inline f64x2 sub(f64x2 first, f64x2 second) {
    return _mm_sub_pd(first, second);
}

__always_inline f64x2 mul(f64x2 first, f64x2 second) {
    return _mm_mul_pd(first, second);
}

__always_inline f64x2 div(f64x2 first, f64x2 second) {
    return _mm_div_pd(first, second);
}

__always_inline f64x2 fmadd(f64x2 a, f64x2 b, f64x2 c) {
    return _mm_fmadd_pd(a, b, c);
}

__always_inline f64x2 uni(f64 val) { return _mm_set1_pd(val); }

__always_inline f64x2 set(f64 a, f64 b) { return _mm_set_pd(a, b); }

__always_inline f64x2 zero() { return _mm_setzero_pd(); }

__always_inline f64x2 fromptr(f64 *val) { return _mm_loadu_pd(val); }

__always_inline void storeptr(f64 *val, f64x2 vec) { _mm_storeu_pd(val, vec); }

__always_inline f64 reduce_sum(f64x2 val) {
    f64 ans[2] = {0, 0};
    storeptr(ans, val);
    return ans[0] + ans[1];
}
}  // namespace F64x2

#endif
