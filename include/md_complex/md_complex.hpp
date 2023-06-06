#pragma once
#ifndef _MD_COMPLEX_HPP_
#define _MD_COMPLEX_HPP_

#include <cmath>
#include <ostream>

template <typename T,
          class = typename std::enable_if<std::is_arithmetic<T>::value>::type>
struct Complex {
    T real{}, img{};

    constexpr Complex() = default;

    constexpr Complex(const T other) : real(other) {}

    constexpr Complex(const T r, const T i) : real(r), img(i) {}

    template <typename T1>
    constexpr Complex(const Complex<T1>& other)
        : real(other.real), img(other.img) {}

    template <typename T1>
    inline constexpr Complex<T>& operator=(const Complex<T1>& other) {
        real = other.real;
        img = other.img;
        return *this;
    }

    inline constexpr operator T() const { return real; }

    template <typename T1>
    inline constexpr operator Complex() const {
        return Complex<T>(real, img);
    }

    template <typename T1>
    inline Complex<T>& operator=(const T1& other) {
        real = other;
        img = 0;
        return *this;
    }

    template <typename T1>
    inline constexpr auto operator+(const Complex<T1>& other) const {
        return Complex(real + other.real, img + other.img);
    }

    template <typename T1, class>
    inline constexpr auto operator+(const T1& other) const {
        return Complex(real + other, img);
    }

    template <typename T1>
    inline Complex& operator+=(const Complex<T1>& other) {
        real += other.real;
        img += other.img;
        return *this;
    }

    template <typename T1>
    inline constexpr Complex& operator+=(const T1& other) {
        real += other;
        return *this;
    }

    template <typename T1>
    inline constexpr auto operator-(const Complex<T1>& other) const {
        return Complex(real - other.real, img - other.img);
    }

    template <typename T1>
    inline constexpr auto operator-() const {
        return Complex(-real, -img);
    }

    template <typename T1>
    inline constexpr auto operator-(const T1& other) const {
        return Complex(real - other, img);
    }

    template <typename T1>
    inline constexpr Complex& operator-=(const Complex<T1>& other) {
        real -= other.real;
        img -= other.img;
        return *this;
    }

    template <typename T1>
    inline constexpr Complex& operator-=(const T1& other) {
        real -= other;
        return *this;
    }

    template <typename T1>
    inline constexpr auto operator*(const Complex<T1>& other) const {
        return Complex(real * other.real - img * other.img,
                       real * other.img + img * other.real);
    }

    template <typename T1>
    inline constexpr auto operator*(const T1& other) const {
        return Complex<T>(real * other, img * other);
    }

    template <typename T1>
    inline constexpr Complex& operator*=(const Complex<T1>& other) {
        const auto temp = real * other.real - img * other.img;
        img = img * other.real + real * other.img;
        real = temp;
        return *this;
    }

    template <typename T1>
    inline constexpr Complex& operator*=(const T1& other) {
        real *= other;
        img *= other;
        return *this;
    }

    template <typename T1>
    inline auto operator/(const Complex<T1>& other) const {
        const auto sq_abs = (other.real * other.real + other.img * other.img);
        return Complex<T>((real * other.real + img * other.img) / sq_abs,
                          (real * other.img - img * other.real) / sq_abs);
    }

    template <typename T1>
    inline auto operator/(const T1& other) const {
        return Complex<T>(real / other, img / other);
    }

    template <typename T1>
    inline Complex& operator/=(const Complex<T1>& other) {
        const auto sq_abs = (other.real * other.real + other.img * other.img);
        const auto temp = real * other.real + img * other.img;
        img *= other.real;
        img += real * other.img;
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

    template <typename T1>
    static inline constexpr Complex<T1> conj(const Complex<T1>& other) {
        return Complex<T1>(other.real, -other.img);
    }

    inline constexpr double sq_abs() const { return real * real + img * img; }

    inline constexpr double abs() const {
        return ::sqrt(real * real + img * img);
    }

    template <typename T1>
    inline Complex& operator/=(const T1& other) {
        real /= other;
        img /= other;
        return *this;
    }

    template <typename T1>
    inline constexpr bool operator==(const Complex<T1>& other) {
        return other.real == real && other.img == img;
    }

    template <typename T1>
    inline constexpr bool operator==(const T1& other) {
        return other == real && img == 0;
    }

    template <typename T1>
    inline constexpr bool operator!=(const Complex<T1>& other) {
        return other.real != real || other.img != img;
    }

    template <typename T1>
    inline constexpr bool operator!=(const T1& other) {
        return other != real || img != 0;
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
inline constexpr Complex<T> sqrt(const Complex<T>& other) {
    const auto polar = other.to_polar();
    return Complex<T>::from_polar(std::sqrt(polar.first), polar.second / 2);
}

template <typename T>
inline constexpr Complex<T> pow(const Complex<T>& other, double value) {
    const auto [__R, __A] = other.to_polar();
    return Complex<T>::from_polar(std::pow(__R, value), __A * value);
}

template <typename T>
inline constexpr Complex<T> abs(const Complex<T>& other) {
    return other.abs();
}
}  // namespace std

template <typename T, typename T1,
          class = typename std::enable_if<std::is_arithmetic<T1>::value>::type>
inline constexpr auto operator+(const T1& other, const Complex<T>& first) {
    return Complex<T>(other + first.real, first.img);
}

template <typename T, typename T1,
          class = typename std::enable_if<std::is_arithmetic<T1>::value>::type>
inline constexpr Complex<T> operator-(const T1& other,
                                      const Complex<T>& first) {
    return Complex<T>(other - first.real, -first.img);
}

template <typename T, typename T1,
          class = typename std::enable_if<std::is_arithmetic<T1>::value>::type>
inline constexpr auto operator*(const T1& other, const Complex<T>& first) {
    return Complex<T>(first.real * other, first.img * other);
}

template <typename T, typename T1,
          class = typename std::enable_if<std::is_arithmetic<T1>::value>::type>
inline constexpr auto operator/(const T1& other, const Complex<T>& first) {
    const auto sq_abs = first.real * first.real + first.img * first.img;
    return Complex<T>((other * first.real) / sq_abs,
                      -((other * first.img) / sq_abs));
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
