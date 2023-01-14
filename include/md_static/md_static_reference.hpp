#pragma once
#ifndef _MD_ST_REFERENCE_HPP_
#define _MD_ST_REFERENCE_HPP_

#include "./md_static_array.hpp"

template <typename _T>
class MdStaticArray<_T>::reference {
    template <typename _T1>
    friend class MdStaticArray;

    friend struct MdArrayUtility;
    friend struct MdLinearAlgebra;

    void *operator new(size_t size);

 public:
    const MdStaticArray<_T> *__array_reference;
    size_t size;
    size_t offset;
    uint16_t shp_offset;

    reference() {}

    reference(const MdStaticArray<_T> &__other, const size_t offst) {
        __array_reference = &__other;
        offset = offst;
        size = __other.get_size() / __other.shape[0];
        shp_offset = 1;
    }

    reference(const reference &__other, const size_t offst) {
        __array_reference = __other.__array_reference;
        offset = offst;
        shp_offset = __other.shp_offset + 1;
        size =
            __other.size / (__other.__array_reference->shape[shp_offset - 1]);
    }

    reference(const reference &__other) {
        __array_reference = __other.__array_reference;
        offset = __other.offset;
        shp_offset = __other.shp_offset;
        size = __other.size;
    }

    reference &operator=(const reference &__other) {
        __array_reference = __other.__array_reference;
        offset = __other.offset;
        shp_offset = __other.shp_offset;
        size = __other.size;

        return *this;
    }

    reference(const reference &&__other) {
        __array_reference = __other.__array_reference;
        __other.__array_reference = nullptr;

        offset = __other.offset;
        shp_offset = __other.shp_offset;
        size = __other.size;
    }

    reference &operator=(const reference &&__other) {
        __array_reference = __other.__array_reference;
        __other.__array_reference = nullptr;

        offset = __other.offset;
        shp_offset = __other.shp_offset;
        size = __other.size;

        return *this;
    }

    template <typename _T1>
    reference &operator=(const MdStaticArray<_T1> &value) {
        static_assert(value.get_size() == size);
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
    reference &operator=(const _T1 __other) {
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

    inline reference operator[](const size_t index) const {
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

        return reference(
            *this, offset + index * __array_reference->skip_vec[shp_offset]);
    }

    // To do: efficient printing
    friend std::ostream &operator<<(std::ostream &op, const reference &ot) {
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

    /**
     * @brief Return constant value
     */
    operator _T() const { return __array_reference->__array[offset]; }

    operator MdStaticArray<_T>() const {
        return MdStaticArray<_T>(*__array_reference);
    }

    /**
     * @brief Return array value
     */
    template <typename _T1>
    operator MdStaticArray<_T1>() const {
        return MdStaticArray<_T1>(*__array_reference);
    }

    template <typename _T1>
    inline auto operator+(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) + __other;
    }

    inline auto operator+(const reference &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) +
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    inline auto operator+(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) + __other;
    }

    template <typename _T1>
    inline auto operator-(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) - __other;
    }

