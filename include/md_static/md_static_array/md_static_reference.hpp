#pragma once
#ifndef _MD_ST_REFERENCE_HPP_
#define _MD_ST_REFERENCE_HPP_

#include "../../md_complex/md_complex.hpp"
#include "./md_static_array.hpp"
#include "./md_type_inference.hpp"

template <typename T>
class MdStaticArrayReference {
    template <typename T1>
    friend class MdStaticArray;
    template <typename T1>
    friend class MdStaticArrayReference;

    friend struct MdArrayUtility;
    friend struct MdLinearAlgebra;
    friend struct FFT;

    void *operator new(size_t size);
    const MdStaticArray<T> *__array_reference;
    size_t size;
    size_t offset;
    uint16_t shp_offset;

 public:
    MdStaticArrayReference() {}

    MdStaticArrayReference(const MdStaticArray<T> &__other,
                           const size_t offst) {
        __array_reference = &__other;
        offset = offst;
        size = __other.get_size() / __other.shape[0];
        shp_offset = 1;
    }

    MdStaticArrayReference(const MdStaticArrayReference<T> &__other,
                           const size_t offst) {
        __array_reference = __other.__array_reference;
        offset = offst;
        shp_offset = __other.shp_offset + 1;
        size =
            __other.size / (__other.__array_reference->shape[shp_offset - 1]);
    }

    MdStaticArrayReference(const MdStaticArrayReference<T> &__other) {
        __array_reference = __other.__array_reference;
        offset = __other.offset;
        shp_offset = __other.shp_offset;
        size = __other.size;
    }

    /**
     * @brief Improve copy operator: support broadcasting
     */
    MdStaticArrayReference &operator=(
        const MdStaticArrayReference<T> &__other) {
        __array_reference = __other.__array_reference;
        offset = __other.offset;
        shp_offset = __other.shp_offset;
        size = __other.size;

        return *this;
    }

    template <typename T1>
    inline MdStaticArrayReference &operator=(const MdStaticArray<T1> &value) {
        if (value.get_size() != size) {
            throw std::runtime_error(
                "Assignment error between reference of size " +
                std::to_string(size) + " and array of size " +
                std::to_string(value.get_size()));
        }
        // assert shape sizes are equal too
        if (s_threshold_size > size) {
            for (size_t i = 0; i < size; ++i) {
                __array_reference->__array[offset + i] = value.__array[i];
            }
        } else {
#pragma omp parallel for
            for (size_t i = 0; i < size; ++i) {
                __array_reference->__array[offset + i] = value.__array[i];
            }
        }

        return *this;
    }

    template <typename T1>
    MdStaticArrayReference &operator=(const T1 __other) {
        if (size == 1) {
            __array_reference->__array[offset] = __other;
            return *this;
        }
        if (s_threshold_size > size) {
            for (size_t i = 0; i < size; ++i) {
                __array_reference->__array[offset + i] = __other;
            }
        } else {
#pragma omp parallel for
            for (size_t i = 0; i < size; ++i) {
                __array_reference->__array[offset + i] = __other;
            }
        }
        return *this;
    }

    inline MdStaticArrayReference operator[](const size_t index) const {
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

        return MdStaticArrayReference<T>(
            *this, offset + index * __array_reference->skip_vec[shp_offset]);
    }

