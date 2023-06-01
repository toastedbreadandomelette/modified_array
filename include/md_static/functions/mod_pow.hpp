#pragma once
#ifndef _MOD_POW_HPP_
#define _MOD_POW_HPP_
#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T, class T1>
MdStaticArray<T> MdArrayUtility::mod_pow(const MdStaticArray<T> &values,
                                         const size_t power, const size_t mod) {
    return MdArrayUtility::map<T>(values, [power, mod](const T &value) -> T {
        if (power == 0ULL) {
            return static_cast<T>(1);
        }
        if (power == 1ULL) {
            return value;
        }
        uint64_t result = 1ULL, val = value, pow = power;
        while (pow > 0) {
            if (pow & 1) {
                result *= value;
                result %= mod;
            }
            val *= value;
            val %= mod;
            pow >>= 1;
        }
        return result;
    });
}

template <typename T, typename T1>
MdStaticArray<T> MdArrayUtility::mod_pow(const uint64_t n,
                                         const MdStaticArray<T> &values,
                                         const size_t mod) {
    return MdArrayUtility::map<T>(values, [n, mod](const T &value) -> T {
        if (value == 0) {
            return static_cast<T>(1);
        }
        if (value == 1) {
            return static_cast<T>(n);
        }
        uint64_t result = 1, pow = value, val = n;
        while (pow > 0) {
            if (pow & 1) {
                result *= value;
                result %= mod;
            }
            val *= value;
            val %= mod;
            pow >>= 1;
        }
        return result;
    });
}

template <typename T, typename T1>
MdStaticArray<T> MdArrayUtility::mod_pow(
    const uint64_t n, const MdStaticArrayReference<T> &values,
    const size_t mod) {
    return mod_pow<T, T1>(n,
                          MdStaticArray<T>(*values.__array_reference,
                                           values.offset, values.shp_offset),
                          mod);
}

template <typename T, typename T1>
MdStaticArray<T> MdArrayUtility::mod_pow(
    const MdStaticArrayReference<T> &values, const size_t power,
    const size_t mod) {
    return mod_pow<T, T1>(MdStaticArray<T>(*values.__array_reference,
                                           values.offset, values.shp_offset),
                          power, mod);
}

#endif
