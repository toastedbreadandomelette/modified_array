#pragma once
#ifndef _MD_ST_REFERENCE_HPP_
#define _MD_ST_REFERENCE_HPP_

#include "../md_complex/md_complex.hpp"
#include "./md_static_array.hpp"
#include "./md_type_infer.hpp"

template <typename _T>
class MdStaticArrayReference {
    template <typename _T1>
    friend class MdStaticArray;
    template <typename _T1>
    friend class MdStaticArrayReference;

    friend struct MdArrayUtility;
    friend struct MdLinearAlgebra;

    void *operator new(size_t size);
    const MdStaticArray<_T> *__array_reference;
    size_t size;
    size_t offset;
    uint16_t shp_offset;

 public:
    MdStaticArrayReference() {}

    MdStaticArrayReference(const MdStaticArray<_T> &__other,
                           const size_t offst) {
        __array_reference = &__other;
        offset = offst;
        size = __other.get_size() / __other.shape[0];
        shp_offset = 1;
    }

    MdStaticArrayReference(const MdStaticArrayReference<_T> &__other,
                           const size_t offst) {
        __array_reference = __other.__array_reference;
        offset = offst;
        shp_offset = __other.shp_offset + 1;
        size =
            __other.size / (__other.__array_reference->shape[shp_offset - 1]);
    }

    MdStaticArrayReference(const MdStaticArrayReference<_T> &__other) {
        __array_reference = __other.__array_reference;
        offset = __other.offset;
        shp_offset = __other.shp_offset;
        size = __other.size;
    }

    MdStaticArrayReference &operator=(
        const MdStaticArrayReference<_T> &__other) {
        __array_reference = __other.__array_reference;
        offset = __other.offset;
        shp_offset = __other.shp_offset;
        size = __other.size;

        return *this;
    }

    MdStaticArrayReference(const MdStaticArrayReference<_T> &&__other) {
        __array_reference = __other.__array_reference;
        __other.__array_reference = nullptr;

        offset = __other.offset;
        shp_offset = __other.shp_offset;
        size = __other.size;
    }

    MdStaticArrayReference &operator=(
        const MdStaticArrayReference<_T> &&__other) {
        __array_reference = __other.__array_reference;
        __other.__array_reference = nullptr;

        offset = __other.offset;
        shp_offset = __other.shp_offset;
        size = __other.size;

        return *this;
    }

    template <typename _T1>
    inline MdStaticArrayReference &operator=(const MdStaticArray<_T1> &value) {
        if (value.get_size() != size) {
            throw std::runtime_error(
                "Assignment error between reference of size " +
                std::to_string(size) + " and array of size " +
                std::to_string(value.get_size()));
        }
        // assert shape sizes are equal too
        if (s_threshold_size < size) {
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

    template <typename _T1>
    MdStaticArrayReference &operator=(const _T1 __other) {
        if (size == 1) {
            __array_reference->__array[offset] = __other;
            return *this;
        }
        if (s_threshold_size < size) {
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

        return MdStaticArrayReference<_T>(
            *this, offset + index * __array_reference->skip_vec[shp_offset]);
    }

    // To do: efficient printing
    friend std::ostream &operator<<(std::ostream &op,
                                    const MdStaticArrayReference<_T> &ot) {
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
                    op << ", ";
                }
            }
            op << ']';
        }
        return op;
    }

    inline operator _T() const {
        if (size > 1) {
            throw std::runtime_error("Error casting element. Size found " +
                                     std::to_string(size));
        }
        return __array_reference->__array[offset];
    }

    /**
     * @brief Return constant value
     */
    template <typename _T1>
    inline operator _T1() const {
        if (size > 1) {
            throw std::runtime_error("Error casting element. Size found " +
                                     std::to_string(size));
        }
        return __array_reference->__array[offset];
    }

    inline operator MdStaticArray<_T>() const {
        return MdStaticArray<_T>(*__array_reference);
    }

    /**
     * @brief Return array value
     */
    template <typename _T1>
    inline operator MdStaticArray<_T1>() const {
        return MdStaticArray<_T1>(*__array_reference);
    }

