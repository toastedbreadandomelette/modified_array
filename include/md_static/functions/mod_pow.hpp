#pragma once
#ifndef _MOD_POW_HPP_
#define _MOD_POW_HPP_
#include "./map.hpp"
#include "./md_static_array_utility.hpp"

template <typename _T, class _T1>
MdStaticArray<_T> MdArrayUtility::mod_pow(const MdStaticArray<_T> &__values,
                                          const size_t power,
                                          const size_t _mod) {
    return MdArrayUtility::map<_T>(
        __values, [power, _mod](const _T &__value) -> _T {
            if (power == 0ULL) {
                return static_cast<_T>(1);
            }
            if (power == 1ULL) {
                return __value;
            }
            uint64_t result = 1ULL, value = __value, pow = power;
            while (pow > 0) {
                if (pow & 1) {
                    result *= value;
                    result %= _mod;
                }
                value *= value;
                value %= _mod;
                pow >>= 1;
            }
            return result;
        });
}

template <typename _T, typename _T1>
MdStaticArray<_T> MdArrayUtility::mod_pow(const uint64_t n,
                                          const MdStaticArray<_T> &__values,
                                          const size_t _mod) {
    return MdArrayUtility::map<_T>(
        __values, [n, _mod](const _T &__value) -> _T {
            if (__value == 0) {
                return static_cast<_T>(1);
            }
            if (__value == 1) {
                return static_cast<_T>(n);
            }
            uint64_t result = 1, pow = __value, value = n;
            while (pow > 0) {
                if (pow & 1) {
                    result *= value;
                    result %= _mod;
                }
                value *= value;
                value %= _mod;
                pow >>= 1;
            }
            return result;
        });
}

#endif
