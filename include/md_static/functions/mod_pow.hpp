#pragma once
#ifndef _MOD_POW_HPP_
#define _MOD_POW_HPP_
#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename T, class T1>
MdStaticArray<T> MdArrayUtility::mod_pow(const MdStaticArray<T> &values,
                                         const usize power, const usize mod) {
    return MdArrayUtility::map<T>(values, [power, mod](const T &value) -> T {
        if (power == 0ULL) {
            return static_cast<T>(1);
        }
        if (power == 1ULL) {
            return value;
        }
        u64 result = 1ULL, val = value, pow = power;
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
MdStaticArray<T> MdArrayUtility::mod_pow(const u64 n,
                                         const MdStaticArray<T> &values,
                                         const usize mod) {
    return MdArrayUtility::map<T>(values, [n, mod](const T &value) -> T {
        switch (value) {
            case 0:
                return static_cast<T>(1);
            case 1:
                return static_cast<T>(n);
            default: {
                u64 result = 1, pow = value, val = n;
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
            }
        }
    });
}

template <typename T, typename T1>
MdStaticArray<T> MdArrayUtility::mod_pow(
    const u64 n, const MdStaticArrayReference<T> &values, const usize mod) {
    return mod_pow<T, T1>(n,
                          MdStaticArray<T>(*values.__array_reference,
                                           values.offset, values.shp_offset),
                          mod);
}

template <typename T, typename T1>
MdStaticArray<T> MdArrayUtility::mod_pow(
    const MdStaticArrayReference<T> &values, const usize power,
    const usize mod) {
    return mod_pow<T, T1>(MdStaticArray<T>(*values.__array_reference,
                                           values.offset, values.shp_offset),
                          power, mod);
}

#endif
