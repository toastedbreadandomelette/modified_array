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
    inline MdComplex<_T>& operator=(const MdComplex<_T1>& __other) {
        real = __other.real;
        img = __other.img;
        return *this;
    }

    inline operator _T() const { return real; }

    template <typename _T1>
    inline operator MdComplex() const {
        return {real, img};
    }

    template <typename _T1>
    inline MdComplex<_T>& operator=(const _T1& __other) {
        real = __other;
        img = 0;
        return *this;
    }

    template <typename _T1>
    inline auto operator+(const MdComplex<_T1>& __other) const {
        return {real + __other.real, img + __other.img};
    }

    template <typename _T1>
    inline auto operator+(const _T1& __other) const {
        return {real + __other, img};
    }

    template <typename _T1>
    inline MdComplex& operator+=(const MdComplex<_T1>& __other) {
        real += __other.real;
        img += __other.img;
        return *this;
    }

    template <typename _T1>
    inline MdComplex& operator+=(const _T1& __other) {
        real += __other;
        return *this;
    }

    template <typename _T1>
    inline auto operator-(const MdComplex<_T1>& __other) const {
        return {real - __other.real, img - __other.img};
    }

    template <typename _T1>
    inline auto operator-(const _T1& __other) const {
        return {real - __other, img};
    }

    template <typename _T1>
    inline MdComplex& operator-=(const MdComplex<_T1>& __other) {
        real -= __other.real;
        img -= __other.img;
        return *this;
    }

    template <typename _T1>
    inline MdComplex& operator-=(const _T1& __other) {
        real -= __other;
        return *this;
    }

    template <typename _T1>
    inline auto operator*(const MdComplex<_T1>& __other) const {
        return {real * __other.real - img * __other.img,
                real * __other.img + img * __other.real};
    }

    template <typename _T1>
    inline auto operator*(const _T1& __other) const {
        return {real * __other, img * __other};
    }

    template <typename _T1>
    inline MdComplex& operator*=(const MdComplex<_T1>& __other) {
        const auto temp = real * __other.real - img * __other.img;
        img *= __other.real;
        img += real * __other.img;
        real = temp;
        return *this;
    }

    template <typename _T1>
    inline MdComplex& operator*=(const _T1& __other) {
        real *= __other;
        img *= __other;
        return *this;
    }

    template <typename _T1>
    inline auto operator/(const MdComplex<_T1>& __other) const {
        return {(real * __other.real + img * __other.img) /
                    (__other.real * __other.real + __other.img * __other.img),
                (real * __other.img - img * __other.real) /
                    (__other.real * __other.real + __other.img * __other.img)};
    }

    template <typename _T1>
    inline auto operator/(const _T1& __other) const {
        return {real / __other, img / __other};
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

    inline std::pair<double, double> to_polar() const {
        return {abs(), std::atan(img / real)};
    }

    template <typename _T1>
    static MdComplex<_T1> from_polar(const std::pair<double, double>& polar) {
        return {polar.first * std::cos(polar.second),
                polar.first * std::sin(polar.second)};
    }

    inline double sq_abs() const { return real * real + img * img; }

    inline double abs() const { return std::sqrt(real * real + img * img); }

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
inline MdComplex<_T> sqrt(const MdComplex<_T>& __other) {
    const auto polar = __other.to_polar();
    MdComplex<_T>::from_polar(std::sqrt(polar.first), polar.second / 2);
}

template <typename _T>
inline MdComplex<_T> abs(const MdComplex<_T>& __other) {
    return __other.abs();
}
}  // namespace std

template <typename _T, typename _T1>
inline auto operator+(const _T1& __other, const MdComplex<_T>& __first) {
    return MdComplex<_T1>(__other + __first.real, __first.img);
}

template <typename _T, typename _T1>
inline MdComplex<_T1> operator-(const _T1& __other,
                                const MdComplex<_T>& __first) {
    return MdComplex<_T1>(__other - __first.real, -__first.img);
}

template <typename _T, typename _T1>
inline auto operator*(const _T1& __other, const MdComplex<_T>& __first) {
    return MdComplex<_T1>(__first.real * __other, __first.img * __other);
}

template <typename _T, typename _T1>
inline auto operator/(const _T1& __other, const MdComplex<_T>& __first) {
    const auto sq_abs = __first.real * __first.real + __first.img * __first.img;
    return MdComplex<_T1>(__other * __first.real) / sq_abs,
            -(__other * __first.img) / sq_abs);
}

inline MdComplex<long double> operator"" _i(long double img) {
    MdComplex<long double> c;
    c.real = 0;
    c.img = img;
    return c;
}

inline constexpr MdComplex<size_t> operator"" _i(size_t img) {
    MdComplex<size_t> c;
    c.real = 0;
    c.img = img;
    return c;
}

inline constexpr MdComplex<char> operator"" _i(char img) {
    MdComplex<char> c;
    c.real = 0;
    c.img = img;
    return c;
}

using cdouble = MdComplex<double>;
using clongdouble = MdComplex<long double>;
using cfloat = MdComplex<float>;
// using cint = MdComplex<int>;
// using cint64 = MdComplex<int64_t>;
// using cint16 = MdComplex<int16_t>;
// using cint8 = MdComplex<int8_t>;

#endif
