
#include "md_static_array_utility.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayUtility::mapping_fn(
    const MdStaticArray<_T> &__values,
    const std::function<_T(const _T &)> &function_exec) {
    const size_t size = __values.get_size();

    MdStaticArray<_T> result(size);

    const uint8_t thread_count = ::s_thread_count;
    const size_t threshold_size = ::s_threshold_size;

    if (thread_count == 1 || size <= threshold_size) {
        for (size_t index = 0; index < size; ++index) {
            result.__array[index] = function_exec(__values[index]);
        }
    } else {
        std::vector<std::thread> st;
        st.reserve(thread_count);
        auto _add_int = [&result, &__values, &function_exec](const size_t start,
                                                             const size_t end) {
            for (size_t index = start; index < end; ++index) {
                result.__array[index] = function_exec(__values.__array[index]);
            }
        };

        const size_t block = size / thread_count;
        const uint8_t thread_but_one = thread_count - 1;
        for (int i = 0; i < thread_but_one; ++i) {
            st.emplace_back(std::thread(_add_int, block * i, block * (i + 1)));
        }

        st.emplace_back(std::thread(_add_int, block * thread_but_one, size));

        for (auto &th : st) {
            th.join();
        }
    }
    return result;
}

template <typename _T, typename _func>
_T MdArrayUtility::accumulate_fn(MdStaticArray<_T> &__values,
                                 const _func &function_exec, const _T init) {
    const size_t size = __values.get_size();
    _T result = init;
    const uint8_t thread_count = ::s_thread_count;
    const size_t threshold_size = ::s_threshold_size;
    if (thread_count == 1 || size <= threshold_size) {
        for (size_t index = 0; index < size; ++index) {
            result = function_exec(result, __values[index]);
        }
    } else {
        std::vector<std::thread> st;
        st.reserve(thread_count);
        std::vector<_T> __res_total(thread_count, init);
        auto _add_int = [&__res_total, &__values, &function_exec](
                            const uint8_t thread_number, const size_t start,
                            const size_t end) {
            for (size_t index = start; index < end; ++index) {
                __res_total[thread_number] =
                    function_exec(__res_total[thread_number], __values[index]);
            }
        };

        const size_t block = size / thread_count;
        const uint8_t thread_but_one = thread_count - 1;
        for (int i = 0; i < thread_but_one; ++i) {
            st.emplace_back(
                std::thread(_add_int, i, block * i, block * (i + 1)));
        }

        st.emplace_back(std::thread(_add_int, thread_but_one,
                                    block * thread_but_one, size));

        for (auto &th : st) {
            th.join();
        }

        for (auto &result_th : __res_total) {
            result = function_exec(result, result_th);
        }
    }
    return result;
}