    inline auto operator-(const reference &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] -
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) -
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    inline auto operator-(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) - __other;
    }

    template <typename _T1>
    inline auto operator*(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) * __other;
    }

    inline auto operator*(const reference &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] *
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) *
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    inline auto operator*(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) * __other;
    }

    template <typename _T1>
    inline auto operator/(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) / __other;
    }

    inline auto operator/(const reference &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) /
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    inline auto operator/(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) / __other;
    }

    template <typename _T1>
    inline auto operator%(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) % __other;
    }

    inline auto operator%(const reference &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] /
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) %
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    inline auto operator%(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) % __other;
    }

    template <typename _T1>
    inline auto operator&(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) & __other;
    }

    inline auto operator&(const reference &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] &
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) &
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    inline auto operator&(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) & __other;
    }

    template <typename _T1>
    inline auto operator|(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) | __other;
    }

    inline auto operator|(const reference &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] |
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) |
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    inline auto operator|(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) | __other;
    }

    template <typename _T1>
    inline auto operator^(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) ^ __other;
    }

    inline auto operator^(const reference &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] ^
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) ^
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    inline auto operator^(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) ^ __other;
    }

    template <typename _T1>
    inline auto operator<<(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) << __other;
    }

    inline auto operator<<(const reference &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset]
                       << __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset)
               << MdStaticArray(*__other.__array_reference, __other.offset,
                                __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    inline auto operator<<(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) << __other;
    }

    template <typename _T1>
    inline auto operator>>(const MdStaticArray<_T1> &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) >> __other;
    }

    inline auto operator>>(const reference &__other) const {
        if (size == 1 && __other.size == 1) {
            return MdStaticArray(
                1, __array_reference->__array[offset] >>
                       __other.__array_reference->__array[__other.offset]);
        }
        return MdStaticArray(*__array_reference, offset, shp_offset) >>
               MdStaticArray(*__other.__array_reference, __other.offset,
                             __other.shp_offset);
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    inline auto operator>>(const _T1 &__other) const {
        return MdStaticArray(*__array_reference, offset, shp_offset) >> __other;
    }

    template <typename _T1>
    reference &operator+=(MdStaticArray<_T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__add_self_internal(__other);
        return *this;
    }

    reference &operator+=(reference &__other) {
        // Not suitable: temporary constructor will free array offset instantly,
        // think of something else.
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__add_self_internal(MdStaticArray(*__other.__array_reference,
                                               __other.offset,
                                               __other.shp_offset));
        return *this;
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    reference &operator+=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__add_self_iinternal(__other);
        return *this;
    }

    template <typename _T1>
    reference &operator-=(const MdStaticArray<_T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__sub_self_internal(__other);
        return *this;
    }

    reference &operator-=(reference &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__sub_self_internal(MdStaticArray(*__other.__array_reference,
                                               __other.offset,
                                               __other.shp_offset));
        return *this;
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    reference &operator-=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__sub_self_iinternal(__other);
        return *this;
    }

    template <typename _T1>
    reference &operator*=(const MdStaticArray<_T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__mul_self_internal(__other);
        return *this;
    }

    reference &operator*=(const reference &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__mul_self_internal(MdStaticArray(*__other.__array_reference,
                                               __other.offset,
                                               __other.shp_offset));
        return *this;
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    reference &operator*=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__mul_self_iinternal(__other);
        return *this;
    }

    template <typename _T1>
    reference &operator/=(const MdStaticArray<_T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__div_self_internal(__other);
        return *this;
    }

    reference &operator/=(const reference &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__div_self_internal(MdStaticArray(*__other.__array_reference,
                                               __other.offset,
                                               __other.shp_offset));
        return *this;
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    reference &operator/=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__div_self_iinternal(__other);
        return *this;
    }

    template <typename _T1>
    reference &operator%=(const MdStaticArray<_T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__mod_self_internal(__other);
        return *this;
    }

    reference &operator%=(const reference &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__mod_self_internal(MdStaticArray(*__other.__array_reference,
                                               __other.offset,
                                               __other.shp_offset));
        return *this;
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    reference &operator%=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__mod_self_iinternal(__other);
        return *this;
    }

    template <typename _T1>
    reference &operator&=(const MdStaticArray<_T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__and_bit_self_internal(__other);
        return *this;
    }

    reference &operator&=(const reference &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__and_bit_self_internal(MdStaticArray(*__other.__array_reference,
                                                   __other.offset,
                                                   __other.shp_offset));
        return *this;
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    reference &operator&=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__and_bit_self_iinternal(__other);
        return *this;
    }

    template <typename _T1>
    reference &operator|=(const MdStaticArray<_T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__or_bit_self_internal(__other);
        return *this;
    }

    reference &operator|=(const reference &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__or_bit_self_internal(MdStaticArray(*__other.__array_reference,
                                                  __other.offset,
                                                  __other.shp_offset));
        return *this;
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    reference &operator|=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__or_bit_self_iinternal(__other);
        return *this;
    }

    template <typename _T1>
    reference &operator^=(const MdStaticArray<_T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__xor_bit_self_internal(__other);
        return *this;
    }

    reference &operator^=(const reference &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__xor_bit_self_internal(MdStaticArray(*__other.__array_reference,
                                                   __other.offset,
                                                   __other.shp_offset));
        return *this;
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    reference &operator^=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__xor_bit_self_iinternal(__other);
        return *this;
    }

    template <typename _T1>
    reference &operator<<=(const MdStaticArray<_T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__lshft_bit_self_internal(__other);
        return *this;
    }

    reference &operator<<=(const reference &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__lshft_bit_self_internal(MdStaticArray(*__other.__array_reference,
                                                     __other.offset,
                                                     __other.shp_offset));
        return *this;
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    reference &operator<<=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__lshft_bit_self_iinternal(__other);
        return *this;
    }

    template <typename _T1>
    reference &operator>>=(const MdStaticArray<_T1> &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__rshft_bit_self_internal(__other);
        return *this;
    }

    reference &operator>>=(const reference &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__rshft_bit_self_internal(MdStaticArray(*__other.__array_reference,
                                                     __other.offset,
                                                     __other.shp_offset));
        return *this;
    }

    template <typename _T1, class = typename std::enable_if<
                                !std::is_same<_T1, reference>::value>::type>
    reference &operator>>=(const _T1 &__other) {
        MdStaticArray(*__array_reference, offset, shp_offset)
            .__rshft_bit_self_iinternal(__other);
        return *this;
    }

    inline size_t get_size() const { return size; }

    ~reference() { __array_reference = nullptr; }
};

#endif