    template <typename _T1>
    inline auto operator+(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) + __other;
    }

    inline auto operator+(const MdStaticArrayReference<_T> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) +
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline auto operator+(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) + __other;
    }

    template <typename _T1>
    inline auto operator-(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) - __other;
    }

    inline auto operator-(const MdStaticArrayReference<_T> &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] -
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) -
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline auto operator-(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) - __other;
    }

    template <typename _T1>
    inline auto operator*(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) * __other;
    }

    inline auto operator*(const MdStaticArrayReference<_T> &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] *
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) *
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline auto operator*(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) * __other;
    }

    template <typename _T1>
    inline auto operator/(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) / __other;
    }

    inline auto operator/(const MdStaticArrayReference<_T> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) /
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline auto operator/(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) / __other;
    }

    template <typename _T1>
    inline auto operator%(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) % __other;
    }

    inline auto operator%(const MdStaticArrayReference<_T> &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] /
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) %
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline auto operator%(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) % __other;
    }

    template <typename _T1>
    inline auto operator&(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) & __other;
    }

    inline auto operator&(const MdStaticArrayReference<_T> &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] &
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) &
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline auto operator&(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) & __other;
    }

    template <typename _T1>
    inline auto operator|(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) | __other;
    }

    inline auto operator|(const MdStaticArrayReference<_T> &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] |
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) |
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline auto operator|(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) | __other;
    }

    template <typename _T1>
    inline auto operator^(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) ^ __other;
    }

    inline auto operator^(const MdStaticArrayReference<_T> &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] ^
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) ^
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline auto operator^(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) ^ __other;
    }

    template <typename _T1>
    inline auto operator<<(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) << __other;
    }

    inline auto operator<<(const MdStaticArrayReference<_T> &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset]
                       << __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset)
               << MdStaticArray(*__other.__array_reference, __other.offset,
                                __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline auto operator<<(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) << __other;
    }

    template <typename _T1>
    inline auto operator>>(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) >> __other;
    }

    inline auto operator>>(const MdStaticArrayReference<_T> &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] >>
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) >>
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline auto operator>>(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) >> __other;
    }

    template <typename _T1>
    inline MdStaticArrayReference &operator+=(MdStaticArray<_T1> &__other) {
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

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline MdStaticArrayReference &operator+=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__add_self_iinternal(__other);
        return *this;
    }

    template <typename _T1>
    inline MdStaticArrayReference &operator-=(
        const MdStaticArray<_T1> &__other) {
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

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline MdStaticArrayReference &operator-=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__sub_self_iinternal(__other);
        return *this;
    }

    template <typename _T1>
    inline MdStaticArrayReference &operator*=(
        const MdStaticArray<_T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__mul_self_internal(__other);
        return *this;
    }

    inline MdStaticArrayReference &operator*=(
        const MdStaticArrayReference<_T> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__mul_self_internal(MdStaticArray(*__other.__array_reference,
                                               __other.offset,
                                               __other.shp_offset));
        return *this;
    }

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline MdStaticArrayReference &operator*=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__mul_self_iinternal(__other);
        return *this;
    }

    template <typename _T1>
    inline MdStaticArrayReference &operator/=(
        const MdStaticArray<_T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__div_self_internal(__other);
        return *this;
    }

    inline MdStaticArrayReference &operator/=(
        const MdStaticArrayReference<_T> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__div_self_internal(MdStaticArray(*__other.__array_reference,
                                               __other.offset,
                                               __other.shp_offset));
        return *this;
    }

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline MdStaticArrayReference &operator/=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__div_self_iinternal(__other);
        return *this;
    }

    template <typename _T1>
    inline MdStaticArrayReference &operator%=(
        const MdStaticArray<_T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__mod_self_internal(__other);
        return *this;
    }

    inline MdStaticArrayReference &operator%=(
        const MdStaticArrayReference<_T> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__mod_self_internal(MdStaticArray(*__other.__array_reference,
                                               __other.offset,
                                               __other.shp_offset));
        return *this;
    }

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline MdStaticArrayReference &operator%=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__mod_self_iinternal(__other);
        return *this;
    }

    template <typename _T1>
    inline MdStaticArrayReference &operator&=(
        const MdStaticArray<_T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__and_bit_self_internal(__other);
        return *this;
    }

    inline MdStaticArrayReference &operator&=(
        const MdStaticArrayReference<_T> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__and_bit_self_internal(MdStaticArray(*__other.__array_reference,
                                                   __other.offset,
                                                   __other.shp_offset));
        return *this;
    }

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline MdStaticArrayReference &operator&=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__and_bit_self_iinternal(__other);
        return *this;
    }

    template <typename _T1>
    inline MdStaticArrayReference &operator|=(
        const MdStaticArray<_T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__or_bit_self_internal(__other);
        return *this;
    }

    inline MdStaticArrayReference &operator|=(
        const MdStaticArrayReference<_T> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__or_bit_self_internal(MdStaticArray(*__other.__array_reference,
                                                  __other.offset,
                                                  __other.shp_offset));
        return *this;
    }

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline MdStaticArrayReference &operator|=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__or_bit_self_iinternal(__other);
        return *this;
    }

    template <typename _T1>
    inline MdStaticArrayReference &operator^=(
        const MdStaticArray<_T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__xor_bit_self_internal(__other);
        return *this;
    }

    inline MdStaticArrayReference &operator^=(
        const MdStaticArrayReference<_T> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__xor_bit_self_internal(MdStaticArray(*__other.__array_reference,
                                                   __other.offset,
                                                   __other.shp_offset));
        return *this;
    }

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline MdStaticArrayReference &operator^=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__xor_bit_self_iinternal(__other);
        return *this;
    }

    template <typename _T1>
    inline MdStaticArrayReference &operator<<=(
        const MdStaticArray<_T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__lshft_bit_self_internal(__other);
        return *this;
    }

    inline MdStaticArrayReference &operator<<=(
        const MdStaticArrayReference<_T> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__lshft_bit_self_internal(MdStaticArray(*__other.__array_reference,
                                                     __other.offset,
                                                     __other.shp_offset));
        return *this;
    }

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline MdStaticArrayReference &operator<<=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__lshft_bit_self_iinternal(__other);
        return *this;
    }

    template <typename _T1>
    inline MdStaticArrayReference &operator>>=(
        const MdStaticArray<_T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__rshft_bit_self_internal(__other);
        return *this;
    }

    inline MdStaticArrayReference &operator>>=(
        const MdStaticArrayReference<_T> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__rshft_bit_self_internal(MdStaticArray(*__other.__array_reference,
                                                     __other.offset,
                                                     __other.shp_offset));
        return *this;
    }

    template <typename _T1, class = typename std::enable_if<!std::is_same<
                                _T1, MdStaticArrayReference<_T>>::value>::type>
    inline MdStaticArrayReference &operator>>=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__rshft_bit_self_iinternal(__other);
        return *this;
    }

    inline size_t get_size() const { return size; }

    ~MdStaticArrayReference() { __array_reference = nullptr; }
};

