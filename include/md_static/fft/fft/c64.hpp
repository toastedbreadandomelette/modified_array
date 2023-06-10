#pragma once
#ifndef __FFT_COMPLEX64_HPP__
#define __FFT_COMPLEX64_HPP__

#include "../../../utility/math.hpp"
#include "../../../utility/simd.hpp"
#include "../../functions/range.hpp"
#include "../md_fft.hpp"

void dft_subarray(c64 *array, i32 start, i32 end, c64 *dest) {
    const usize n = end - start;

    c64x2 accumulator = C64x2::zero();

    i32 rem = (end - start) & 7;

    for (usize i = start; i < (end - rem); i += 8) {
        f64x4 acc = C64x2::fromptr(array + i);
        accumulator = C64x2::add(accumulator, acc);

        acc = C64x2::fromptr(array + i + 2);
        accumulator = C64x2::add(accumulator, acc);

        acc = C64x2::fromptr(array + i + 4);
        accumulator = C64x2::add(accumulator, acc);

        acc = C64x2::fromptr(array + i + 6);
        accumulator = C64x2::add(accumulator, acc);
    }

    for (i32 i = (end - rem); i < end; ++i) {
        dest[0] += array[i];
    }

    dest[0] += C64x2::reduce_sum(accumulator);

    f64 angle = Math::pi_2 / n;
    c64 wlen = c64(::cos(angle), -::sin(angle));
    c64 wlen2 = wlen * wlen;
    c64 wlen4 = wlen2 * wlen2;

    c64 wstart = wlen;
    rem = (end - start) & 7;
    c64 buffer[2];
    for (usize index = 1; index < n; index += 4) {
        c64 wstart1 = wstart;
        c64 wstart2 = wstart1 * wlen;
        c64 wstart3 = wstart2 * wlen;
        c64 wstart4 = wstart3 * wlen;

        c64x2 ws0 = C64x2::set(c64(1, 0), wstart1);
        c64x2 ws1 = C64x2::set(c64(1, 0), wstart2);
        c64x2 ws2 = C64x2::set(c64(1, 0), wstart3);
        c64x2 ws3 = C64x2::set(c64(1, 0), wstart4);

        c64x2 wsstart0 = C64x2::set(wstart1 * wstart1, wstart1 * wstart1);
        c64x2 wsstart1 = C64x2::set(wstart2 * wstart2, wstart2 * wstart2);
        c64x2 wsstart2 = C64x2::set(wstart3 * wstart3, wstart3 * wstart3);
        c64x2 wsstart3 = C64x2::set(wstart4 * wstart4, wstart4 * wstart4);

        c64x2 accumulator0 = C64x2::zero();
        c64x2 accumulator1 = C64x2::zero();
        c64x2 accumulator2 = C64x2::zero();
        c64x2 accumulator3 = C64x2::zero();

        for (usize i = start; i < (end - rem); i += 8) {
            c64x2 acc = C64x2::set(array[i], array[i + 1]);
            accumulator0 = C64x2::add(accumulator0, C64x2::mul(acc, ws0));
            accumulator1 = C64x2::add(accumulator1, C64x2::mul(acc, ws1));
            accumulator2 = C64x2::add(accumulator2, C64x2::mul(acc, ws2));
            accumulator3 = C64x2::add(accumulator3, C64x2::mul(acc, ws3));
            ws0 = C64x2::mul(ws0, wsstart0);
            ws1 = C64x2::mul(ws1, wsstart1);
            ws2 = C64x2::mul(ws2, wsstart2);
            ws3 = C64x2::mul(ws3, wsstart3);

            acc = C64x2::set(array[i + 2], array[i + 3]);
            accumulator0 = C64x2::add(accumulator0, C64x2::mul(acc, ws0));
            accumulator1 = C64x2::add(accumulator1, C64x2::mul(acc, ws1));
            accumulator2 = C64x2::add(accumulator2, C64x2::mul(acc, ws2));
            accumulator3 = C64x2::add(accumulator3, C64x2::mul(acc, ws3));
            ws0 = C64x2::mul(ws0, wsstart0);
            ws1 = C64x2::mul(ws1, wsstart1);
            ws2 = C64x2::mul(ws2, wsstart2);
            ws3 = C64x2::mul(ws3, wsstart3);

            acc = C64x2::set(array[i + 4], array[i + 5]);
            accumulator0 = C64x2::add(accumulator0, C64x2::mul(acc, ws0));
            accumulator1 = C64x2::add(accumulator1, C64x2::mul(acc, ws1));
            accumulator2 = C64x2::add(accumulator2, C64x2::mul(acc, ws2));
            accumulator3 = C64x2::add(accumulator3, C64x2::mul(acc, ws3));
            ws0 = C64x2::mul(ws0, wsstart0);
            ws1 = C64x2::mul(ws1, wsstart1);
            ws2 = C64x2::mul(ws2, wsstart2);
            ws3 = C64x2::mul(ws3, wsstart3);

            acc = C64x2::set(array[i + 6], array[i + 7]);
            accumulator0 = C64x2::add(accumulator0, C64x2::mul(acc, ws0));
            accumulator1 = C64x2::add(accumulator1, C64x2::mul(acc, ws1));
            accumulator2 = C64x2::add(accumulator2, C64x2::mul(acc, ws2));
            accumulator3 = C64x2::add(accumulator3, C64x2::mul(acc, ws3));
            ws0 = C64x2::mul(ws0, wsstart0);
            ws1 = C64x2::mul(ws1, wsstart1);
            ws2 = C64x2::mul(ws2, wsstart2);
            ws3 = C64x2::mul(ws3, wsstart3);
        }
        C64x2::storeptr(buffer, ws0);
        c64 w0 = buffer[0];
        C64x2::storeptr(buffer, ws1);
        c64 w1 = buffer[0];
        C64x2::storeptr(buffer, ws2);
        c64 w2 = buffer[0];
        C64x2::storeptr(buffer, ws3);
        c64 w3 = buffer[0];

        for (i32 i = (end - rem); i < end; ++i) {
            dest[index] += array[i] * w0;
            w0 *= wstart1;
            dest[index + 1] += array[i] * w1;
            w1 *= wstart2;
            dest[index + 2] += array[i] * w2;
            w2 *= wstart3;
            dest[index + 3] += array[i] * w3;
            w3 *= wstart4;
        }

        wstart *= wlen4;

        dest[index] += C64x2::reduce_sum(accumulator0);
        dest[index + 1] += C64x2::reduce_sum(accumulator1);
        dest[index + 2] += C64x2::reduce_sum(accumulator2);
        dest[index + 3] += C64x2::reduce_sum(accumulator3);
    }
}

