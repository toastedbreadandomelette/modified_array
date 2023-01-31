#pragma once
#ifndef _MD_COMPLEX_HPP_
#define _MD_COMPLEX_HPP_

#include <ostream>

template <typename _T,
          class = typename std::enable_if<std::is_arithmetic<_T>::value>::type>
struct MdComplex {
    _T real{}, img{};

    constexpr MdComplex() = default;

    constexpr MdComplex(const _T __other) : real(__other) {}

    constexpr MdComplex(const _T r, const _T i) : real(r), img(i) {}

    template <typename _T1>
    constexpr MdComplex(const MdComplex<_T1>& __other)
        : real(__other.real), img(__other.img) {}

    template <typename _T1>
    inline constexpr MdComplex<_T>& operator=(const MdComplex<_T1>& __other) {
        real = __other.real;
        img = __other.img;
        return *this;
    }

    inline constexpr operator _T() const { return real; }

    template <typename _T1>
    inline constexpr operator MdComplex() const {
        return MdComplex<_T>(real, img);
    }

    template <typename _T1>
    inline MdComplex<_T>& operator=(const _T1& __other) {
        real = __other;
        img = 0;
        return *this;
    }

    template <typename _T1>
    inline constexpr auto operator+(const MdComplex<_T1>& __other) const {
        return MdComplex(real + __other.real, img + __other.img);
    }

    template <typename _T1, class>
    inline constexpr auto operator+(const _T1& __other) const {
        return MdComplex(real + __other, img);
    }

    template <typename _T1>
    inline MdComplex& operator+=(const MdComplex<_T1>& __other) {
        real += __other.real;
        img += __other.img;
        return *this;
    }

    template <typename _T1>
    inline constexpr MdComplex& operator+=(const _T1& __other) {
        real += __other;
        return *this;
    }

    template <typename _T1>
    inline constexpr auto operator-(const MdComplex<_T1>& __other) const {
        return MdComplex(real - __other.real, img - __other.img);
    }

    template <typename _T1>
    inline constexpr auto operator-() const {
        return MdComplex(-real, -img);
    }

    template <typename _T1>
    inline constexpr auto operator-(const _T1& __other) const {
        return MdComplex(real - __other, img);
    }

    template <typename _T1>
    inline constexpr MdComplex& operator-=(const MdComplex<_T1>& __other) {
        real -= __other.real;
        img -= __other.img;
        return *this;
    }

    template <typename _T1>
    inline constexpr MdComplex& operator-=(const _T1& __other) {
        real -= __other;
        return *this;
    }

    template <typename _T1>
    inline constexpr auto operator*(const MdComplex<_T1>& __other) const {
        return MdComplex<_T>(real * __other.real - img * __other.img,
                             real * __other.img + img * __other.real);
    }

    template <typename _T1>
    inline constexpr auto operator*(const _T1& __other) const {
        return MdComplex<_T>(real * __other, img * __other);
    }

    template <typename _T1>
    inline constexpr MdComplex& operator*=(const MdComplex<_T1>& __other) {
        const auto temp = real * __other.real - img * __other.img;
        img = img * __other.real + real * __other.img;
        real = temp;
        return *this;
    }

    template <typename _T1>
    inline constexpr MdComplex& operator*=(const _T1& __other) {
        real *= __other;
        img *= __other;
        return *this;
    }

    template <typename _T1>
    inline auto operator/(const MdComplex<_T1>& __other) const {
        const auto sq_abs =
            (__other.real * __other.real + __other.img * __other.img);
        return MdComplex<_T>(
            (real * __other.real + img * __other.img) / sq_abs,
            (real * __other.img - img * __other.real) / sq_abs);
    }

    template <typename _T1>
    inline auto operator/(const _T1& __other) const {
        return MdComplex<_T>(real / __other, img / __other);
    }

    template <typename _T1>
    inline MdComplex& operator/=(const MdComplex<_T1>& __other) {
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
        return {abs(), std::atan(img / real)};
    }