#define OP_INTERNAL_MACRO_EXT(func)                                       \
    if constexpr (sizeof(_T1) > sizeof(_T2)) {                            \
        if constexpr ((std::is_floating_point<_T2>::value ||              \
                       std::is_floating_point<_T1>::value) &&             \
                      sizeof(_T1) == sizeof(float)) {                     \
            return MdStaticArray<_T2>(*__first.__array_reference,         \
                                      __first.offset, __first.shp_offset) \
                .func(__other, static_cast<float>(0));                    \
        } else if constexpr ((std::is_floating_point<_T2>::value ||       \
                              std::is_floating_point<_T1>::value) &&      \
                             sizeof(_T1) == sizeof(double)) {             \
            return MdStaticArray<_T2>(*__first.__array_reference,         \
                                      __first.offset, __first.shp_offset) \
                .func(__other, static_cast<double>(0));                   \
        } else if constexpr ((std::is_floating_point<_T2>::value ||       \
                              std::is_floating_point<_T1>::value) &&      \
                             sizeof(_T1) == sizeof(long double)) {        \
            return MdStaticArray<_T2>(*__first.__array_reference,         \
                                      __first.offset, __first.shp_offset) \
                .func(__other, static_cast<long double>(0));              \
        } else {                                                          \
            return MdStaticArray<_T2>(*__first.__array_reference,         \
                                      __first.offset, __first.shp_offset) \
                .func(__other, (_T1)0);                                   \
        }                                                                 \
    } else {                                                              \
        if constexpr ((std::is_floating_point<_T2>::value ||              \
                       std::is_floating_point<_T1>::value) &&             \
                      sizeof(_T1) == sizeof(float)) {                     \
            return MdStaticArray<_T2>(*__first.__array_reference,         \
                                      __first.offset, __first.shp_offset) \
                .func(__other, static_cast<double>(0));                   \
        } else if constexpr ((std::is_floating_point<_T2>::value ||       \
                              std::is_floating_point<_T1>::value) &&      \
                             sizeof(_T1) == sizeof(double)) {             \
            return MdStaticArray<_T2>(*__first.__array_reference,         \
                                      __first.offset, __first.shp_offset) \
                .func(__other, static_cast<double>(0));                   \
        } else if constexpr ((std::is_floating_point<_T2>::value ||       \
                              std::is_floating_point<_T1>::value) &&      \
                             sizeof(_T1) == sizeof(long double)) {        \
            return MdStaticArray<_T2>(*__first.__array_reference,         \
                                      __first.offset, __first.shp_offset) \
                .func(__other, static_cast<long double>(0));              \
        } else if constexpr ((std::is_floating_point<_T2>::value ||       \
                              std::is_floating_point<_T1>::value) &&      \
                             sizeof(_T1) < sizeof(float)) {               \
            return MdStaticArray<_T2>(*__first.__array_reference,         \
                                      __first.offset, __first.shp_offset) \
                .func(__other, static_cast<float>(0));                    \
        } else {                                                          \
            return MdStaticArray<_T2>(*__first.__array_reference,         \
                                      __first.offset, __first.shp_offset) \
                .func(__other, static_cast<_T2>(0));                      \
        }                                                                 \
    }