void dft_subarray_inplace(c64 *array, i32 start, i32 end) {
    const usize n = end - start;
    c64 *dest = aligned_allocate<c64>(64, n);
    c64x2 accumulator = C64x2::zero();

    i32 rem = (end - start) & 7;

    for (usize i = start; i < (end - rem); i += 8) {
        f64x4 acc = C64x2::fromptr(array + i);
        accumulator = C64x2::add(accumulator, acc);

        acc = C64x2::fromptr(array + i + 2);
        accumulator = C64x2::add(accumulator, acc);

        acc = C64x2::fromptr(array + i + 4);
        accumulator = C64x2::add(accumulator, acc);

        acc = C64x2::fromptr(array + i + 6);
        accumulator = C64x2::add(accumulator, acc);
    }

    for (i32 i = (end - rem); i < end; ++i) {
        dest[0] += array[i];
    }

    dest[0] += C64x2::reduce_sum(accumulator);

    f64 angle = Math::pi_2 / n;
    c64 wlen = c64(::cos(angle), -::sin(angle));
    c64 wlen2 = wlen * wlen;
    c64 wlen4 = wlen2 * wlen2;

    c64 wstart = wlen;
    rem = (end - start) & 7;
    c64 buffer[2];
    c64 nrem = (n - 1) & 3;
    c64 wstart1, wstart2, wstart3, wstart4;
    c64 w0, w1, w2, w3;
    for (usize index = 1; index < (n - nrem); index += 4) {
        wstart1 = wstart;
        wstart2 = wstart1 * wlen;
        wstart3 = wstart2 * wlen;
        wstart4 = wstart3 * wlen;

        c64x2 ws0 = C64x2::set(c64(1, 0), wstart1);
        c64x2 ws1 = C64x2::set(c64(1, 0), wstart2);
        c64x2 ws2 = C64x2::set(c64(1, 0), wstart3);
        c64x2 ws3 = C64x2::set(c64(1, 0), wstart4);

        c64x2 wsstart0 = C64x2::uni(wstart1 * wstart1);
        c64x2 wsstart1 = C64x2::uni(wstart2 * wstart2);
        c64x2 wsstart2 = C64x2::uni(wstart3 * wstart3);
        c64x2 wsstart3 = C64x2::uni(wstart4 * wstart4);

        c64x2 accumulator0 = C64x2::zero();
        c64x2 accumulator1 = C64x2::zero();
        c64x2 accumulator2 = C64x2::zero();
        c64x2 accumulator3 = C64x2::zero();

        for (usize i = start; i < (end - rem); i += 8) {
            c64x2 acc = C64x2::set(array[i], array[i + 1]);
            accumulator0 = C64x2::add(accumulator0, C64x2::mul(acc, ws0));
            accumulator1 = C64x2::add(accumulator1, C64x2::mul(acc, ws1));
            accumulator2 = C64x2::add(accumulator2, C64x2::mul(acc, ws2));
            accumulator3 = C64x2::add(accumulator3, C64x2::mul(acc, ws3));
            ws0 = C64x2::mul(ws0, wsstart0);
            ws1 = C64x2::mul(ws1, wsstart1);
            ws2 = C64x2::mul(ws2, wsstart2);
            ws3 = C64x2::mul(ws3, wsstart3);

            acc = C64x2::set(array[i + 2], array[i + 3]);
            accumulator0 = C64x2::add(accumulator0, C64x2::mul(acc, ws0));
            accumulator1 = C64x2::add(accumulator1, C64x2::mul(acc, ws1));
            accumulator2 = C64x2::add(accumulator2, C64x2::mul(acc, ws2));
            accumulator3 = C64x2::add(accumulator3, C64x2::mul(acc, ws3));
            ws0 = C64x2::mul(ws0, wsstart0);
            ws1 = C64x2::mul(ws1, wsstart1);
            ws2 = C64x2::mul(ws2, wsstart2);
            ws3 = C64x2::mul(ws3, wsstart3);

            acc = C64x2::set(array[i + 4], array[i + 5]);
            accumulator0 = C64x2::add(accumulator0, C64x2::mul(acc, ws0));
            accumulator1 = C64x2::add(accumulator1, C64x2::mul(acc, ws1));
            accumulator2 = C64x2::add(accumulator2, C64x2::mul(acc, ws2));
            accumulator3 = C64x2::add(accumulator3, C64x2::mul(acc, ws3));
            ws0 = C64x2::mul(ws0, wsstart0);
            ws1 = C64x2::mul(ws1, wsstart1);
            ws2 = C64x2::mul(ws2, wsstart2);
            ws3 = C64x2::mul(ws3, wsstart3);

            acc = C64x2::set(array[i + 6], array[i + 7]);
            accumulator0 = C64x2::add(accumulator0, C64x2::mul(acc, ws0));
            accumulator1 = C64x2::add(accumulator1, C64x2::mul(acc, ws1));
            accumulator2 = C64x2::add(accumulator2, C64x2::mul(acc, ws2));
            accumulator3 = C64x2::add(accumulator3, C64x2::mul(acc, ws3));
            ws0 = C64x2::mul(ws0, wsstart0);
            ws1 = C64x2::mul(ws1, wsstart1);
            ws2 = C64x2::mul(ws2, wsstart2);
            ws3 = C64x2::mul(ws3, wsstart3);
        }
        C64x2::storeptr(buffer, ws0);
        c64 w0 = buffer[0];
        C64x2::storeptr(buffer, ws1);
        c64 w1 = buffer[0];
        C64x2::storeptr(buffer, ws2);
        c64 w2 = buffer[0];
        C64x2::storeptr(buffer, ws3);
        c64 w3 = buffer[0];

        for (i32 i = (end - rem); i < end; ++i) {
            c64 a = array[i];
            dest[index] += a * w0;
            w0 *= wstart1;
            dest[index + 1] += a * w1;
            w1 *= wstart2;
            dest[index + 2] += a * w2;
            w2 *= wstart3;
            dest[index + 3] += a * w3;
            w3 *= wstart4;
        }

        wstart *= wlen4;

        dest[index] += C64x2::reduce_sum(accumulator0);
        dest[index + 1] += C64x2::reduce_sum(accumulator1);
        dest[index + 2] += C64x2::reduce_sum(accumulator2);
        dest[index + 3] += C64x2::reduce_sum(accumulator3);
    }

    for (i32 index = (n - nrem); index < n; ++index) {
        c64 w = {1, 0};
        for (usize i = start; i < end; ++i) {
            dest[index] += array[i] * w;
            w *= wstart;
        }
        wstart *= wlen;
    }

    for (i32 i = start; i < end; ++i) {
        array[i] = dest[i - start];
    }

    aligned_free(dest);
}

