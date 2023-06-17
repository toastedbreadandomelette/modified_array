#pragma once
#ifndef _MD_ST_REFERENCE_HPP_
#define _MD_ST_REFERENCE_HPP_

#include "../../md_complex/md_complex.hpp"
#include "./md_static_array.hpp"
#include "./md_type_inference.hpp"

template <typename T>
class ArraySlice {
    template <typename T1>
    friend class MdStaticArray;
    template <typename T1>
    friend class ArraySlice;

    friend struct MdArrayUtility;
    friend struct MdLinearAlgebra;
    friend struct FFT;

    void *operator new(usize size);
    const MdStaticArray<T> *__array_reference;
    usize size;
    usize offset;
    u16 shp_offset;

 public:
    ArraySlice() {}

    ArraySlice(const MdStaticArray<T> &other, const usize offst) {
        __array_reference = &other;
        offset = offst;
        size = other.get_size() / other.shape[0];
        shp_offset = 1;
    }

    ArraySlice(const ArraySlice<T> &other, const usize offst) {
        __array_reference = other.__array_reference;
        offset = offst;
        shp_offset = other.shp_offset + 1;
        size = other.size / (other.__array_reference->shape[shp_offset - 1]);
    }

    ArraySlice(const ArraySlice<T> &other) {
        __array_reference = other.__array_reference;
        offset = other.offset;
        shp_offset = other.shp_offset;
        size = other.size;
    }

    /**
     * @brief Improve copy operator: support broadcasting
     */
    ArraySlice &operator=(const ArraySlice<T> &other) {
        __array_reference = other.__array_reference;
        offset = other.offset;
        shp_offset = other.shp_offset;
        size = other.size;

        return *this;
    }

    template <typename T1>
    inline ArraySlice &operator=(const MdStaticArray<T1> &value) {
        if (value.get_size() != size) {
            throw std::runtime_error(
                "Assignment error between ArraySlice of size " +
                std::to_string(size) + " and MdStaticArray of size " +
                std::to_string(value.get_size()));
        }
        // assert shape sizes are equal too

        for (usize i = 0; i < size; ++i) {
            __array_reference->__array[offset + i] = value.__array[i];
        }

        return *this;
    }

    template <typename T1>
    ArraySlice &operator=(const T1 other) {
        if (size == 1) {
            __array_reference->__array[offset] = other;
            return *this;
        }

        for (usize i = 0; i < size; ++i) {
            __array_reference->__array[offset + i] = other;
        }
        return *this;
    }

    inline ArraySlice operator[](const usize index) const {
        if (shp_offset >= __array_reference->shp_size) {
            char c[100];
            sprintf(c, "Expected dimension %d, found %d", shp_offset + 1,
                    __array_reference->shp_size);
            throw std::runtime_error(c);
        }
        if (index >= __array_reference->shape[shp_offset]) {
            throw std::runtime_error(
                "Index out of bounds while accessing index " +
                std::to_string(index) + " ( >= " +
                std::to_string(__array_reference->shape[shp_offset]) + ")");
        }

        return ArraySlice<T>(
            *this, offset + index * __array_reference->skip_vec[shp_offset]);
    }

    // To do: efficient printing
    friend std::ostream &operator<<(std::ostream &op, const ArraySlice<T> &ot) {
        // op << "here " << ot.size << '\n';
        if (ot.size == 1) {
            op << ot.__array_reference->__array[ot.offset];
        } else if (ot.shp_offset + 1 == ot.__array_reference->shp_size) {
            op << '[';
            for (usize index = 0, stride = ot.offset;
                 index < ot.__array_reference->shape[ot.shp_offset];
                 ++index, stride +=
                          ot.__array_reference->skip_vec[ot.shp_offset]) {
                op << ot.__array_reference->__array[stride];
                if (index != ot.size - 1) {
                    op << ", ";
                }
            }
            op << ']';
        } else {
            op << '[';
            for (usize index = 0;
                 index < ot.__array_reference->shape[ot.shp_offset]; ++index) {
                op << ot[index];
                if (index != ot.__array_reference->shape[ot.shp_offset] - 1) {
                    op << ",\n";
                }
            }
            op << "]";
        }
        return op;
    }