template <typename _T, typename _func, typename _merge_func>
_T MdArrayUtility::accumulate_and_merge_fn(MdStaticArray<_T> &__values,
                                           const _func &function_exec,
                                           const _merge_func &merge_func,
                                           const _T init, const _T merge_init) {
    const size_t size = __values.get_size();
    _T result = merge_init;
    const uint8_t thread_count = ::s_thread_count;
    const size_t threshold_size = ::s_threshold_size;
    if (thread_count == 1 || size <= threshold_size) {
        for (size_t index = 0; index < size; ++index) {
            result = function_exec(result, __values[index]);
        }
    } else {
        std::vector<std::thread> st;
        st.reserve(thread_count);
        std::vector<_T> __res_total(thread_count, init);
        auto _add_int = [&__res_total, &__values, &function_exec](
                            const uint8_t thread_number, const size_t start,
                            const size_t end) {
            for (size_t index = start; index < end; ++index) {
                __res_total[thread_number] =
                    function_exec(__res_total[thread_number], __values[index]);
            }
        };

        const size_t block = size / thread_count;
        const uint8_t thread_but_one = thread_count - 1;
        for (int i = 0; i < thread_but_one; ++i) {
            st.emplace_back(
                std::thread(_add_int, i, block * i, block * (i + 1)));
        }

        st.emplace_back(std::thread(_add_int, thread_but_one,
                                    block * thread_but_one, size));

        for (auto &th : st) {
            th.join();
        }

        for (auto &result_th : __res_total) {
            result = merge_func(result, result_th);
        }
    }
    return result;
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::f_sqrt(MdStaticArray<_T> &__values) {
    return mapping_fn<_T>(__values, sqrt);
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::f_abs(MdStaticArray<_T> &__values) {
    return mapping_fn<_T>(__values, fabs);
}

template <typename _T>
_T MdArrayUtility::f_sum(MdStaticArray<_T> &__values, _T init) {
    return accumulate_fn(
        __values,
        [](const _T prev_value, const _T current_value) {
            return prev_value + current_value;
        },
        init);
}

template <typename _T>
long double MdArrayUtility::f_mean(MdStaticArray<_T> &__values, _T init) {
    return accumulate_fn(
               __values,
               [](const _T prev_value, const _T current_value) {
                   return prev_value + current_value;
               },
               init) /
           (__values.get_size() * 1.0);
}

template <typename _T>
long double MdArrayUtility::f_rms(MdStaticArray<_T> &__values, _T init) {
    long double mean_sq =
        accumulate_and_merge_fn(
            __values,
            [](const _T prev_value, const _T current_value) {
                return prev_value + (current_value * current_value);
            },
            [](const _T prev_value, const _T current_value) {
                return prev_value + current_value;
            },
            (_T)init, (_T)init) /
        (__values.get_size() * 1.0);
    return sqrt(mean_sq);
}

template <typename _T>
long double MdArrayUtility::f_std_dev(MdStaticArray<_T> &__values) {
    long double fmean = f_mean(__values);
    long double mean_sq_err =
        accumulate_and_merge_fn(
            __values,
            [&fmean](const _T prev_value, const _T current_value) {
                return prev_value +
                       (fmean - current_value) * (fmean - current_value);
            },
            [](const _T prev_value, const _T current_value) {
                return prev_value + current_value;
            },
            (_T)0.0, (_T)0.0) /
        (__values.get_size() * 1.0);
    return sqrt(mean_sq_err);
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::f_log_10(MdStaticArray<_T> &__values) {
    return mapping_fn<_T>(__values,
                          [](const _T &__value) { return log10(__value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::f_log_2(MdStaticArray<_T> &__values) {
    return mapping_fn<_T>(__values,
                          [](const _T &__value) { return log2(__value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::f_ln(MdStaticArray<_T> &__values) {
    return mapping_fn<_T>(__values,
                          [](const _T &__value) { return log(__value); });
}

template <typename _T,
          class = typename std::enable_if<std::is_integral<_T>::value>::type>
MdStaticArray<_T> MdArrayUtility::f_mod_pow(const MdStaticArray<_T> &__values,
                                            const size_t power,
                                            const size_t _mod) {
    return mapping_fn<_T>(__values, [power, _mod](const _T &__value) -> _T {
        if (power == 0ULL)
            return static_cast<_T>(1);
        if (power == 1ULL)
            return __value;
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

template <typename _T,
          class = typename std::enable_if<std::is_integral<_T>::value>::type>
MdStaticArray<_T> MdArrayUtility::f_mod_pow(const uint64_t n,
                                            const MdStaticArray<_T> &__values,
                                            const size_t _mod) {
    return mapping_fn<_T>(__values, [n, _mod](const _T &__value) -> _T {
        if (__value == 0)
            return static_cast<_T>(1);
        if (__value == 1)
            return static_cast<_T>(n);
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

template <typename _T>
MdStaticArray<_T> MdArrayUtility::f_pow(const MdStaticArray<_T> &__values,
                                        double power) {
    return mapping_fn<_T>(
        __values, [power](const _T __value) { return pow(__value, power); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::f_sin(const MdStaticArray<_T> &__values) {
    return mapping_fn<_T>(__values,
                          [](const _T &__value) { return sin(__value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::f_cos(const MdStaticArray<_T> &__values) {
    return mapping_fn<_T>(__values,
                          [](const _T &__value) { return cos(__value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::f_tan(const MdStaticArray<_T> &__values) {
    return mapping_fn<_T>(__values,
                          [](const _T &__value) { return tan(__value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::f_cot(const MdStaticArray<_T> &__values) {
    return mapping_fn<_T>(__values,
                          [](const _T &__value) { return cot(__value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::f_sec(const MdStaticArray<_T> &__values) {
    return mapping_fn<_T>(__values,
                          [](const _T &__value) { return sec(__value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::f_csc(const MdStaticArray<_T> &__values) {
    return mapping_fn<_T>(__values,
                          [](const _T &__value) { return cosec(__value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::f_arcsin(const MdStaticArray<_T> &__values) {
    return mapping_fn<_T>(__values,
                          [](const _T &__value) { return asin(__value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::f_arccos(const MdStaticArray<_T> &__values) {
    return mapping_fn<_T>(__values,
                          [](const _T &__value) { return acos(__value); });
}

template <typename _T>
MdStaticArray<_T> MdArrayUtility::f_arctan(const MdStaticArray<_T> &__values) {
    return mapping_fn<_T>(__values,
                          [](const _T &__value) { return atan(__value); });
}

/**
 * @brief Generate evenly spaced values
 */
template <typename _T,
          class = typename std::enable_if<std::is_arithmetic<_T>::value>::type>
MdStaticArray<_T> MdArrayUtility::range(const _T start, const _T end,
                                        const _T spacing) {
    if (end == -1) {
        MdStaticArray<_T> result(static_cast<_T>(start));
        for (size_t index = 0; index < start; ++index) {
            result.__array[index] = index;
        }
        return result;
    } else if (spacing == 1) {
        const auto value = end - start;
        MdStaticArray<_T> result(static_cast<size_t>(
            ceil(std::max(value, static_cast<decltype(value)>(0)))));
        for (size_t index = 0, val = start; val < end; ++index, val += 1) {
            result.__array[index] = val;
        }
        return result;
    } else {
        const auto value = (end - start) / spacing;
        MdStaticArray<_T> result(static_cast<size_t>(
            ceil(std::max(value, static_cast<decltype(value)>(0)))));
        _T val = start;
        for (size_t index = 0; val < end; ++index, val += spacing) {
            result.__array[index] = val;
        }
        return result;
    }
}