template <typename _T1, typename _T2, class = typename EN_IF(IS_ARITH(_T1))>
inline auto operator+(const _T1 &__other,
                      const MdStaticArrayReference<_T2> &__first) {
    return MdStaticArray<_T2>(*__first.__array_reference, __first.offset,
                              __first.shp_offset) +
           __other;
}

template <typename _T1, typename _T2, class = typename EN_IF(IS_ARITH(_T1))>
inline auto operator-(const _T1 &__other,
                      const MdStaticArrayReference<_T2> &__first) {
    return -__other + MdStaticArray<_T2>(*__first.__array_reference,
                                         __first.offset, __first.shp_offset);
}

template <typename _T1, typename _T2, class = typename EN_IF(IS_ARITH(_T1))>
inline auto operator*(const _T1 &__other,
                      const MdStaticArrayReference<_T2> &__first) {
    return __other * MdStaticArray<_T2>(*__first.__array_reference,
                                        __first.offset, __first.shp_offset);
}

template <typename _T1, typename _T2, class = typename EN_IF(IS_ARITH(_T1))>
inline auto operator/(const _T1 &__other,
                      const MdStaticArrayReference<_T2> &__first) {
    OP_INTERNAL_MACRO_EXT(__div_iointernal)
}

// template <typename _T1, typename _T2, class = typename EN_IF(IS_ARITH(_T1))>
// inline auto &operator-=(_T1 &__other,
//                         const MdStaticArrayReference<_T2> &__first) {
//     if (__first.get_size() > 1) {
//         throw std::runtime_error(
//             "Operator += on single element requires size to be 1, found "
//             "size: " +
//             std::to_string(__first.get_size()));
//     }
//     __other -= __first.__array_reference->array[__first.offset];
//     return __other;
// }

// template <typename _T1, typename _T2, class = typename EN_IF(IS_ARITH(_T1))>
// inline auto &operator*=(_T1 &__other,
//                         const MdStaticArrayReference<_T2> &__first) {
//     if (__first.get_size() > 1) {
//         throw std::runtime_error(
//             "Operator += on single element requires size to be 1, found "
//             "size: " +
//             std::to_string(__first.get_size()));
//     }
//     __other *= __first.__array_reference->array[__first.offset];
//     return __other;
// }

// template <typename _T1, typename _T2, class = typename EN_IF(IS_ARITH(_T1))>
// inline auto &operator/=(_T1 &__other,
//                         const MdStaticArrayReference<_T2> &__first) {
//     if (__first.get_size() > 1) {
//         throw std::runtime_error(
//             "Operator += on single element requires size to be 1, found "
//             "size: " +
//             std::to_string(__first.get_size()));
//     }
//     __other /= __first.__array_reference->array[__first.offset];
//     return __other;
// }

#endif
