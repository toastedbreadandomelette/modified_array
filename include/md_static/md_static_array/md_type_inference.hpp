#pragma once
#ifndef _MD_TYPE_INTER_HPP_
#define _MD_TYPE_INTER_HPP_
#include <cassert>

#include "../../md_complex/md_complex.hpp"

/**
 * @brief Type inference namespace to infer implicit return types
 */
namespace MdTypeInfer {

/**
 * @brief Template to check if type is from a variadic list
 * @tparam T1 value to check
 * @tparam ... variadic list
 */
template <typename T1, typename...>
struct is_any_one : std::false_type {};

/**
 * @brief Template to check if type is from a variadic list
 * @tparam T1 value to check
 * @tparam T2 value with which
 * @tparam ... variadic list
 */
template <typename T1, typename T2, typename... args>
struct is_any_one<T1, T2, args...> {
    static constexpr bool value =
        std::is_same<T1, T2>::value || is_any_one<T1, args...>::value;
};

/**
 * @brief Template to check if type is one of the complex numbers
 * @tparam T value to check
 */
template <typename T>
struct is_complex {
    static constexpr bool value =
        is_any_one<T, cdouble, clongdouble, cfloat, cuint8, cuint16, cuint32,
                   cuint64, cint8, cint16, cint32, cint64>::value;
};

/**
 * @brief Template to check if type is one of the native types
 * @tparam T value to check
 */
template <typename T>
struct is_native {
    static constexpr bool value =
        is_any_one<T, int32_t, int64_t, int16_t, int8_t, uint8_t, uint16_t,
                   uint32_t, uint64_t, float, double, long double>::value;
};

/**
 * @brief Template to check if type is one of the native types
 * @tparam T value to check
 */
template <typename T>
struct is_arith {
    static constexpr bool value = is_native<T>::value || is_complex<T>::value;
};

/**
 * @brief Template to check if type is one of the floating complex numbers
 * @tparam T value to check
 */
template <typename T>
struct is_floating_complex {
    static constexpr bool value =
        is_any_one<T, cdouble, clongdouble, cfloat>::value;
};

/**
 * @brief Template to check if type is one of the signed complex integers
 * @tparam T value to check
 */
template <typename T>
struct is_signed_complex {
    static constexpr bool value =
        is_any_one<T, cint8, cint16, cint32, cint64>::value;
};

/**
 * @brief Template to check if type is one of the unsigned complex integers
 * @tparam T value to check
 */
template <typename T>
struct is_unsigned_complex {
    static constexpr bool value =
        is_any_one<T, cuint8, cuint16, cuint32, cuint64>::value;
};

/**
 * @brief Variadic template to check if type is one of the signed complex
 * integers
 */
template <typename...>
struct is_any_one_complex : std::false_type {};

/**
 * @brief Variadic template to check if any one type is one of complex
 * numbers
 * @tparam T1 value to check
 * @tparam args variadic arguments
 */
template <typename T1, typename... args>
struct is_any_one_complex<T1, args...> {
    static constexpr bool value =
        is_complex<T1>::value || is_any_one_complex<args...>::value;
};

/**
 * @brief Variadic template to check if any one type is one of complex
 * real numbers
 */
template <typename...>
struct is_any_one_floating_complex : std::false_type {};

/**
 * @brief Variadic template to check if any one type is one of complex
 * real numbers
 * @tparam T1 value to check
 * @tparam args variadic arguments
 */
template <typename T1, typename... args>
struct is_any_one_floating_complex<T1, args...> {
    static constexpr bool value = is_floating_complex<T1>::value ||
                                  is_any_one_floating_complex<args...>::value;
};

/**
 * @brief Variadic template to check if any one type is one of complex
 * signed integers
 */
template <typename...>
struct is_any_one_signed_complex : std::false_type {};

/**
 * @brief Variadic template to check if any one type is one of complex
 * signed integers
 * @tparam T1 value to check
 * @tparam args variadic arguments
 */
template <typename T1, typename... args>
struct is_any_one_signed_complex<T1, args...> {
    static constexpr bool value = is_signed_complex<T1>::value ||
                                  is_any_one_signed_complex<args...>::value;
};

/**
 * @brief Variadic template to check if any one type is one of complex
 * unsigned integers
 * @tparam T1 value to check
 * @tparam args variadic arguments
 */
template <typename...>
struct is_any_one_unsigned_complex : std::false_type {};

/**
 * @brief Variadic template to check if any one type is one of complex
 * unsigned integers
 * @tparam T1 value to check
 * @tparam args variadic arguments
 */
template <typename T1, typename... args>
struct is_any_one_unsigned_complex<T1, args...> {
    static constexpr bool value = is_unsigned_complex<T1>::value ||
                                  is_any_one_unsigned_complex<args...>::value;
};

/**
 * @brief Variadic template to check if any one type is one of
 * real numbers
 */
template <typename...>
struct is_any_one_floating : std::false_type {};

/**
 * @brief Variadic template to check if any one type is one of
 * real numbers
 * @tparam T1 value to check
 * @tparam args variadic arguments
 */
template <typename T1, class... arg>
struct is_any_one_floating<T1, arg...> {
    static constexpr bool value =
        std::is_floating_point<T1>::value || is_any_one_floating<arg...>::value;
};

/**
 * @brief Variadic template to check if any one type is one of
 * signed integers
 */
template <class...>
struct is_any_one_signed {
    static constexpr bool value = std::false_type{};
};

/**
 * @brief Variadic template to check if any one type is one of
 * signed integers
 * @tparam T1 value to check
 * @tparam args variadic arguments
 */
template <class T1, class... arg>
struct is_any_one_signed<T1, arg...> {
    static constexpr bool value =
        std::is_signed<T1>::value || is_any_one_signed<arg...>::value;
};

/**
 * @brief Returns type that has max byte size per element
 * @tparam T1 first type
 * @tparam T2 second type
 */
template <typename T1, typename T2, class = void>
struct max_size_t {};

/**
 * @brief Returns type that has max byte size per element
 * @tparam T1 first type
 * @tparam T2 second type
 */
template <typename T1, typename T2>
struct max_size_t<T1, T2,
                  typename std::enable_if<(sizeof(T1) > sizeof(T2))>::type> {
    static constexpr auto value = static_cast<T1>(0);
};

/**
 * @brief Returns type that has max byte size per element
 * @tparam T1 first type
 * @tparam T2 second type
 */
template <typename T1, typename T2>
struct max_size_t<T1, T2,
                  typename std::enable_if<(sizeof(T2) >= sizeof(T1))>::type> {
    static constexpr auto value = static_cast<T2>(0);
};

/**
 * @brief Wrapper for returning appropriate floating number
 * @tparam t generic type
 */
template <typename t, class = void>
struct floating_t;

/**
 * @brief Wrapper for returning appropriate floating number
 * @tparam _Ttypeval generic type
 */
template <typename _Ttypeval>
struct floating_t<_Ttypeval, typename std::enable_if<(sizeof(_Ttypeval) ==
                                                      sizeof(float))>::type> {
    using type = float;
};

template <typename _Ttypeval>
struct floating_t<_Ttypeval, typename std::enable_if<(sizeof(_Ttypeval) ==
                                                      sizeof(double))>::type> {
    using type = double;
};

template <typename _Ttypeval>
struct floating_t<
    _Ttypeval,
    typename std::enable_if<(sizeof(_Ttypeval) >= sizeof(long double))>::type> {
    using type = long double;
};

/**
 * @brief Wrapper for returning appropriate complex floating number
 * @tparam _Ttypeval generic type
 */
template <typename t, class = void>
struct complex_floating_t;

template <typename _Ttypeval>
struct complex_floating_t<
    _Ttypeval,
    typename std::enable_if<(sizeof(_Ttypeval) == sizeof(cfloat))>::type> {
    using type = cfloat;
};

template <typename _Ttypeval>
struct complex_floating_t<
    _Ttypeval,
    typename std::enable_if<(sizeof(_Ttypeval) == sizeof(cdouble))>::type> {
    using type = cdouble;
};

template <typename _Ttypeval>
struct complex_floating_t<
    _Ttypeval,
    typename std::enable_if<(sizeof(_Ttypeval) >= sizeof(clongdouble))>::type> {
    using type = clongdouble;
};

/**
 * @brief Wrapper for returning appropriate complex signed integer
 * @tparam _Ttypeval generic type
 */
template <typename _Ttypeval, typename...>
struct complex_signed_t {
    using type = _Ttypeval;
};

template <typename _Ttypeval>
struct complex_signed_t<
    _Ttypeval,
    typename std::enable_if<(sizeof(_Ttypeval) == sizeof(cint8))>::type> {
    using type = cint8;
};

template <typename _Ttypeval>
struct complex_signed_t<
    _Ttypeval,
    typename std::enable_if<(sizeof(_Ttypeval) == sizeof(cint16))>::type> {
    using type = cint16;
};

template <typename _Ttypeval>
struct complex_signed_t<
    _Ttypeval,
    typename std::enable_if<(sizeof(_Ttypeval) == sizeof(cint32))>::type> {
    using type = cint32;
};

template <typename _Ttypeval>
struct complex_signed_t<
    _Ttypeval,
    typename std::enable_if<(sizeof(_Ttypeval) >= sizeof(cint64))>::type> {
    using type = cint64;
};

/**
 * @brief Wrapper for returning appropriate signed integer
 * @tparam _Ttypeval generic type
 */
template <typename _Ttypeval, class = void>
struct signed_t;

template <typename _Ttypeval>
struct signed_t<_Ttypeval, typename std::enable_if<(sizeof(_Ttypeval) ==
                                                    sizeof(int8_t))>::type> {
    using type = int8_t;
};

template <typename _Ttypeval>
struct signed_t<_Ttypeval, typename std::enable_if<(sizeof(_Ttypeval) ==
                                                    sizeof(int16_t))>::type> {
    using type = int16_t;
};

template <typename _Ttypeval>
struct signed_t<_Ttypeval, typename std::enable_if<(sizeof(_Ttypeval) ==
                                                    sizeof(int32_t))>::type> {
    using type = int32_t;
};

template <typename _Ttypeval>
struct signed_t<_Ttypeval, typename std::enable_if<(sizeof(_Ttypeval) >=
                                                    sizeof(int64_t))>::type> {
    using type = int64_t;
};

/**
 * @brief Wrapper for returning appropriate unsigned integer
 * @tparam _Ttypeval generic type
 */
template <typename _Ttypeval, class = void>
struct unsigned_t;

template <typename _Ttypeval>
struct unsigned_t<_Ttypeval, typename std::enable_if<(sizeof(_Ttypeval) ==
                                                      sizeof(uint8_t))>::type> {
    using type = uint8_t;
};

template <typename _Ttypeval>
struct unsigned_t<
    _Ttypeval,
    typename std::enable_if<(sizeof(_Ttypeval) == sizeof(uint16_t))>::type> {
    using type = uint16_t;
};

template <typename _Ttypeval>
struct unsigned_t<
    _Ttypeval,
    typename std::enable_if<(sizeof(_Ttypeval) == sizeof(uint32_t))>::type> {
    using type = uint32_t;
};

template <typename _Ttypeval>
struct unsigned_t<
    _Ttypeval,
    typename std::enable_if<(sizeof(_Ttypeval) >= sizeof(uint64_t))>::type> {
    using type = uint64_t;
};

/**
 * @brief Wrapper for returning appropriate complex unsigned integer
 * @tparam _Ttypeval generic type
 */
template <typename _Ttypeval, class...>
struct cunsigned_t {
    using type = _Ttypeval;
};

template <typename _Ttypeval>
struct cunsigned_t<_Ttypeval, typename std::enable_if<(sizeof(_Ttypeval) ==
                                                       sizeof(cuint8))>::type> {
    using type = cuint8;
};

template <typename _Ttypeval>
struct cunsigned_t<
    _Ttypeval,
    typename std::enable_if<(sizeof(_Ttypeval) == sizeof(cuint16))>::type> {
    using type = cuint16;
};

template <typename _Ttypeval>
struct cunsigned_t<
    _Ttypeval,
    typename std::enable_if<(sizeof(_Ttypeval) == sizeof(cuint32))>::type> {
    using type = cuint32;
};

template <typename _Ttypeval>
struct cunsigned_t<
    _Ttypeval,
    typename std::enable_if<(sizeof(_Ttypeval) >= sizeof(cuint64))>::type> {
    using type = cuint64;
};

template <typename>
struct is_vector : std::false_type {};

template <typename T, typename A>
struct is_vector<std::vector<T, A>> : std::true_type {};

template <typename T>
struct is_mallocable {
    static constexpr bool value =
        std::is_fundamental<T>::value || is_any_one_complex<T>::value;
};

/**
 * @brief Wrapper for evaluating appropriate complex type
 * @tparam _Ttypeval generic type
 */
template <typename T1, typename T2, class = void>
struct eval_complex_t {
#define MX_SZ decltype(max_size_t<T1, T2>::value)
    static constexpr auto value = []() {
        if constexpr (is_any_one_floating_complex<T1, T2>::value) {
            return static_cast<typename complex_floating_t<MX_SZ>::type>(0);
        } else if constexpr (is_any_one_unsigned_complex<T1, T2>::value) {
            if constexpr (is_any_one_floating<T1, T2>::value) {
                return static_cast<typename complex_floating_t<MX_SZ>::type>(0);
            }

            return static_cast<typename cunsigned_t<MX_SZ>::type>(0);
        }
        if constexpr (is_any_one_floating<T1, T2>::value) {
            return static_cast<typename complex_floating_t<MX_SZ>::type>(0);
        }
        return static_cast<typename complex_signed_t<MX_SZ>::type>(0);
    }();
#undef MX_SZ
};

/**
 * @brief Evaluate resultant type of element, given two types
 * @tparam T1 first type
 * @tparam T2 second type
 * @todo improve complex logic
 */
template <typename T1, typename T2, class = void>
struct eval_resultant_t {
#define MX_SZ decltype(max_size_t<T1, T2>::value)
    static constexpr auto value = []() {
        if constexpr (is_any_one_complex<T1, T2>::value) {
            return eval_complex_t<T1, T2>::value;
        } else if constexpr (is_any_one_floating<T1, T2>::value) {
            return static_cast<typename floating_t<MX_SZ>::type>(0);
        } else if constexpr (is_any_one_signed<T1, T2>::value) {
            return static_cast<typename signed_t<MX_SZ>::type>(0);
        } else {
            return static_cast<typename unsigned_t<MX_SZ>::type>(0);
        }
    }();

#undef MX_SZ
};

}  // namespace MdTypeInfer

typedef char i8;
typedef unsigned char u8;
typedef short int i16;
typedef short unsigned int u16;
typedef int i32;
typedef unsigned u32;
typedef long long int i64;
typedef unsigned long long u64;
typedef float f32;
typedef double f64;
typedef long double f128;
typedef cdouble c64;
typedef clongdouble c128;
typedef cfloat c32;
typedef cint8 ci8;
typedef cint16 ci16;
typedef cint32 ci32;
typedef cint64 ci64;
typedef cuint8 cu8;
typedef cuint16 cu16;
typedef cuint32 cu32;
typedef cuint64 cu64;
typedef size_t usize;

#endif