    static inline constexpr MdComplex from_polar(const double __R,
                                                 const double __A) {
        return {__R * std::cos(__A), __R * std::sin(__A)};
    }

    template <typename _T1>
    static inline constexpr MdComplex<_T1> conj(const MdComplex<_T1>& __other) {
        return MdComplex<_T1>(__other.real, -__other.img);
    }

    inline constexpr double sq_abs() const { return real * real + img * img; }

    inline constexpr double abs() const {
        return std::sqrt(real * real + img * img);
    }

    template <typename _T1>
    inline MdComplex& operator/=(const _T1& __other) {
        real /= __other;
        img /= __other;
        return *this;
    }

    friend std::ostream& operator<<(std::ostream& op, const MdComplex& c) {
        if (c.img < 0) {
            op << c.real << '-' << (-c.img) << 'i';
        } else {
            op << c.real << '+' << c.img << 'i';
        }
        return op;
    }
};

namespace std {

template <typename _T>
inline constexpr MdComplex<_T> sqrt(const MdComplex<_T>& __other) {
    const auto polar = __other.to_polar();
    return MdComplex<_T>::from_polar(std::sqrt(polar.first), polar.second / 2);
}

template <typename _T>
inline constexpr MdComplex<_T> pow(const MdComplex<_T>& __other, double value) {
    const auto [__R, __A] = __other.to_polar();
    return MdComplex<_T>::from_polar(std::pow(__R, value), __A * value);
}

template <typename _T>
inline constexpr MdComplex<_T> abs(const MdComplex<_T>& __other) {
    return __other.abs();
}
}  // namespace std

template <typename _T, typename _T1,
          class = typename std::enable_if<std::is_arithmetic<_T1>::value>::type>
inline constexpr auto operator+(const _T1& __other,
                                const MdComplex<_T>& __first) {
    return MdComplex<_T>(__other + __first.real, __first.img);
}

template <typename _T, typename _T1,
          class = typename std::enable_if<std::is_arithmetic<_T1>::value>::type>
inline constexpr MdComplex<_T> operator-(const _T1& __other,
                                         const MdComplex<_T>& __first) {
    return MdComplex<_T>(__other - __first.real, -__first.img);
}

template <typename _T, typename _T1,
          class = typename std::enable_if<std::is_arithmetic<_T1>::value>::type>
inline constexpr auto operator*(const _T1& __other,
                                const MdComplex<_T>& __first) {
    return MdComplex<_T>(__first.real * __other, __first.img * __other);
}

template <typename _T, typename _T1,
          class = typename std::enable_if<std::is_arithmetic<_T1>::value>::type>
inline constexpr auto operator/(const _T1& __other,
                                const MdComplex<_T>& __first) {
    const auto sq_abs = __first.real * __first.real + __first.img * __first.img;
    return MdComplex<_T>((__other * __first.real) / sq_abs,
                         -((__other * __first.img) / sq_abs));
}

inline constexpr MdComplex<long double> operator"" _i(long double img) {
    MdComplex<long double> c;
    c.real = 0;
    c.img = img;
    return c;
}

inline constexpr MdComplex<unsigned long long> operator"" _i(
    unsigned long long img) {
    MdComplex<unsigned long long> c;
    c.real = 0;
    c.img = img;
    return c;
}

using cdouble = MdComplex<double>;
using clongdouble = MdComplex<long double>;
using cfloat = MdComplex<float>;

using cuint64 = MdComplex<uint64_t>;
using cuint32 = MdComplex<uint32_t>;
using cuint16 = MdComplex<uint16_t>;
using cuint8 = MdComplex<uint8_t>;

using cint64 = MdComplex<int64_t>;
using cint32 = MdComplex<int32_t>;
using cint16 = MdComplex<int16_t>;
using cint8 = MdComplex<int8_t>;

template <>
struct std::is_fundamental<cdouble> : std::true_type {};

#endif