void fft_b2(c64 *array, i32 n) {
    c64x2 scal = C64x2::set(c64(1, 1), c64(-1, -1));

    for (usize i = 0; i < n; i += 8) {
        c64x2 u = C64x2::uni(array[i]);
        c64x2 v = C64x2::uni(array[i + 1]);
        C64x2::storeptr(array + i, C64x2::add(u, C64x2::scal_mul(v, scal)));

        u = C64x2::uni(array[i + 2]);
        v = C64x2::uni(array[i + 3]);
        C64x2::storeptr(array + i + 2, C64x2::add(u, C64x2::scal_mul(v, scal)));

        u = C64x2::uni(array[i + 4]);
        v = C64x2::uni(array[i + 5]);
        C64x2::storeptr(array + i + 4, C64x2::add(u, C64x2::scal_mul(v, scal)));

        u = C64x2::uni(array[i + 6]);
        v = C64x2::uni(array[i + 7]);
        C64x2::storeptr(array + i + 6, C64x2::add(u, C64x2::scal_mul(v, scal)));
    }
}

void fft_b4(c64 *array, i32 n) {
    c64x2 scal1 = C64x2::set(c64(1, 0), c64(0, -1));

    for (usize i = 0; i < n; i += 16) {
        c64x2 u2 = C64x2::fromptr(array + i);
        c64x2 v2 = C64x2::fromptr(array + i + 2);
        auto tm = C64x2::mul(v2, scal1);
        C64x2::storeptr(array + i, C64x2::add(u2, tm));
        C64x2::storeptr(array + i + 2, C64x2::sub(u2, tm));

        u2 = C64x2::fromptr(array + i + 4);
        v2 = C64x2::fromptr(array + i + 6);
        tm = C64x2::mul(v2, scal1);
        C64x2::storeptr(array + i + 4, C64x2::add(u2, tm));
        C64x2::storeptr(array + i + 6, C64x2::sub(u2, tm));

        u2 = C64x2::fromptr(array + i + 8);
        v2 = C64x2::fromptr(array + i + 10);
        tm = C64x2::mul(v2, scal1);
        C64x2::storeptr(array + i + 8, C64x2::add(u2, tm));
        C64x2::storeptr(array + i + 10, C64x2::sub(u2, tm));

        u2 = C64x2::fromptr(array + i + 12);
        v2 = C64x2::fromptr(array + i + 14);
        tm = C64x2::mul(v2, scal1);
        C64x2::storeptr(array + i + 12, C64x2::add(u2, tm));
        C64x2::storeptr(array + i + 14, C64x2::sub(u2, tm));
    }
}

