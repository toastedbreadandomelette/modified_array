#pragma once
#ifndef _MD_MATH_HPP_
#define _MD_MATH_HPP_

#include <stdint.h>

namespace MdMath {

constexpr f64 e = 2.71828182845904523536028747135266249775724709369995;

constexpr f64 pi = 3.14159265358979323846;

constexpr f64 pi_2 = 3.14159265358979323846 * 2;

/**
 * @brief Reverse at max 64-bits of a 64 bit number
 * @param n unsigned number
 * @param bit_size size to be reversed
 * @return reversed bit number
 */
constexpr inline usize reverse_bits(const usize n, const usize bit_size = 64) {
    usize rn = (n << 32) | (n >> 32);
    rn = ((rn << 16) & 0xFFFF0000FFFF0000) | ((rn >> 16) & 0x0000FFFF0000FFFF);
    rn = ((rn << 8) & 0xFF00FF00FF00FF00) | ((rn >> 8) & 0x00FF00FF00FF00FF);
    rn = ((rn << 4) & 0xF0F0F0F0F0F0F0F0) | ((rn >> 4) & 0x0F0F0F0F0F0F0F0F);
    rn = ((rn << 2) & 0xCCCCCCCCCCCCCCCC) | ((rn >> 2) & 0x3333333333333333);
    rn = ((rn << 1) & 0xAAAAAAAAAAAAAAAA) | ((rn >> 1) & 0x5555555555555555);
    return (rn >> (64 - bit_size));
}

/**
 * @brief Reverse at max 32-bits of a 32 bit number
 * @param n unsigned number
 * @param bit_size size to be reversed
 * @return reversed bit number
 */
constexpr inline u32 reverse_bits_32(const u32 n, const u32 bit_size = 32) {
    u32 rn = (n << 16) | (n >> 16);
    rn = ((rn << 8) & 0xFF00FF00) | ((rn >> 8) & 0x00FF00FF);
    rn = ((rn << 4) & 0xF0F0F0F0) | ((rn >> 4) & 0x0F0F0F0F);
    rn = ((rn << 2) & 0xCCCCCCCC) | ((rn >> 2) & 0x33333333);
    rn = ((rn << 1) & 0xAAAAAAAA) | ((rn >> 1) & 0x55555555);
    return (rn >> (32 - bit_size));
}

/**
 * @brief Reverse at max 16-bits of a 16 bit number
 * @param n unsigned number
 * @param bit_size size to be reversed
 * @return reversed bit number
 */
constexpr inline usize reverse_bits_16(const u16 n, const u16 bit_size = 16) {
    u16 rn = (rn << 8) | (rn >> 8);
    rn = ((rn << 4) & 0xF0F0) | ((rn >> 4) & 0x0F0F);
    rn = ((rn << 2) & 0xCCCC) | ((rn >> 2) & 0x3333);
    rn = ((rn << 1) & 0xAAAA) | ((rn >> 1) & 0x5555);
    return (rn >> (16 - bit_size));
}

/**
 * @brief Reverse at max 8-bits of a 8 bit number
 * @param n unsigned number
 * @param bit_size size to be reversed
 * @return reversed bit number
 */
constexpr inline u8 reverse_bits_8(const u8 n, const u8 bit_size = 8) {
    u8 rn = (rn << 4) | (rn >> 4);
    rn = ((rn << 2) & 0xCC) | ((rn >> 2) & 0x33);
    rn = ((rn << 1) & 0xAA) | ((rn >> 1) & 0x55);
    return (rn >> (8 - bit_size));
}

template <usize...>
struct reversed_bits {};

/**
 * @brief Evaluate the reversed bits at compilation time.
 */
template <usize N, usize bit_size>
struct reversed_bits<N, bit_size> {
    static constexpr usize value = reverse_bits(N, bit_size);
};

/**
 * @brief Evaluate the factorial of a number during compilation time
 */
template <usize N>
struct factorial {
    static constexpr f64 value = N * factorial<N - 1>::value;
};

/**
 * @brief Evaluate the factorial of a number during compilation time
 */
template <>
struct factorial<0> {
    static constexpr f64 value = 1;
};

};  // namespace MdMath

#endif