    inline operator T() const {
        if (size > 1) {
            throw std::runtime_error("Error casting element. Size found " +
                                     std::to_string(size));
        }
        return __array_reference->__array[offset];
    }

    /**
     * @brief Return constant value
     */
    template <typename T1>
    inline operator T1() const {
        if (size > 1) {
            throw std::runtime_error("Error casting element. Size found " +
                                     std::to_string(size));
        }
        return __array_reference->__array[offset];
    }

    inline operator MdStaticArray<T>() const {
        return MdStaticArray<T>(*__array_reference);
    }

    /**
     * @brief Return MdStaticArray value
     */
    template <typename T1>
    inline operator MdStaticArray<T1>() const {
        return MdStaticArray<T1>(*__array_reference);
    }

    template <typename T1>
    inline auto operator+(const MdStaticArray<T1> &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) + other;
    }

    inline auto operator+(const ArraySlice<T> &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) +
               MdStaticArray(*other.__array_reference, other.offset,
                             other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline auto operator+(const T1 &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) + other;
    }

    template <typename T1>
    inline auto operator-(const MdStaticArray<T1> &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) - other;
    }

    inline auto operator-(const ArraySlice<T> &other) const {
        if (size == 1 && other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] -
                       other.__array_reference->__array[other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) -
               MdStaticArray(*other.__array_reference, other.offset,
                             other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline auto operator-(const T1 &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) - other;
    }

    template <typename T1>
    inline auto operator*(const MdStaticArray<T1> &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) * other;
    }

    inline auto operator*(const ArraySlice<T> &other) const {
        if (size == 1 && other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] *
                       other.__array_reference->__array[other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) *
               MdStaticArray(*other.__array_reference, other.offset,
                             other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline auto operator*(const T1 &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) * other;
    }

    template <typename T1>
    inline auto operator/(const MdStaticArray<T1> &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) / other;
    }

    inline auto operator/(const ArraySlice<T> &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) /
               MdStaticArray(*other.__array_reference, other.offset,
                             other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline auto operator/(const T1 &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) / other;
    }

    template <typename T1>
    inline auto operator%(const MdStaticArray<T1> &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) % other;
    }

    inline auto operator%(const ArraySlice<T> &other) const {
        if (size == 1 && other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] /
                       other.__array_reference->__array[other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) %
               MdStaticArray(*other.__array_reference, other.offset,
                             other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline auto operator%(const T1 &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) % other;
    }

    template <typename T1>
    inline auto operator&(const MdStaticArray<T1> &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) & other;
    }

    inline auto operator&(const ArraySlice<T> &other) const {
        if (size == 1 && other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] &
                       other.__array_reference->__array[other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) &
               MdStaticArray(*other.__array_reference, other.offset,
                             other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline auto operator&(const T1 &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) & other;
    }

    template <typename T1>
    inline auto operator|(const MdStaticArray<T1> &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) | other;
    }

    inline auto operator|(const ArraySlice<T> &other) const {
        if (size == 1 && other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] |
                       other.__array_reference->__array[other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) |
               MdStaticArray(*other.__array_reference, other.offset,
                             other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline auto operator|(const T1 &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) | other;
    }

    template <typename T1>
    inline auto operator^(const MdStaticArray<T1> &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) ^ other;
    }

    inline auto operator^(const ArraySlice<T> &other) const {
        if (size == 1 && other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] ^
                       other.__array_reference->__array[other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) ^
               MdStaticArray(*other.__array_reference, other.offset,
                             other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline auto operator^(const T1 &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) ^ other;
    }

    template <typename T1>
    inline auto operator<<(const MdStaticArray<T1> &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) << other;
    }

    inline auto operator<<(const ArraySlice<T> &other) const {
        if (size == 1 && other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset]
                       << other.__array_reference->__array[other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset)
               << MdStaticArray(*other.__array_reference, other.offset,
                                other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline auto operator<<(const T1 &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) << other;
    }

    template <typename T1>
    inline auto operator>>(const MdStaticArray<T1> &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) >> other;
    }

    inline auto operator>>(const ArraySlice<T> &other) const {
        if (size == 1 && other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] >>
                       other.__array_reference->__array[other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) >>
               MdStaticArray(*other.__array_reference, other.offset,
                             other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline auto operator>>(const T1 &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) >> other;
    }

    template <typename T1>
    inline auto operator!=(const MdStaticArray<T1> &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset)
            .comp_neq_internal_(other);
    }

    inline auto operator!=(const ArraySlice<T> &other) const {
        if (size == 1 && other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] !=
                       other.__array_reference->__array[other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset)
            .comp_neq_internal_(MdStaticArray(*other.__array_reference,
                                              other.offset, other.shp_offset));
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline MdStaticArray<bool> operator!=(const T1 &other) const {
        if (size == 1) {
            return MdStaticArray(1,
                                 __array_reference->__array[offset] != other);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset)
            .comp_neq_iinternal_(other);
    }

    template <typename T1>
    inline auto operator==(const MdStaticArray<T1> &other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset)
            .comp_eq_internal_(other);
    }

    inline MdStaticArray<bool> operator==(const ArraySlice<T> &other) const {
        if (size == 1 && other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] ==
                       other.__array_reference->__array[other.offset]);
        }
        return MdStaticArray<T>(*__array_reference, offset, shp_offset)
            .comp_eq_internal_(MdStaticArray(*other.__array_reference,
                                             other.offset, other.shp_offset));
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline MdStaticArray<bool> operator==(const T1 &other) const {
        if (size == 1) {
            return MdStaticArray(1,
                                 __array_reference->__array[offset] == other);
        }
        return MdStaticArray<T>(*__array_reference, offset, shp_offset)
            .comp_eq_iinternal_(other);
    }

    template <typename T1>
    inline ArraySlice &operator+=(MdStaticArray<T1> &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .add_self_internal_(other);
        return *this;
    }

    inline ArraySlice &operator+=(ArraySlice &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .add_self_internal_(MdStaticArray(*other.__array_reference,
                                              other.offset, other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline ArraySlice &operator+=(const T1 &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .add_self_iinternal_(other);
        return *this;
    }

    template <typename T1>
    inline ArraySlice &operator-=(const MdStaticArray<T1> &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .sub_self_internal_(other);
        return *this;
    }

    inline ArraySlice &operator-=(ArraySlice &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .sub_self_internal_(MdStaticArray(*other.__array_reference,
                                              other.offset, other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline ArraySlice &operator-=(const T1 &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .sub_self_iinternal_(other);
        return *this;
    }

    template <typename T1>
    inline ArraySlice &operator*=(const MdStaticArray<T1> &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .mul_self_internal_(other);
        return *this;
    }

    inline ArraySlice &operator*=(const ArraySlice<T> &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .mul_self_internal_(MdStaticArray(*other.__array_reference,
                                              other.offset, other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline ArraySlice &operator*=(const T1 &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .mul_self_iinternal_(other);
        return *this;
    }

    template <typename T1>
    inline ArraySlice &operator/=(const MdStaticArray<T1> &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .div_self_internal_(other);
        return *this;
    }

    inline ArraySlice &operator/=(const ArraySlice<T> &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .div_self_internal_(MdStaticArray(*other.__array_reference,
                                              other.offset, other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline ArraySlice &operator/=(const T1 &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .div_self_iinternal_(other);
        return *this;
    }

    template <typename T1>
    inline ArraySlice &operator%=(const MdStaticArray<T1> &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .mod_self_internal_(other);
        return *this;
    }

    inline ArraySlice &operator%=(const ArraySlice<T> &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .mod_self_internal_(MdStaticArray(*other.__array_reference,
                                              other.offset, other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline ArraySlice &operator%=(const T1 &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .mod_self_iinternal_(other);
        return *this;
    }

    template <typename T1>
    inline ArraySlice &operator&=(const MdStaticArray<T1> &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .and_bit_self_internal_(other);
        return *this;
    }

    inline ArraySlice &operator&=(const ArraySlice<T> &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .and_bit_self_internal_(MdStaticArray(
                *other.__array_reference, other.offset, other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline ArraySlice &operator&=(const T1 &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .and_bit_self_iinternal_(other);
        return *this;
    }

    template <typename T1>
    inline ArraySlice &operator|=(const MdStaticArray<T1> &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .or_bit_self_internal_(other);
        return *this;
    }

    inline ArraySlice &operator|=(const ArraySlice<T> &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .or_bit_self_internal_(MdStaticArray(
                *other.__array_reference, other.offset, other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline ArraySlice &operator|=(const T1 &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .or_bit_self_iinternal_(other);
        return *this;
    }

    template <typename T1>
    inline ArraySlice &operator^=(const MdStaticArray<T1> &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .xor_bit_self_internal_(other);
        return *this;
    }

    inline ArraySlice &operator^=(const ArraySlice<T> &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .xor_bit_self_internal_(MdStaticArray(
                *other.__array_reference, other.offset, other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline ArraySlice &operator^=(const T1 &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .xor_bit_self_iinternal_(other);
        return *this;
    }

    template <typename T1>
    inline ArraySlice &operator<<=(const MdStaticArray<T1> &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .lshft_bit_self_internal_(other);
        return *this;
    }

    inline ArraySlice &operator<<=(const ArraySlice<T> &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .lshft_bit_self_internal_(MdStaticArray(
                *other.__array_reference, other.offset, other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline ArraySlice &operator<<=(const T1 &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .lshft_bit_self_iinternal_(other);
        return *this;
    }

    template <typename T1>
    inline ArraySlice &operator>>=(const MdStaticArray<T1> &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .rshft_bit_self_internal_(other);
        return *this;
    }

    inline ArraySlice &operator>>=(const ArraySlice<T> &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .rshft_bit_self_internal_(MdStaticArray(
                *other.__array_reference, other.offset, other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<
                               !std::is_same<T1, ArraySlice<T>>::value>::type>
    inline ArraySlice &operator>>=(const T1 &other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .rshft_bit_self_iinternal_(other);
        return *this;
    }

    inline usize get_size() const { return size; }

    ~ArraySlice() { __array_reference = nullptr; }

    template <typename T1, typename T2>
    friend inline auto &operator+=(T1 &other, const ArraySlice<T2> &first);

    template <typename T1, typename T2>
    friend inline auto &operator-=(T1 &other, const ArraySlice<T2> &first);

    template <typename T1, typename T2>
    friend inline auto &operator*=(T1 &other, const ArraySlice<T2> &first);

    template <typename T1, typename T2>
    friend inline auto &operator/=(T1 &other, const ArraySlice<T2> &first);

    template <typename T1, typename T2>
    friend inline auto &operator%=(T1 &other, const ArraySlice<T2> &first);

    template <typename T1, typename T2>
    friend inline auto &operator<<=(T1 &other, const ArraySlice<T2> &first);

    template <typename T1, typename T2>
    friend inline auto &operator>>=(T1 &other, const ArraySlice<T2> &first);

    template <typename T1, typename T2>
    friend inline auto &operator&=(T1 &other, const ArraySlice<T2> &first);

    template <typename T1, typename T2>
    friend inline auto &operator|=(T1 &other, const ArraySlice<T2> &first);

    template <typename T1, typename T2>
    friend inline auto &operator^=(T1 &other, const ArraySlice<T2> &first);

    ///////////////////////////////////////////////////////////////////////////

    template <typename T1, typename T2>
    friend inline auto operator+(const T1 &other, const ArraySlice<T2> &first);

    template <typename T1, typename T2>
    friend inline auto operator-(const T1 &other, const ArraySlice<T2> &first);

    template <typename T1>
    friend inline MdStaticArray<T1> operator-(const ArraySlice<T1> &first);

    template <typename T1, typename T2>
    friend inline auto operator*(const T1 &other, const ArraySlice<T2> &first);

    template <typename T1, typename T2>
    friend inline auto operator/(const T1 &other, const ArraySlice<T2> &first);

    template <typename T1, typename T2>
    friend inline auto operator%(const T1 &other, const ArraySlice<T2> &first);

    template <typename T1, typename T2>
    friend inline auto operator<<(const T1 &other, const ArraySlice<T2> &first);

    template <typename T1, typename T2>
    friend inline auto operator>>(const T1 &other, const ArraySlice<T2> &first);

    template <typename T1, typename T2>
    friend inline auto operator&(const T1 &other, const ArraySlice<T2> &first);

    template <typename T1, typename T2>
    friend inline auto operator|(const T1 &other, const ArraySlice<T2> &first);

    template <typename T1, typename T2>
    friend inline auto operator^(const T1 &other, const ArraySlice<T2> &first);
};

template <typename T1, typename T2>
inline auto operator+(const T1 &other, const ArraySlice<T2> &first) {
    return MdStaticArray<T2>(*first.__array_reference, first.offset,
                             first.shp_offset) +
           other;
}

template <typename T1, typename T2>
inline auto operator-(const T1 &other, const ArraySlice<T2> &first) {
    return -other + MdStaticArray<T2>(*first.__array_reference, first.offset,
                                      first.shp_offset);
}

template <typename T1, typename T2>
inline auto operator*(const T1 &other, const ArraySlice<T2> &first) {
    return MdStaticArray<T2>(*first.__array_reference, first.offset,
                             first.shp_offset)
        .mul_iinternal_(other);
}

template <typename T1, typename T2>
inline auto operator/(const T1 &other, const ArraySlice<T2> &first) {
    return MdStaticArray(*first.__array_reference, first.offset,
                         first.shp_offset)
        .div_iointernal_(other);
}

template <typename T1, typename T2>
inline auto operator%(const T1 &other, const ArraySlice<T2> &first) {
    return MdStaticArray<T2>(*first.__array_reference, first.offset,
                             first.shp_offset)
        .mod_iointernal_(other);
}

template <typename T1, typename T2>
inline auto operator&(const T1 &other, const ArraySlice<T2> &first) {
    return MdStaticArray<T2>(*first.__array_reference, first.offset,
                             first.shp_offset)
        .and_bit_iinternal_(other);
}

template <typename T1, typename T2>
inline auto operator|(const T1 &other, const ArraySlice<T2> &first) {
    return MdStaticArray<T2>(*first.__array_reference, first.offset,
                             first.shp_offset)
        .or_bit_iinternal_(other);
}

template <typename T1, typename T2>
inline auto operator^(const T1 &other, const ArraySlice<T2> &first) {
    return MdStaticArray<T2>(*first.__array_reference, first.offset,
                             first.shp_offset)
        .xor_bit_iinternal_(other);
}

template <typename T1, typename T2>
inline auto operator<<(const T1 &other, const ArraySlice<T2> &first) {
    return MdStaticArray<T2>(*first.__array_reference, first.offset,
                             first.shp_offset)
        .lshft_bit_iointernal_(other);
}

template <typename T1, typename T2>
inline auto operator>>(const T1 &other, const ArraySlice<T2> &first) {
    return MdStaticArray<T2>(*first.__array_reference, first.offset,
                             first.shp_offset)
        .rshft_bit_iointernal_(other);
}

template <typename T>
inline MdStaticArray<T> operator-(const ArraySlice<T> &first) {
    return MdStaticArray<T>(*first.__array_reference, first.offset,
                            first.shp_offset)
        .ng_internal_();
}

#endif
