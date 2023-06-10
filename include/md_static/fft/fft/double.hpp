#pragma once
#ifndef __FFT_DOUBLE_HPP__
#define __FFT_DOUBLE_HPP__

#include "../../../utility/math.hpp"
#include "../../../utility/simd.hpp"
#include "../../functions/range.hpp"
#include "../md_fft.hpp"

void dft_subarray(f64 *array, i32 start, i32 end, c64 *dest) {
    const usize n = end - start;

    f64x4 accumulator = F64x4::zero();

    i32 rem = (end - start) & 15;

    for (usize i = start; i < (end - rem); i += 16) {
        f64x4 acc = F64x4::fromptr(array + i);
        accumulator = F64x4::add(accumulator, acc);

        acc = F64x4::fromptr(array + i + 4);
        accumulator = F64x4::add(accumulator, acc);

        acc = F64x4::fromptr(array + i + 8);
        accumulator = F64x4::add(accumulator, acc);

        acc = F64x4::fromptr(array + i + 12);
        accumulator = F64x4::add(accumulator, acc);
    }

    for (i32 i = (end - rem); i < end; ++i) {
        dest[0] += array[i];
    }
    dest[0] += F64x4::reduce_sum(accumulator);

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

void fft(f64 *a) {}

#endif