void fft_odd(c64 *array, i32 n, i32 block_size) {
    f64 angle = Math::pi_2 / block_size;
    c64 init = {::cos(angle), -::sin(angle)};
    c64 wmul = init * init;
    c64x2 wsmul = C64x2::uni(wmul);

    i32 loop_len = block_size >> 1;
    i32 rem = loop_len & 7;
    for (i32 i = 0; i < n; i += block_size) {
        c64x2 ws = C64x2::set({1, 0}, init);

        for (i32 j = 0; j < loop_len - rem; j += 8) {
            c64x2 u2 = C64x2::fromptr(array + i + j);
            c64x2 v2 = C64x2::fromptr(array + i + j + loop_len);
            c64x2 tm = C64x2::mul(v2, ws);
            C64x2::storeptr(array + i + j, C64x2::add(u2, tm));
            C64x2::storeptr(array + i + j + loop_len, C64x2::sub(u2, tm));
            ws = C64x2::mul(ws, wsmul);

            u2 = C64x2::fromptr(array + i + j + 2);
            v2 = C64x2::fromptr(array + i + j + 2 + loop_len);
            tm = C64x2::mul(v2, ws);
            C64x2::storeptr(array + i + j + 2, C64x2::add(u2, tm));
            C64x2::storeptr(array + i + j + 2 + loop_len, C64x2::sub(u2, tm));
            ws = C64x2::mul(ws, wsmul);

            u2 = C64x2::fromptr(array + i + j + 4);
            v2 = C64x2::fromptr(array + i + j + 4 + loop_len);
            tm = C64x2::mul(v2, ws);
            C64x2::storeptr(array + i + j + 4, C64x2::add(u2, tm));
            C64x2::storeptr(array + i + j + 4 + loop_len, C64x2::sub(u2, tm));
            ws = C64x2::mul(ws, wsmul);

            u2 = C64x2::fromptr(array + i + j + 6);
            v2 = C64x2::fromptr(array + i + j + 6 + loop_len);
            tm = C64x2::mul(v2, ws);
            C64x2::storeptr(array + i + j + 6, C64x2::add(u2, tm));
            C64x2::storeptr(array + i + j + 6 + loop_len, C64x2::sub(u2, tm));
            ws = C64x2::mul(ws, wsmul);
        }

        c64 buff[2];
        C64x2::storeptr(buff, ws);
        c64 w = buff[0];

        for (i32 j = loop_len - rem; j < loop_len; ++j) {
            c64 u = array[i + j];
            c64 v = array[i + j + loop_len] * w;
            array[i + j] = u + v;
            array[i + j + loop_len] = u - v;
            w *= init;
        }
    }
}

void fft_inplace(c64 *array, i32 n, i32 block_size) {
    for (i32 operate_length = (block_size << 1); operate_length <= n;
         operate_length <<= 1) {
        switch (operate_length) {
            case 2:
                fft_b2(array, n);
                break;
            case 4:
                fft_b4(array, n);
                break;
            default:
                fft_odd(array, n, operate_length);
                // f64 angle = 2.0 * Math::pi / operate_length;
                // const c64 init = {::cos(angle), -::sin(angle)};

                // for (usize i = 0; i < n; i += operate_length) {
                //     c64 w = {1, 0};
                //     for (usize j = 0; j < operate_length / 2; ++j) {
                //         c64 u = array[i + j];
                //         c64 v = array[i + j + operate_length / 2] * w;
                //         array[i + j] = u + v;
                //         array[i + j + operate_length / 2] = u - v;
                //         w *= init;
                //     }
                // }
                break;
        }
    }
}

#endif
