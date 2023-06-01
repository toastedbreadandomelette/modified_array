#pragma once
#ifndef _MD_COMPLEX_HPP_
#define _MD_COMPLEX_HPP_

#include <cmath>
#include <ostream>

template <typename _T,
          class = typename std::enable_if<std::is_arithmetic<_T>::value>::type>
struct Complex {
    _T real{}, img{};

    constexpr Complex() = default;

    constexpr Complex(const _T __other) : real(__other) {}

    constexpr Complex(const _T r, const _T i) : real(r), img(i) {}

    template <typename _T1>
    constexpr Complex(const Complex<_T1>& __other)
        : real(__other.real), img(__other.img) {}

    template <typename _T1>
    inline constexpr Complex<_T>& operator=(const Complex<_T1>& __other) {
        real = __other.real;
        img = __other.img;
        return *this;
    }

    inline constexpr operator _T() const { return real; }

    template <typename _T1>
    inline constexpr operator Complex() const {
        return Complex<_T>(real, img);
    }

    template <typename _T1>
    inline Complex<_T>& operator=(const _T1& __other) {
        real = __other;
        img = 0;
        return *this;
    }

    template <typename _T1>
    inline constexpr auto operator+(const Complex<_T1>& __other) const {
        return Complex(real + __other.real, img + __other.img);
    }

    template <typename _T1, class>
    inline constexpr auto operator+(const _T1& __other) const {
        return Complex(real + __other, img);
    }

    template <typename _T1>
    inline Complex& operator+=(const Complex<_T1>& __other) {
        real += __other.real;
        img += __other.img;
        return *this;
    }

    template <typename _T1>
    inline constexpr Complex& operator+=(const _T1& __other) {
        real += __other;
        return *this;
    }

    template <typename _T1>
    inline constexpr auto operator-(const Complex<_T1>& __other) const {
        return Complex(real - __other.real, img - __other.img);
    }

    template <typename _T1>
    inline constexpr auto operator-() const {
        return Complex(-real, -img);
    }

    template <typename _T1>
    inline constexpr auto operator-(const _T1& __other) const {
        return Complex(real - __other, img);
    }

    template <typename _T1>
    inline constexpr Complex& operator-=(const Complex<_T1>& __other) {
        real -= __other.real;
        img -= __other.img;
        return *this;
    }

    template <typename _T1>
    inline constexpr Complex& operator-=(const _T1& __other) {
        real -= __other;
        return *this;
    }

    template <typename _T1>
    inline constexpr auto operator*(const Complex<_T1>& __other) const {
        return Complex(real * __other.real - img * __other.img,
                       real * __other.img + img * __other.real);
    }

    template <typename _T1>
    inline constexpr auto operator*(const _T1& __other) const {
        return Complex<_T>(real * __other, img * __other);
    }

    template <typename _T1>
    inline constexpr Complex& operator*=(const Complex<_T1>& __other) {
        const auto temp = real * __other.real - img * __other.img;
        img = img * __other.real + real * __other.img;
        real = temp;
        return *this;
    }

    template <typename _T1>
    inline constexpr Complex& operator*=(const _T1& __other) {
        real *= __other;
        img *= __other;
        return *this;
    }

    template <typename _T1>
    inline auto operator/(const Complex<_T1>& __other) const {
        const auto sq_abs =
            (__other.real * __other.real + __other.img * __other.img);
        return Complex<_T>((real * __other.real + img * __other.img) / sq_abs,
                           (real * __other.img - img * __other.real) / sq_abs);
    }

    template <typename _T1>
    inline auto operator/(const _T1& __other) const {
        return Complex<_T>(real / __other, img / __other);
    }

    template <typename _T1>
    inline Complex& operator/=(const Complex<_T1>& __other) {
        const auto sq_abs =
            (__other.real * __other.real + __other.img * __other.img);
        const auto temp = real * __other.real + img * __other.img;
        img *= __other.real;
        img += real * __other.img;
        img /= sq_abs;
        real = temp / sq_abs;
        return *this;
    }

    inline constexpr std::pair<double, double> to_polar() const {
        return {abs(), ::atan(img / real)};
    }

