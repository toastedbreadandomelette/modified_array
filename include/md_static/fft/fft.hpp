#pragma once
#ifndef _FFT_FUNC_HPP_
#define _FFT_FUNC_HPP_

#include <bitset>

#include "../functions/range.hpp"
#include "./md_fft.hpp"

constexpr double pi = 3.14159265358979323846;

constexpr inline size_t reverse_bits(const size_t n, const size_t bit_size) {
    size_t rn = (n << 32) | (n >> 32);
    rn = ((rn << 16) & 0xFFFF0000FFFF0000) | ((rn >> 16) & 0x0000FFFF0000FFFF);
    rn = ((rn << 8) & 0xFF00FF00FF00FF00) | ((rn >> 8) & 0x00FF00FF00FF00FF);
    rn = ((rn << 4) & 0xF0F0F0F0F0F0F0F0) | ((rn >> 4) & 0x0F0F0F0F0F0F0F0F);
    rn = ((rn << 2) & 0xCCCCCCCCCCCCCCCC) | ((rn >> 2) & 0x3333333333333333);
    rn = ((rn << 1) & 0xAAAAAAAAAAAAAAAA) | ((rn >> 1) & 0x5555555555555555);
    return (rn >> (64 - bit_size));
}

/**
 * @note Source:
 * https://cp-algorithms.com/algebra/fft.html#improved-implementation-in-place-computation
 * https://e-maxx.ru/algo/fft_multiply
 */
template <typename _T>
MdStaticArray<cdouble> FFT::fft(const MdStaticArray<_T>& __other) {
    size_t n = __other.get_size();
    size_t power = static_cast<size_t>(std::log2(n));
    MdStaticArray<cdouble> __input;

    if ((n & (n - 1)) != 0) {
        power = static_cast<size_t>(std::log2(n));
        n = (__other.get_size() >> (power)) << (power + 1);
        ++power;
    }

    __input = MdStaticArray<cdouble>(n, 0);
    for (size_t index = 0; index < __other.get_size(); ++index) {
        __input.__array[index] = __other.__array[index];
    }

    auto __perform_dft_internal = [](const MdStaticArray<_T>& __values) {
        MdStaticArray<cdouble> result(__values.get_size(), 0);
        const size_t n = __values.get_size();
        const double PI_2_by_N = 2.0 * pi / (n * 1.0);
#pragma omp parallel for
        for (size_t index = 0; index < n; ++index) {
            const double PI_2_k_by_N = PI_2_by_N * index;
            const cdouble unit =
                cdouble{std::cos(PI_2_k_by_N), -std::sin(PI_2_k_by_N)};
            cdouble start = {1, 0};
            for (size_t i = 0; i < n; ++i) {
                result.__array[index] += (__values.__array[i] * start);
                start *= unit;
            }
        }

        return result;
    };

    std::function<MdStaticArray<cdouble>(const MdStaticArray<_T>&)>
        __perform_fft = [&__perform_dft_internal,
                         &__perform_fft](const MdStaticArray<_T>& __values) {
            if (__values.get_size() <= 512) {
                return __perform_dft_internal(__values);
            }

            const size_t n = __values.get_size();

            MdStaticArray<_T> odd(n / 2);
            MdStaticArray<_T> even(n / 2);
            if ((n / 2) > ::s_threshold_size) {
#pragma omp parallel for
                for (size_t index = 0; index < n / 2; ++index) {
                    odd.__array[index] = __values.__array[2 * index + 1];
                    even.__array[index] = __values.__array[2 * index];
                }
            } else {
                for (size_t index = 0; index < n / 2; ++index) {
                    odd.__array[index] = __values.__array[2 * index + 1];
                    even.__array[index] = __values.__array[2 * index];
                }
            }

            MdStaticArray<cdouble> odd_fft = __perform_fft(odd);
            MdStaticArray<cdouble> even_fft = __perform_fft(even);

            MdStaticArray<cdouble> answer_fft(n);
            const double PI_2_by_N = 2.0 * pi / (n * 1.0);
            if ((n / 2) > ::s_threshold_size) {
                auto __perform_collect_internal = [&odd_fft, &even_fft,
                                                   &answer_fft, PI_2_by_N,
                                                   n](const size_t start,
                                                      const size_t end) {
                    const auto unit =
                        cdouble{std::cos(PI_2_by_N), -std::sin(PI_2_by_N)};
                    cdouble st = cdouble{std::cos(start * PI_2_by_N),
                                         -std::sin(start * PI_2_by_N)};
                    for (size_t k = start; k < end; ++k) {
                        const auto t = st * odd_fft.__array[k];
                        answer_fft.__array[k] = even_fft.__array[k] + t;
                        answer_fft.__array[k + n / 2] = even_fft.__array[k] - t;

                        st *= unit;
                    }
                };
                size_t block_size = (n / 2) / ::s_thread_count;
                std::vector<std::thread> thread_pool;
                for (size_t index = 0; index < (::s_thread_count - 1);
                     ++index) {
                    thread_pool.emplace_back(__perform_collect_internal,
                                             block_size * index,
                                             block_size * (index + 1));
                }

                thread_pool.emplace_back(__perform_collect_internal,
                                         block_size * (::s_thread_count - 1),
                                         (n / 2));

                for (auto& thread : thread_pool) {
                    thread.join();
                }
            } else {
                const auto unit =
                    cdouble{std::cos(PI_2_by_N), -std::sin(PI_2_by_N)};
                cdouble start = {1, 0};
                for (size_t k = 0; k < n / 2; ++k) {
                    const auto t = start * odd_fft.__array[k];
                    answer_fft.__array[k] = even_fft.__array[k] + t;
                    answer_fft.__array[k + n / 2] = even_fft.__array[k] - t;
                    start *= unit;
                }
            }

            return answer_fft;
        };

    auto __perform_fft_in_place = [](MdStaticArray<cdouble>& __1darray,
                                     const size_t bit_size) {
        /// Reverse the bitwise indexes
        size_t n = __1darray.get_size();
        for (size_t index = 0; index < n; ++index) {
            const size_t rindex = reverse_bits(index, bit_size);
            if (index < rindex) {
                std::swap(__1darray.__array[index], __1darray.__array[rindex]);
            }
        }

        for (size_t operate_length = 2; operate_length <= n;
             operate_length <<= 1) {
            double angle = 2.0 * pi / operate_length;
            const cdouble init = {std::cos(angle), -std::sin(angle)};
#pragma omp parallel for
            for (size_t i = 0; i < n; i += operate_length) {
                cdouble w = {1, 0};
                for (size_t j = 0; j < operate_length / 2; ++j) {
                    cdouble u = __1darray.__array[i + j],
                            v = __1darray.__array[i + j + operate_length / 2] *
                                w;
                    __1darray.__array[i + j] = u + v;
                    __1darray.__array[i + j + operate_length / 2] = u - v;
                    w *= init;
                }
            }
        }
    };

    __perform_fft_in_place(__input, power);

    MdStaticArray<cdouble> result(__other.get_size());

    for (size_t index = 0; index < result.get_size(); ++index) {
        result.__array[index] = __input.__array[index];
    }

    return result;
}

template <typename _T>
MdStaticArray<cdouble> FFT::fft(const MdStaticArrayReference<_T>& __other) {
    return fft<_T>(MdStaticArray<_T>(*__other.__array_reference, __other.offset,
                                     __other.shp_offset));
}

#endif