    // To do: efficient printing
    friend std::ostream &operator<<(std::ostream &op,
                                    const MdStaticArrayReference<T> &ot) {
        // op << "here " << ot.size << '\n';
        if (ot.size == 1) {
            op << ot.__array_reference->__array[ot.offset];
        } else if (ot.shp_offset + 1 == ot.__array_reference->shp_size) {
            op << '[';
            for (size_t index = 0, stride = ot.offset;
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
            for (size_t index = 0;
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
     * @brief Return array value
     */
    template <typename T1>
    inline operator MdStaticArray<T1>() const {
        return MdStaticArray<T1>(*__array_reference);
    }

    template <typename T1>
    inline auto operator+(const MdStaticArray<T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) + __other;
    }

    inline auto operator+(const MdStaticArrayReference<T> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) +
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline auto operator+(const T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) + __other;
    }

    template <typename T1>
    inline auto operator-(const MdStaticArray<T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) - __other;
    }

    inline auto operator-(const MdStaticArrayReference<T> &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] -
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) -
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline auto operator-(const T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) - __other;
    }

    template <typename T1>
    inline auto operator*(const MdStaticArray<T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) * __other;
    }

    inline auto operator*(const MdStaticArrayReference<T> &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] *
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) *
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline auto operator*(const T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) * __other;
    }

    template <typename T1>
    inline auto operator/(const MdStaticArray<T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) / __other;
    }

    inline auto operator/(const MdStaticArrayReference<T> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) /
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline auto operator/(const T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) / __other;
    }

    template <typename T1>
    inline auto operator%(const MdStaticArray<T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) % __other;
    }

    inline auto operator%(const MdStaticArrayReference<T> &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] /
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) %
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline auto operator%(const T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) % __other;
    }

    template <typename T1>
    inline auto operator&(const MdStaticArray<T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) & __other;
    }

    inline auto operator&(const MdStaticArrayReference<T> &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] &
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) &
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline auto operator&(const T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) & __other;
    }

    template <typename T1>
    inline auto operator|(const MdStaticArray<T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) | __other;
    }

    inline auto operator|(const MdStaticArrayReference<T> &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] |
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) |
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline auto operator|(const T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) | __other;
    }

    template <typename T1>
    inline auto operator^(const MdStaticArray<T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) ^ __other;
    }

    inline auto operator^(const MdStaticArrayReference<T> &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] ^
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) ^
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline auto operator^(const T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) ^ __other;
    }

    template <typename T1>
    inline auto operator<<(const MdStaticArray<T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) << __other;
    }

    inline auto operator<<(const MdStaticArrayReference<T> &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset]
                       << __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset)
               << MdStaticArray(*__other.__array_reference, __other.offset,
                                __other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline auto operator<<(const T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) << __other;
    }

    template <typename T1>
    inline auto operator>>(const MdStaticArray<T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) >> __other;
    }

    inline auto operator>>(const MdStaticArrayReference<T> &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] >>
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) >>
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline auto operator>>(const T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) >> __other;
    }

    template <typename T1>
    inline auto operator!=(const MdStaticArray<T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset)
            .__comp_neq_internal(__other);
    }

    inline auto operator!=(const MdStaticArrayReference<T> &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] !=
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset)
            .__comp_neq_internal(MdStaticArray(*__other.__array_reference,
                                               __other.offset,
                                               __other.shp_offset));
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline MdStaticArray<bool> operator!=(const T1 &__other) const {
        if (size == 1) {
            return MdStaticArray(1,
                                 __array_reference->__array[offset] != __other);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset)
            .__comp_neq_iinternal(__other);
    }

    template <typename T1>
    inline auto operator==(const MdStaticArray<T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset)
            .__comp_eq_internal(__other);
    }

    inline MdStaticArray<bool> operator==(
        const MdStaticArrayReference<T> &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] ==
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray<T>(*__array_reference, offset, shp_offset)
            .__comp_eq_internal(MdStaticArray(*__other.__array_reference,
                                              __other.offset,
                                              __other.shp_offset));
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline MdStaticArray<bool> operator==(const T1 &__other) const {
        if (size == 1) {
            return MdStaticArray(1,
                                 __array_reference->__array[offset] == __other);
        }
        return MdStaticArray<T>(*__array_reference, offset, shp_offset)
            .__comp_eq_iinternal(__other);
    }

    template <typename T1>
    inline MdStaticArrayReference &operator+=(MdStaticArray<T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__add_self_internal(__other);
        return *this;
    }

    inline MdStaticArrayReference &operator+=(MdStaticArrayReference &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__add_self_internal(MdStaticArray(*__other.__array_reference,
                                               __other.offset,
                                               __other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline MdStaticArrayReference &operator+=(const T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__add_self_iinternal(__other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArrayReference &operator-=(
        const MdStaticArray<T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__sub_self_internal(__other);
        return *this;
    }

    inline MdStaticArrayReference &operator-=(MdStaticArrayReference &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__sub_self_internal(MdStaticArray(*__other.__array_reference,
                                               __other.offset,
                                               __other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline MdStaticArrayReference &operator-=(const T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__sub_self_iinternal(__other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArrayReference &operator*=(
        const MdStaticArray<T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__mul_self_internal(__other);
        return *this;
    }

    inline MdStaticArrayReference &operator*=(
        const MdStaticArrayReference<T> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__mul_self_internal(MdStaticArray(*__other.__array_reference,
                                               __other.offset,
                                               __other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline MdStaticArrayReference &operator*=(const T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__mul_self_iinternal(__other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArrayReference &operator/=(
        const MdStaticArray<T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__div_self_internal(__other);
        return *this;
    }

    inline MdStaticArrayReference &operator/=(
        const MdStaticArrayReference<T> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__div_self_internal(MdStaticArray(*__other.__array_reference,
                                               __other.offset,
                                               __other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline MdStaticArrayReference &operator/=(const T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__div_self_iinternal(__other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArrayReference &operator%=(
        const MdStaticArray<T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__mod_self_internal(__other);
        return *this;
    }

    inline MdStaticArrayReference &operator%=(
        const MdStaticArrayReference<T> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__mod_self_internal(MdStaticArray(*__other.__array_reference,
                                               __other.offset,
                                               __other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline MdStaticArrayReference &operator%=(const T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__mod_self_iinternal(__other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArrayReference &operator&=(
        const MdStaticArray<T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__and_bit_self_internal(__other);
        return *this;
    }

    inline MdStaticArrayReference &operator&=(
        const MdStaticArrayReference<T> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__and_bit_self_internal(MdStaticArray(*__other.__array_reference,
                                                   __other.offset,
                                                   __other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline MdStaticArrayReference &operator&=(const T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__and_bit_self_iinternal(__other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArrayReference &operator|=(
        const MdStaticArray<T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__or_bit_self_internal(__other);
        return *this;
    }

    inline MdStaticArrayReference &operator|=(
        const MdStaticArrayReference<T> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__or_bit_self_internal(MdStaticArray(*__other.__array_reference,
                                                  __other.offset,
                                                  __other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline MdStaticArrayReference &operator|=(const T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__or_bit_self_iinternal(__other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArrayReference &operator^=(
        const MdStaticArray<T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__xor_bit_self_internal(__other);
        return *this;
    }

    inline MdStaticArrayReference &operator^=(
        const MdStaticArrayReference<T> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__xor_bit_self_internal(MdStaticArray(*__other.__array_reference,
                                                   __other.offset,
                                                   __other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline MdStaticArrayReference &operator^=(const T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__xor_bit_self_iinternal(__other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArrayReference &operator<<=(
        const MdStaticArray<T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__lshft_bit_self_internal(__other);
        return *this;
    }

    inline MdStaticArrayReference &operator<<=(
        const MdStaticArrayReference<T> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__lshft_bit_self_internal(MdStaticArray(*__other.__array_reference,
                                                     __other.offset,
                                                     __other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline MdStaticArrayReference &operator<<=(const T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__lshft_bit_self_iinternal(__other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArrayReference &operator>>=(
        const MdStaticArray<T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__rshft_bit_self_internal(__other);
        return *this;
    }

    inline MdStaticArrayReference &operator>>=(
        const MdStaticArrayReference<T> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__rshft_bit_self_internal(MdStaticArray(*__other.__array_reference,
                                                     __other.offset,
                                                     __other.shp_offset));
        return *this;
    }

    template <typename T1, class = typename std::enable_if<!std::is_same<
                               T1, MdStaticArrayReference<T>>::value>::type>
    inline MdStaticArrayReference &operator>>=(const T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__rshft_bit_self_iinternal(__other);
        return *this;
    }

    inline size_t get_size() const { return size; }

    ~MdStaticArrayReference() { __array_reference = nullptr; }

    template <typename T1, typename T2>
    friend inline auto &operator+=(T1 &__other,
                                   const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto &operator-=(T1 &__other,
                                   const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto &operator*=(T1 &__other,
                                   const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto &operator/=(T1 &__other,
                                   const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto &operator%=(T1 &__other,
                                   const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto &operator<<=(T1 &__other,
                                    const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto &operator>>=(T1 &__other,
                                    const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto &operator&=(T1 &__other,
                                   const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto &operator|=(T1 &__other,
                                   const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto &operator^=(T1 &__other,
                                   const MdStaticArrayReference<T2> &__first);

    ///////////////////////////////////////////////////////////////////////////

    template <typename T1, typename T2>
    friend inline auto operator+(const T1 &__other,
                                 const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto operator-(const T1 &__other,
                                 const MdStaticArrayReference<T2> &__first);

    template <typename T1>
    friend inline MdStaticArray<T1> operator-(
        const MdStaticArrayReference<T1> &__first);

    template <typename T1, typename T2>
    friend inline auto operator*(const T1 &__other,
                                 const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto operator/(const T1 &__other,
                                 const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto operator%(const T1 &__other,
                                 const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto operator<<(const T1 &__other,
                                  const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto operator>>(const T1 &__other,
                                  const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto operator&(const T1 &__other,
                                 const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto operator|(const T1 &__other,
                                 const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto operator^(const T1 &__other,
                                 const MdStaticArrayReference<T2> &__first);
};

template <typename T1, typename T2>
inline auto operator+(const T1 &__other,
                      const MdStaticArrayReference<T2> &__first) {
    return MdStaticArray<T2>(*__first.__array_reference, __first.offset,
                             __first.shp_offset) +
           __other;
}

template <typename T1, typename T2>
inline auto operator-(const T1 &__other,
                      const MdStaticArrayReference<T2> &__first) {
    return -__other + MdStaticArray<T2>(*__first.__array_reference,
                                        __first.offset, __first.shp_offset);
}

template <typename T1, typename T2>
inline auto operator*(const T1 &__other,
                      const MdStaticArrayReference<T2> &__first) {
    return MdStaticArray<T2>(*__first.__array_reference, __first.offset,
                             __first.shp_offset)
        .__mul_iinternal(__other);
}

template <typename T1, typename T2>
inline auto operator/(const T1 &__other,
                      const MdStaticArrayReference<T2> &__first) {
    return MdStaticArray(*__first.__array_reference, __first.offset,
                         __first.shp_offset)
        .__div_iointernal(__other);
}

template <typename T1, typename T2>
inline auto operator%(const T1 &__other,
                      const MdStaticArrayReference<T2> &__first) {
    return MdStaticArray<T2>(*__first.__array_reference, __first.offset,
                             __first.shp_offset)
        .__mod_iointernal(__other);
}

template <typename T1, typename T2>
inline auto operator&(const T1 &__other,
                      const MdStaticArrayReference<T2> &__first) {
    return MdStaticArray<T2>(*__first.__array_reference, __first.offset,
                             __first.shp_offset)
        .__and_bit_iinternal(__other);
}

template <typename T1, typename T2>
inline auto operator|(const T1 &__other,
                      const MdStaticArrayReference<T2> &__first) {
    return MdStaticArray<T2>(*__first.__array_reference, __first.offset,
                             __first.shp_offset)
        .__or_bit_iinternal(__other);
}

template <typename T1, typename T2>
inline auto operator^(const T1 &__other,
                      const MdStaticArrayReference<T2> &__first) {
    return MdStaticArray<T2>(*__first.__array_reference, __first.offset,
                             __first.shp_offset)
        .__xor_bit_iinternal(__other);
}

template <typename T1, typename T2>
inline auto operator<<(const T1 &__other,
                       const MdStaticArrayReference<T2> &__first) {
    return MdStaticArray<T2>(*__first.__array_reference, __first.offset,
                             __first.shp_offset)
        .__lshft_bit_iointernal(__other);
}

template <typename T1, typename T2>
inline auto operator>>(const T1 &__other,
                       const MdStaticArrayReference<T2> &__first) {
    return MdStaticArray<T2>(*__first.__array_reference, __first.offset,
                             __first.shp_offset)
        .__rshft_bit_iointernal(__other);
}

template <typename T>
inline MdStaticArray<T> operator-(const MdStaticArrayReference<T> &__first) {
    return MdStaticArray<T>(*__first.__array_reference, __first.offset,
                            __first.shp_offset)
        .__ng_internal();
}

#endif