    static inline constexpr Complex from_polar(const double __R,
                                               const double __A) {
        return {__R * ::cos(__A), __R * ::sin(__A)};
    }

    template <typename _T1>
    static inline constexpr Complex<_T1> conj(const Complex<_T1>& __other) {
        return Complex<_T1>(__other.real, -__other.img);
    }

    inline constexpr double sq_abs() const { return real * real + img * img; }

    inline constexpr double abs() const {
        return ::sqrt(real * real + img * img);
    }

    template <typename _T1>
    inline Complex& operator/=(const _T1& __other) {
        real /= __other;
        img /= __other;
        return *this;
    }

    template <typename _T1>
    inline constexpr bool operator==(const Complex<_T1>& __other) {
        return __other.real == real && __other.img == img;
    }

    template <typename T1>
    inline constexpr bool operator==(const T1& other) {
        return other == real && img == 0;
    }

    template <typename _T1>
    inline constexpr bool operator!=(const Complex<_T1>& __other) {
        return __other.real != real || __other.img != img;
    }

    template <typename _T1>
    inline constexpr bool operator!=(const _T1& __other) {
        return __other != real || img != 0;
    }

    friend std::ostream& operator<<(std::ostream& op, const Complex& c) {
        if (c.img < 0) {
            op << c.real << '-' << (-c.img) << 'j';
        } else {
            op << c.real << '+' << c.img << 'j';
        }
        return op;
    }
};

namespace std {

template <typename T>
inline constexpr Complex<T> sqrt(const Complex<T>& __other) {
    const auto polar = __other.to_polar();
    return Complex<T>::from_polar(std::sqrt(polar.first), polar.second / 2);
}

template <typename T>
inline constexpr Complex<T> pow(const Complex<T>& __other, double value) {
    const auto [__R, __A] = __other.to_polar();
    return Complex<T>::from_polar(std::pow(__R, value), __A * value);
}

template <typename T>
inline constexpr Complex<T> abs(const Complex<T>& __other) {
    return __other.abs();
}
}  // namespace std

template <typename _T, typename _T1,
          class = typename std::enable_if<std::is_arithmetic<_T1>::value>::type>
inline constexpr auto operator+(const _T1& __other,
                                const Complex<_T>& __first) {
    return Complex<_T>(__other + __first.real, __first.img);
}

template <typename _T, typename _T1,
          class = typename std::enable_if<std::is_arithmetic<_T1>::value>::type>
inline constexpr Complex<_T> operator-(const _T1& __other,
                                       const Complex<_T>& __first) {
    return Complex<_T>(__other - __first.real, -__first.img);
}

template <typename _T, typename _T1,
          class = typename std::enable_if<std::is_arithmetic<_T1>::value>::type>
inline constexpr auto operator*(const _T1& __other,
                                const Complex<_T>& __first) {
    return Complex<_T>(__first.real * __other, __first.img * __other);
}

template <typename _T, typename _T1,
          class = typename std::enable_if<std::is_arithmetic<_T1>::value>::type>
inline constexpr auto operator/(const _T1& __other,
                                const Complex<_T>& __first) {
    const auto sq_abs = __first.real * __first.real + __first.img * __first.img;
    return Complex<_T>((__other * __first.real) / sq_abs,
                       -((__other * __first.img) / sq_abs));
}

inline constexpr Complex<long double> operator"" _i(long double img) {
    Complex<long double> c;
    c.real = 0;
    c.img = img;
    return c;
}

inline constexpr Complex<unsigned long long> operator"" _i(
    unsigned long long img) {
    Complex<unsigned long long> c;
    c.real = 0;
    c.img = img;
    return c;
}

using cdouble = Complex<double>;
using clongdouble = Complex<long double>;
using cfloat = Complex<float>;

using cuint64 = Complex<uint64_t>;
using cuint32 = Complex<uint32_t>;
using cuint16 = Complex<uint16_t>;
using cuint8 = Complex<uint8_t>;

using cint64 = Complex<int64_t>;
using cint32 = Complex<int32_t>;
using cint16 = Complex<int16_t>;
using cint8 = Complex<int8_t>;

template <>
struct std::is_fundamental<cdouble> : std::true_type {};
template <>
struct std::is_fundamental<clongdouble> : std::true_type {};

#endif
