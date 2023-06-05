#pragma once

#ifndef _MD_STATIC_ARRAY_HPP_
#define _MD_STATIC_ARRAY_HPP_
#include <omp.h>

#include <algorithm>
#include <iostream>
#include <thread>
#include <vector>

#include "../utility/alloc.hpp"
#include "./md_type_inference.hpp"

// Todo: Create a thread pool.
static size_t s_threshold_size = 100000;
static uint8_t s_thread_count = 16;

template <typename T>
class MdStaticArrayReference;

template <typename T>
class MdStaticAxisReference;

template <typename T>
class MdStaticArray {
    void init_shape(const size_t *_shape, const size_t _shp_size) {
        if (shape) {
            free(shape);
            skip_vec = nullptr;
        }
        if (skip_vec) {
            free(skip_vec);
            skip_vec = nullptr;
        }
        shp_size = _shp_size;
        shape = static_cast<size_t *>(malloc(shp_size * sizeof(size_t)));
        skip_vec = static_cast<size_t *>(malloc(shp_size * sizeof(size_t)));
        shape[shp_size - 1] = _shape[shp_size - 1];
        skip_vec[shp_size - 1] = 1;
        for (int16_t i = shp_size - 2; i >= 0; --i) {
            shape[i] = _shape[i];
            skip_vec[i] = _shape[i + 1] * skip_vec[i + 1];
        }
    }

    void init_shape(const size_t size) {
        if (shape) {
            free(shape);
            skip_vec = nullptr;
        }
        if (skip_vec) {
            free(skip_vec);
            skip_vec = nullptr;
        }
        shape = static_cast<size_t *>(malloc(sizeof(size_t)));
        skip_vec = static_cast<size_t *>(malloc(sizeof(size_t)));
        shape[0] = size;
        skip_vec[0] = 1;
        shp_size = 1;
    }

    /**
     * @brief create a temporary reference for MdStaticArray::reference.
     * This will not accessible to user.
     */
    MdStaticArray(const MdStaticArray<T> &other, const size_t offset,
                  const uint16_t shp_offset)
        : shape(nullptr), skip_vec(nullptr) {
        __array = &other.__array[offset];
        shape = &other.shape[shp_offset];
        skip_vec = &other.skip_vec[shp_offset];
        shp_size = other.shp_size - shp_offset;
        __size = other.__size;
        uint16_t index = 0;
        while (index < shp_offset) {
            __size /= other.shape[index++];
        }
        dont_free = true;
    }

    bool dont_free = false;
    T *__array;
    size_t *shape;
    size_t *skip_vec;
    size_t __size;
    uint16_t shp_size;

 public:
    template <typename T1>
    friend class MdStaticArrayReference;
    template <typename T1>
    friend class MdStaticAxisReference;
    template <typename T1>
    friend class MdStaticArray;

    friend struct MdArrayUtility;
    friend struct MdLinearAlgebra;
    friend struct MdArrayManipulate;
    friend struct FFT;

    friend std::ostream &operator<<(std::ostream &op,
                                    const MdStaticArrayReference<T> &ot);

    static void set_thread_count(const uint8_t value);

    static void set_threshold_size(const size_t size);

    constexpr void init_array(const size_t size) {
        if constexpr (MdTypeInfer::is_mallocable<T>::value) {
            __array = aligned_allocate<T>(64, size);
        } else {
            __array = new T[size];
        }
        __size = size;
    }

    explicit MdStaticArray(const size_t size)
        : shape(nullptr), skip_vec(nullptr) {
        init_array(size);
        init_shape(size);
    }

    MdStaticArray(const size_t size, const T &value)
        : shape(nullptr), skip_vec(nullptr) {
        init_array(size);
        init_shape(size);

        if (size > s_threshold_size && ::s_thread_count > 1) {
#pragma omp parallel for
            for (size_t index = 0; index < size; ++index) {
                __array[index] = value;
            }
        } else {
            for (size_t index = 0; index < size; ++index) {
                __array[index] = value;
            }
        }
    }

    MdStaticArray(const std::vector<size_t> &_shape, const T &value)
        : shape(nullptr), skip_vec(nullptr) {
        size_t overall_size = 1;
        for (auto &dim : _shape) {
            overall_size *= dim;
        }
        init_array(overall_size);
        init_shape(_shape.data(), _shape.size());

        if (__size > s_threshold_size && ::s_thread_count > 1) {
#pragma omp parallel for
            for (size_t index = 0; index < __size; ++index) {
                __array[index] = value;
            }
        } else {
            for (size_t index = 0; index < __size; ++index) {
                __array[index] = value;
            }
        }
    }

    MdStaticArray() : shape(nullptr), skip_vec(nullptr) { __array = nullptr; }

    explicit MdStaticArray(const std::vector<T> &other)
        : shape(nullptr), skip_vec(nullptr) {
        __size = other.size();
        init_array(__size);
        init_shape(__size);

        if (__size > s_threshold_size && ::s_thread_count > 1) {
#pragma omp parallel for
            for (size_t index = 0; index < __size; ++index) {
                __array[index] = other[index];
            }
        } else {
            for (size_t index = 0; index < __size; ++index) {
                __array[index] = other[index];
            }
        }
    }

    MdStaticArray(const MdStaticArray &other)
        : shape(nullptr), skip_vec(nullptr) {
        init_array(other.get_size());
        const auto shp = other.get_shape();
        init_shape(shp, other.shp_size);

        if (__size > s_threshold_size && ::s_thread_count > 1) {
#pragma omp parallel for
            for (size_t index = 0; index < __size; ++index) {
                __array[index] = other.__array[index];
            }
        } else {
            for (size_t index = 0; index < __size; ++index) {
                __array[index] = other.__array[index];
            }
        }
    }

    MdStaticArray(MdStaticArray<T> &&other) {
        __array = other.__array;
        other.__array = nullptr;

        __size = other.__size;
        shp_size = other.shp_size;
        shape = other.shape;
        other.shape = nullptr;

        skip_vec = other.skip_vec;
        other.skip_vec = nullptr;

        dont_free = other.dont_free;
        other.dont_free = true;
    }

    MdStaticArray &operator=(MdStaticArray<T> &&other) {
        __array = other.__array;
        other.__array = nullptr;

        __size = other.__size;
        shp_size = other.shp_size;
        shape = other.shape;
        other.shape = nullptr;

        skip_vec = other.skip_vec;
        other.skip_vec = nullptr;

        dont_free = other.dont_free;
        other.dont_free = true;

        return *this;
    }

    /**
     * @brief Assigning reference to the newly created array
     */
    MdStaticArray(const MdStaticArrayReference<T> &other);

    /**
     * @brief Casting operator
     */
    inline T operator()() const { return __array[0]; }

    /**
     * @brief Casting operator
     */
    inline operator T() const {
        if (__size > 1) {
            throw std::runtime_error(
                "Value casted should be a single element, found with size: " +
                std::to_string(__size));
        }
        return __array[0];
    }

    /**
     * @brief Casting operator
     */
    template <typename T1>
    operator MdStaticArray<T1>() const {
        std::vector<size_t> shp;
        for (size_t index = 0; index < shp_size; ++index) {
            shp.emplace_back(shape[index]);
        }
        MdStaticArray<T1> __result(shp, 0);

#pragma omp parallel for
        for (size_t index = 0; index < __size; ++index) {
            __result.__array[index] = __array[index];
        }

        return __result;
    }

    /**
     * @brief Assignment operator (direct vector assignment)
     */
    MdStaticArray &operator=(const std::vector<T> other) {
        skip_vec = nullptr;
        shape = nullptr;
        __size = other.size();
        init_array(__size);
        init_shape(__size);

        if (__size > s_threshold_size && ::s_thread_count > 1) {
#pragma omp parallel for
            for (size_t index = 0; index < __size; ++index) {
                __array[index] = other[index];
            }
        } else {
            for (size_t index = 0; index < __size; ++index) {
                __array[index] = other[index];
            }
        }
        return *this;
    }

    /**
     * @brief Assignment operator
     */
    MdStaticArray &operator=(const MdStaticArray &other) {
        skip_vec = nullptr;
        shape = nullptr;
        __size = other.get_size();
        init_array(__size);
        const auto shp = other.get_shape();
        init_shape(shp, other.shp_size);
        if (__size > s_threshold_size && ::s_thread_count > 1) {
#pragma omp parallel for
            for (size_t index = 0; index < __size; ++index) {
                __array[index] = other.__array[index];
            }
        } else {
            for (size_t index = 0; index < __size; ++index) {
                __array[index] = other.__array[index];
            }
        }
        return *this;
    }

    /**
     * @brief Assigning reference to the newly created array
     */
    MdStaticArray<T> &operator=(const MdStaticArrayReference<T> &other);

    /**
     * @brief Destructor for array
     */
    ~MdStaticArray() {
        if (!dont_free) {
            if (__array != nullptr) {
                if constexpr (std::is_fundamental<T>::value) {
                    aligned_free(__array);
                } else {
                    delete[] __array;
                }
                __array = nullptr;
            }
            if (shape != nullptr) {
                free(shape);
                shape = nullptr;
            }
            if (skip_vec != nullptr) {
                free(skip_vec);
                skip_vec = nullptr;
            }
        } else {
            __array = nullptr;
            shape = nullptr;
            skip_vec = nullptr;
        }
    }

    /**
     * @brief Get shape of the object
     */
    inline size_t *get_shape() const { return shape; }

    /**
     * @brief Get shape length
     * @param void
     * @returns uint16_t shape of the array
     */
    inline uint16_t get_shape_size() const { return shp_size; }

    /**
     * @brief Check whether arrays have same structure
     * @param other array to compare
     * @return true if they have same structure, else false
     */
    template <typename T1>
    bool is_same_shape(const MdStaticArray<T1> &other) const {
        if (shp_size != other.shp_size) {
            return false;
        }

        if (get_size() != other.get_size()) {
            return false;
        }

        for (size_t index = 0; index < shp_size; ++index) {
            if (shape[index] != other.shape[index]) {
                return false;
            }
        }

        return true;
    }

    MdStaticAxisReference<T> get_axis_reference(const size_t axis);

    MdStaticAxisReference<T> get_nth_axis_reference(const size_t axis,
                                                    const size_t n);

    /**
     * @brief Add function, currently using threads
     * @param other other array (might be of different type)
     * @returns new array of current type
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __add_internal(const MdStaticArray<T1> &other) const;

    /**
     * @brief Add function, currently using threads
     * @param other other integer (might be of different type)
     * @returns new array of current type
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __add_iinternal(const T1 &other) const;

    /**
     * @brief Subtract function, currently using threads
     * @param other other array (might be of different type)
     * @returns new array of current type
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __sub_internal(const MdStaticArray<T1> &) const;

    /**
     * @brief Subtract function, currently using threads
     * @param other other integer (might be of different type)
     * @returns new array of current type
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __sub_iinternal(const T1 &) const;

    /**
     * @brief Subtract function, currently using threads
     * @param other other integer (might be of different type)
     * @returns new array of current type
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __sub_iointernal(const T1 &) const;

    /**
     * @brief Multiplication function, currently using threads
     * @param other other array (might be of different type)
     * @returns new array of current type
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __mul_internal(const MdStaticArray<T1> &) const;

    /**
     * @brief Multiplication function, currently using threads
     * @param other other integer (might be of different type)
     * @returns new array of current type
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __mul_iinternal(const T1 &other) const;

    /**
     * @brief Division function, currently using threads
     * @param other other array (might be of different type)
     * @returns new array of current type
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __div_internal(const MdStaticArray<T1> &) const;

    /**
     * @brief Division function, currently using threads
     * @param other other integer (might be of different type)
     * @returns new array of current type
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __div_iinternal(const T1 &other) const;

    /**
     * @brief Modulo function, currently using threads
     * @param other other integer (might be of different type)
     * @returns new array of current type
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __div_iointernal(const T1 &other) const;

    /**
     * @brief Modulo function, currently using threads
     * @param other other array (might be of different type)
     * @returns new array of current type
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __mod_internal(const MdStaticArray<T1> &) const;

    /**
     * @brief Division function, currently using threads
     * @param other other integer (might be of different type)
     * @returns new array of current type
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __mod_iinternal(const T1 &other) const;

    /**
     * @brief Modulo function, currently using threads, but the operand is to be
     * modded
     * @param other other integer (might be of different type)
     * @returns new array of current type
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __mod_iointernal(const T1 &other) const;

    /**
     * @brief Bitwise AND function between two arrays
     * @param other other array to perform bitwise and
     * @returns new array
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __and_bit_internal(const MdStaticArray<T1> &other) const;

    /**
     * @brief Bitwise AND function between two arrays
     * @param other other array to perform bitwise and
     * @returns new array
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __and_bit_iinternal(const T1 &other) const;

    /**
     * @brief Bitwise OR function between two arrays
     * @param other other array to perform bitwise and
     * @returns new array
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __or_bit_internal(const MdStaticArray<T1> &other) const;

    /**
     * @brief Bitwise OR function between two arrays
     * @param other other array to perform bitwise and
     * @returns new array
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __or_bit_iinternal(const T1 &other) const;

    /**
     * @brief Bitwise XOR function between two arrays
     * @param other other array to perform bitwise and
     * @returns new array
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __xor_bit_internal(const MdStaticArray<T1> &other) const;

    /**
     * @brief Bitwise XOR function between two arrays
     * @param other other array to perform bitwise and
     * @returns new array
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __xor_bit_iinternal(const T1 &other) const;

    /**
     * @brief Bitwise left shift function between two arrays
     * @param other other array to perform bitwise and
     * @returns new array
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __lshft_bit_internal(
        const MdStaticArray<T1> &other) const;

    /**
     * @brief Bitwise left shift function between two arrays
     * @param other other array to perform bitwise and
     * @returns new array
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __lshft_bit_iinternal(const T1 &other) const;

    /**
     * @brief Bitwise left shift function between two arrays, but here
     * other is shifted using data in array
     * @param other other array to perform bitwise and
     * @returns new array
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __lshft_bit_iointernal(const T1 &other) const;

    /**
     * @brief Bitwise right shift function between two arrays
     * @param other other array to perform bitwise and
     * @returns new array
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __rshft_bit_internal(
        const MdStaticArray<T1> &other) const;

    /**
     * @brief Bitwise right shift function between two arrays
     * @param other other array to perform bitwise and
     * @returns new array
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __rshft_bit_iinternal(const T1 &other) const;

    /**
     * @brief Bitwise right shift function between two arrays, but here
     * other is shifted using data in array
     * @param other other array to perform bitwise and
     * @returns new array
     */
    template <typename T1,
              typename T2 = typename std::remove_const<
                  decltype(MdTypeInfer::eval_resultant_t<T1, T>::value)>::type>
    MdStaticArray<T2> __rshft_bit_iointernal(const T1 &other) const;

    /**
     * @brief Negative operator
     * @returns new array
     */
    MdStaticArray __ng_internal(void) const;

    /**
     * @brief Add to self, using multi-threading
     * @param other other vector to add
     * @returns new array
     */
    template <typename T1>
    void __add_self_internal(const MdStaticArray<T1> &other);

    /**
     * @brief Subtract to self, using multi-threading
     * @param other other vector to add
     * @returns new array
     */
    template <typename T1>
    void __sub_self_internal(const MdStaticArray<T1> &other);

    /**
     * @brief Multiply to self, using multi-threading
     * @param other other vector to add
     * @returns new array
     */
    template <typename T1>
    void __mul_self_internal(const MdStaticArray<T1> &other);

    /**
     * @brief Divide to self, using multi-threading
     * @param other other vector to add
     * @returns new array
     */
    template <typename T1>
    void __div_self_internal(const MdStaticArray<T1> &other);

    /**
     * @brief Modulus to self, using multi-threading
     * @param other other vector to add
     * @returns new array
     */
    template <typename T1>
    void __mod_self_internal(const MdStaticArray<T1> &other);

    /**
     * @brief Add to self, using multi-threading
     * @param other other vector to add
     * @returns new array
     */
    template <typename T1>
    void __add_self_iinternal(const T1 &other);

    /**
     * @brief Subtract to self, using multi-threading
     * @param other other vector to add
     * @returns new array
     */
    template <typename T1>
    void __sub_self_iinternal(const T1 &other);

    /**
     * @brief Multiply to self, using multi-threading
     * @param other other vector to add
     * @returns new array
     */
    template <typename T1>
    void __mul_self_iinternal(const T1 &other);

    /**
     * @brief Divide to self, using multi-threading
     * @param other other vector to add
     * @returns new array
     */
    template <typename T1>
    void __div_self_iinternal(const T1 &other);

    /**
     * @brief Modulo to self, using multi-threading
     * @param other other vector to add
     * @returns new array
     */
    template <typename T1>
    void __mod_self_iinternal(const T1 &other);

    /**
     * @brief Bitwise and to self, using multi-threading
     * @param other other vector to add
     * @returns new array
     */
    template <typename T1>
    void __and_bit_self_internal(const MdStaticArray<T1> &other);

    /**
     * @brief Bitwise and to self, using multi-threading
     * @param other other integer to perform bitwise AND
     * @returns new array
     */
    template <typename T1>
    void __and_bit_self_iinternal(const T1 &other);

    /**
     * @brief Bitwise OR to self, using multi-threading
     * @param other other vector to perform bitwise OR
     * @returns new array
     */
    template <typename T1>
    void __or_bit_self_internal(const MdStaticArray<T1> &other);

    /**
     * @brief Bitwise OR to self, using multi-threading
     * @param other other vector to perform bitwise OR
     * @returns new array
     */
    template <typename T1>
    void __or_bit_self_iinternal(const T1 &other);

    /**
     * @brief Bitwise XOR to self, using multi-threading
     * @param other other vector to perform bitwise XOR
     * @returns new array
     */
    template <typename T1>
    void __xor_bit_self_internal(const MdStaticArray<T1> &other);

    /**
     * @brief Bitwise XOR to self, using multi-threading
     * @param other other vector to perform bitwise XOR
     * @returns new array
     */
    template <typename T1>
    void __xor_bit_self_iinternal(const T1 &other);

    /**
     * @brief Left shift to self, using multi-threading
     * @param other other vector to perform bitwise XOR
     * @returns new array
     */
    template <typename T1>
    void __lshft_bit_self_internal(const MdStaticArray<T1> &other);

    /**
     * @brief Left shift to self, using multi-threading
     * @param other other vector to perform bitwise XOR
     * @returns new array
     */
    template <typename T1>
    void __lshft_bit_self_iinternal(const T1 &other);

    /**
     * @brief Right shift to self, using multi-threading
     * @param other other vector to perform bitwise XOR
     * @returns new array
     */
    template <typename T1>
    void __rshft_bit_self_internal(const MdStaticArray<T1> &other);

    /**
     * @brief Right shift to self, using multi-threading
     * @param other other vector to perform bitwise XOR
     * @returns new array
     */
    template <typename T1>
    void __rshft_bit_self_iinternal(const T1 &other);

    /**
     * @brief Compare current array with other
     * @param other array of values to compare
     * @returns array of boolean values returning true or false
     */
    template <typename T1>
    MdStaticArray<bool> __comp_eq_internal(
        const MdStaticArray<T1> &other) const;

    /**
     * @brief Check if every entry in current array is greater than other
     * @param other array of values to compare
     * @returns array of boolean values returning true or false
     */
    template <typename T1>
    MdStaticArray<bool> __comp_g_internal(const MdStaticArray<T1> &other) const;

    /**
     * @brief Check if every entry in current array is greater or equal to
     * other
     * @param other array of values to compare
     * @returns array of boolean values returning true or false
     */
    template <typename T1, typename c = typename std::enable_if<
                               MdTypeInfer::is_arith<T1>::value>::value>
    MdStaticArray<bool> __comp_geq_internal(
        const MdStaticArray<T1> &other) const;

    /**
     * @brief Check if every entry in current array is less than other
     * @param other array of values to compare
     * @returns array of boolean values returning true or false
     */
    template <typename T1>
    MdStaticArray<bool> __comp_l_internal(const MdStaticArray<T1> &other) const;

    /**
     * @brief Check if every entry in current array is less than or equal to
     * other
     * @param other array of values to compare
     * @returns array of boolean values returning true or false
     */
    template <typename T1>
    MdStaticArray<bool> __comp_leq_internal(
        const MdStaticArray<T1> &other) const;

    /**
     * @brief Check if every entry in current array is not equal to other
     * @param other array of values to compare
     * @returns array of boolean values returning true or false
     */
    template <typename T1>
    MdStaticArray<bool> __comp_neq_internal(
        const MdStaticArray<T1> &other) const;

    /**
     * @brief Check if every entry in current array is equal to single value
     * @param other single value
     * @returns array of boolean values returning true or false
     */
    template <typename T1>
    MdStaticArray<bool> __comp_eq_iinternal(const T1 &other) const;

    /**
     * @brief Check if every entry in current array is greater than a single
     * value
     * @param other single value
     * @returns array of boolean values returning true or false
     */
    template <typename T1>
    MdStaticArray<bool> __comp_g_iinternal(const T1 &other) const;

    /**
     * @brief Check if every entry in current array is greater than or equal to
     * a single value
     * @param other single value
     * @returns array of boolean values returning true or false
     */
    template <typename T1>
    MdStaticArray<bool> __comp_geq_iinternal(const T1 &other) const;

    /**
     * @brief Check if every entry in current array is less than a single
     * value
     * @param other single value
     * @returns array of boolean values returning true or false
     */
    template <typename T1>
    MdStaticArray<bool> __comp_l_iinternal(const T1 &other) const;

    /**
     * @brief Check if every entry in current array is less than or equal a
     * single value
     * @param other single value
     * @returns array of boolean values returning true or false
     */
    template <typename T1>
    MdStaticArray<bool> __comp_leq_iinternal(const T1 &other) const;

    /**
     * @brief Check if every entry in current array is not equal to a single
     * value
     * @param other single value
     * @returns array of boolean values returning true or false
     */
    template <typename T1>
    MdStaticArray<bool> __comp_neq_iinternal(const T1 &other) const;

    template <typename T1>
    inline auto operator+(const T1 &other) const {
        return __add_iinternal(other);
    }

    template <typename T1>
    inline auto operator+(const MdStaticArray<T1> &other) const {
        return __add_internal(other);
    }

    template <typename T1>
    inline auto operator-(const T1 &other) const {
        return __sub_iinternal(other);
    }

    template <typename T1>
    inline auto operator-(const MdStaticArray<T1> &other) const {
        return __sub_internal(other);
    }

    template <typename T1>
    inline auto operator*(const MdStaticArray<T1> &other) const {
        return __mul_internal(other);
    }

    template <typename T1>
    inline auto operator*(const T1 &other) const {
        return __mul_iinternal(other);
    }

    template <typename T1>
    inline auto operator/(const T1 &other) const {
        return __div_iinternal(other);
    }

    template <typename T1>
    inline auto operator/(const MdStaticArray<T1> &other) const {
        return __div_internal(other);
    }

    template <typename T1>
    inline auto operator%(const T1 &other) const {
        return __mod_iinternal(other);
    }

    template <typename T1>
    inline auto operator%(const MdStaticArray<T1> &other) const {
        return __mod_internal(other);
    }

    template <typename T1>
    inline auto operator&(const MdStaticArray<T1> &other) const {
        return __and_bit_internal(other);
    }

    template <typename T1>
    inline auto operator&(const T1 &other) const {
        return __and_bit_iinternal(other);
    }

    template <typename T1>
    inline auto operator|(const MdStaticArray<T1> &other) const {
        return __or_bit_internal(other);
    }

    template <typename T1>
    inline auto operator|(const T1 &other) const {
        return __or_bit_iinternal(other);
    }

    template <typename T1>
    inline auto operator^(const MdStaticArray<T1> &other) const {
        return __xor_bit_internal(other);
    }

    template <typename T1>
    inline auto operator^(const T1 &other) const {
        return __xor_bit_iinternal(other);
    }

    template <typename T1>
    inline auto operator<<(const MdStaticArray<T1> &other) const {
        return __lshft_bit_internal(other);
    }

    template <typename T1>
    inline auto operator<<(const T1 &other) const {
        return __lshft_bit_iinternal(other);
    }

    template <typename T1>
    inline auto operator>>(const MdStaticArray<T1> &other) const {
        return __rshft_bit_internal(other);
    }

    template <typename T1>
    inline auto operator>>(const T1 &other) const {
        return __rshft_bit_iinternal(other);
    }

    template <typename T1>
    inline MdStaticArray &operator+=(const MdStaticArray<T1> &other) {
        __add_self_internal(other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArray &operator-=(const MdStaticArray<T1> &other) {
        __sub_self_internal(other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArray &operator*=(const MdStaticArray<T1> &other) {
        __mul_self_internal(other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArray &operator/=(const MdStaticArray<T1> &other) {
        __div_self_internal(other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArray &operator%=(const MdStaticArray<T1> &other) {
        __mod_self_internal(other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArray &operator+=(const T1 &other) {
        __add_self_iinternal(other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArray &operator-=(const T1 &other) {
        __sub_self_ionternal(other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArray &operator*=(const T1 &other) {
        __mul_self_iinternal(other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArray &operator/=(const T1 &other) {
        __div_self_iinternal(other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArray &operator%=(const T1 &other) {
        __mod_self_iinternal(other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArray &operator<<=(const MdStaticArray<T1> &other) {
        __lshft_bit_self_internal(other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArray &operator<<=(const T1 &other) {
        __lshft_bit_self_iinternal(other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArray &operator>>=(const MdStaticArray<T1> &other) {
        __rshft_bit_self_internal(other);
        return *this;
    }

    template <typename T1>
    inline MdStaticArray &operator>>=(const T1 &other) {
        __rshft_bit_self_iinternal(other);
        return *this;
    }

    template <typename T1, typename std::enable_if<
                               MdTypeInfer::is_native<T1>::value ||
                               MdTypeInfer::is_complex<T1>::value>::value>
    inline MdStaticArray<bool> operator==(const MdStaticArray<T1> &other) {
        return __comp_eq_internal(other);
    }

    template <typename T1>
    inline MdStaticArray<bool> operator>(const MdStaticArray<T1> &other) {
        return __comp_g_internal(other);
    }

    template <typename T1>
    inline MdStaticArray<bool> operator>=(const MdStaticArray<T1> &other) {
        return __comp_geq_internal(other);
    }

    template <typename T1>
    inline MdStaticArray<bool> operator<(const MdStaticArray<T1> &other) {
        return __comp_l_internal(other);
    }

    template <typename T1>
    inline MdStaticArray<bool> operator<=(const MdStaticArray<T1> &other) {
        return __comp_leq_internal(other);
    }

    template <typename T1,
              typename std::enable_if<MdTypeInfer::is_arith<T1>::value>::value>
    inline MdStaticArray<bool> operator!=(const MdStaticArray<T1> &other) {
        return __comp_neq_internal(other);
    }

    template <typename T1>
    inline MdStaticArray<bool> operator==(const T1 &other) {
        return __comp_eq_iinternal(other);
    }

    template <typename T1>
    inline MdStaticArray<bool> operator>(const T1 &other) {
        return __comp_g_iinternal(other);
    }

    template <typename T1>
    inline MdStaticArray<bool> operator>=(const T1 &other) {
        return __comp_geq_iinternal(other);
    }

    template <typename T1>
    inline MdStaticArray<bool> operator<(const T1 &other) {
        return __comp_l_iinternal(other);
    }

    template <typename T1>
    inline MdStaticArray<bool> operator<=(const T1 &other) {
        return __comp_leq_iinternal(other);
    }

    template <typename T1>
    inline MdStaticArray<bool> operator!=(const T1 &other) {
        return __comp_neq_iinternal(other);
    }

    // To do: create a reference for multi-dimensional arrays.
    inline MdStaticArrayReference<T> operator[](const size_t index) const {
        if (index >= shape[0]) {
            throw std::runtime_error(
                "Index out of bounds while accessing index " +
                std::to_string(index) + " ( >= " + std::to_string(shape[0]) +
                ")");
        }
        return MdStaticArrayReference(*this, index * skip_vec[0]);
    }

    inline size_t get_size() const { return __size; }

    friend std::ostream &operator<<(std::ostream &op,
                                    const MdStaticArray<T> &ot) {
        // op << "here " << ot.size << '\n';
        if (ot.get_size() == 1) {
            op << ot.__array[0];
        } else if (ot.get_shape_size() == 1) {
            op << '[';
            for (size_t index = 0; index < ot.get_size(); ++index) {
                op << ot.__array[index];
                if (index != ot.get_size() - 1) {
                    op << ", ";
                }
            }
            op << ']';
        } else {
            op << '[';
            for (size_t index = 0; index < ot.get_shape()[0]; ++index) {
                op << ot[index];
                if (index != ot.get_shape()[0] - 1) {
                    op << ",\n";
                }
            }
            op << "]";
        }
        return op;
    }

    template <typename T1, typename T2>
    friend inline auto &operator+=(T1 &other,
                                   const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto &operator-=(T1 &other,
                                   const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto &operator*=(T1 &other,
                                   const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto &operator/=(T1 &other,
                                   const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto &operator%=(T1 &other,
                                   const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto &operator<<=(T1 &other,
                                    const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto &operator>>=(T1 &other,
                                    const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto &operator&=(T1 &other,
                                   const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto &operator|=(T1 &other,
                                   const MdStaticArrayReference<T2> &__first);

    template <typename T1, typename T2>
    friend inline auto &operator^=(T1 &other,
                                   const MdStaticArrayReference<T2> &__first);

    template <typename T1>
    friend inline auto operator-(const MdStaticArray<T1> __ndarray);

    template <typename T1>
    friend inline MdStaticArray<T1> operator-(
        const MdStaticArrayReference<T1> &__first);
};

#include "./md_static_array_op.hpp"

template <typename T>
void MdStaticArray<T>::set_thread_count(const uint8_t value) {
    s_thread_count = value;
    omp_set_num_threads(value);
}

template <typename T>
void MdStaticArray<T>::set_threshold_size(const size_t value) {
    s_threshold_size = value;
}

template <typename T1, typename T2,
          class = typename std::enable_if<std::is_arithmetic<T1>::value>::type>
inline auto operator+(const T1 &other, const MdStaticArray<T2> &first) {
    return first + other;
}

template <typename T1, typename T2,
          class = typename std::enable_if<std::is_arithmetic<T1>::value>::type>
inline auto operator-(const T1 &other, const MdStaticArray<T2> &first) {
    return first.__sub_iointernal(other);
}

template <typename T1, typename T2,
          class = typename std::enable_if<std::is_arithmetic<T1>::value>::type>
inline auto operator*(const T1 &other, const MdStaticArray<T2> &first) {
    return first * other;
}

template <typename T1, typename T2,
          class = typename std::enable_if<std::is_arithmetic<T1>::value>::type>
inline auto operator/(const T1 &other, const MdStaticArray<T2> &first) {
    return first.__div_iointernal(other);
}

template <typename T1, typename T2,
          class = typename std::enable_if<std::is_arithmetic<T1>::value>::type>
inline auto operator%(const T1 &other, const MdStaticArray<T2> &first) {
    return first.__mod_iointernal(other);
}

template <typename T1, typename T2,
          typename std::enable_if<MdTypeInfer::is_native<T2>::value ||
                                  MdTypeInfer::is_complex<T2>::value>::value>
inline auto operator==(const T1 &other, const MdStaticArray<T2> &first) {
    return first.__comp_eq_iinternal(other);
}

template <typename T1, typename T2,
          typename std::enable_if<MdTypeInfer::is_native<T2>::value ||
                                  MdTypeInfer::is_complex<T2>::value>::value>
inline auto operator!=(const T1 &other, const MdStaticArray<T2> &first) {
    return first.__comp_neq_iinternal(other);
}

template <typename T1, typename T2>
inline auto operator>(const T1 &other, const MdStaticArray<T2> &first) {
    return first.__comp_g_iinternal(other);
}

template <typename T1, typename T2>
inline auto operator<(const T1 &other, const MdStaticArray<T2> &first) {
    return first.__comp_l_iinternal(other);
}

template <typename T1, typename T2>
inline auto operator<=(const T1 &other, const MdStaticArray<T2> &first) {
    return first.__comp_leq_iinternal(other);
}

template <typename T1, typename T2>
inline auto operator>=(const T1 &other, const MdStaticArray<T2> &first) {
    return first.__comp_geq_iinternal(other);
}

template <typename T1, typename T2,
          class = typename std::enable_if<std::is_arithmetic<T1>::value>::type>
inline auto operator&(const T1 &other, const MdStaticArray<T2> &first) {
    return first.__and_bit_iinternal(other);
}

template <typename T1, typename T2,
          class = typename std::enable_if<std::is_arithmetic<T1>::value>::type>
inline auto operator|(const T1 &other, const MdStaticArray<T2> &first) {
    return first.__or_bit_iinternal(other);
}

template <typename T1, typename T2,
          class = typename std::enable_if<std::is_arithmetic<T1>::value>::type>
inline auto operator^(const T1 &other, const MdStaticArray<T2> &first) {
    return first.__xor_bit_iinternal(other);
}

template <typename T1, typename T2,
          class = typename std::enable_if<std::is_arithmetic<T1>::value>::type>
inline auto operator<<(const T1 &other, const MdStaticArray<T2> &first) {
    return first.__lshft_bit_iointernal(other);
}

template <typename T1, typename T2,
          class = typename std::enable_if<std::is_arithmetic<T1>::value>::type>
inline auto operator>>(const T1 &other, const MdStaticArray<T2> &first) {
    return first.__rshft_bit_iointernal(other);
}

template <typename T>
inline MdStaticArray<T> operator-(const MdStaticArray<T> &first) {
    return first.__ng_internal();
}

#include "./md_static_axis_reference.hpp"
#include "./md_static_reference.hpp"

template <typename T>
MdStaticArray<T> &MdStaticArray<T>::operator=(
    const MdStaticArrayReference<T> &other) {
    init_array(other.size);
    init_shape(&other.__array_reference->shape[other.shp_offset],
               other.__array_reference->shp_size - other.shp_offset);

    if (__size > s_threshold_size) {
#pragma omp parallel for
        for (size_t index = 0; index < __size; ++index) {
            __array[index] =
                other.__array_reference->__array[other.offset + index];
        }
    } else {
        for (size_t index = 0; index < __size; ++index) {
            __array[index] =
                other.__array_reference->__array[other.offset + index];
        }
    }

    return *this;
}

template <typename T>
MdStaticArray<T>::MdStaticArray(const MdStaticArrayReference<T> &other)
    : shape(nullptr), skip_vec(nullptr) {
    __size = other.size;
    init_array(__size);
    init_shape(&other.__array_reference->shape[other.shp_offset],
               other.__array_reference->shp_size - other.shp_offset);

    if (__size > s_threshold_size) {
#pragma omp parallel for
        for (size_t index = 0; index < __size; ++index) {
            __array[index] =
                other.__array_reference->__array[other.offset + index];
        }
    } else {
        for (size_t index = 0; index < __size; ++index) {
            __array[index] =
                other.__array_reference->__array[other.offset + index];
        }
    }
}

template <typename T1, typename T2>
inline auto &operator+=(T1 &other, const MdStaticArrayReference<T2> &__first) {
    if (__first.get_size() > 1) {
        throw std::runtime_error(
            "Operator += on single element requires size to be 1, found "
            "size: " +
            std::to_string(__first.get_size()));
    }
    other += __first.__array_reference->__array[__first.offset];
    return other;
}

template <typename T1, typename T2>
inline auto &operator-=(T1 &other, const MdStaticArrayReference<T2> &__first) {
    if (__first.get_size() > 1) {
        throw std::runtime_error(
            "Operator -= on single element requires size to be 1, found "
            "size: " +
            std::to_string(__first.get_size()));
    }
    other -= __first.__array_reference->__array[__first.shp_offset];
    return other;
}

template <typename T1, typename T2>
inline auto &operator*=(T1 &other, const MdStaticArrayReference<T2> &__first) {
    if (__first.get_size() > 1) {
        throw std::runtime_error(
            "Operator *= on single element requires size to be 1, found "
            "size: " +
            std::to_string(__first.get_size()));
    }
    other *= __first.__array_reference->__array[__first.offset];
    return other;
}

template <typename T1, typename T2>
inline auto &operator/=(T1 &other, const MdStaticArrayReference<T2> &__first) {
    if (__first.get_size() > 1) {
        throw std::runtime_error(
            "Operator /= on single element requires size to be 1, found "
            "size: " +
            std::to_string(__first.get_size()));
    }
    other /= __first.__array_reference->__array[__first.offset];
    return other;
}

template <typename T1, typename T2>
inline auto &operator%=(T1 &other, const MdStaticArrayReference<T2> &__first) {
    if (__first.get_size() > 1) {
        throw std::runtime_error(
            "Operator %= on single element requires size to be 1, found "
            "size: " +
            std::to_string(__first.get_size()));
    }
    other %= __first.__array_reference->__array[__first.offset];
    return other;
}

template <typename T1, typename T2>
inline auto &operator<<=(T1 &other, const MdStaticArrayReference<T2> &__first) {
    if (__first.get_size() > 1) {
        throw std::runtime_error(
            "Operator <<= on single element requires size to be 1, found "
            "size: " +
            std::to_string(__first.get_size()));
    }
    other <<= __first.__array_reference->__array[__first.offset];
    return other;
}

template <typename T1, typename T2>
inline auto &operator>>=(T1 &other, const MdStaticArrayReference<T2> &__first) {
    if (__first.get_size() > 1) {
        throw std::runtime_error(
            "Operator >>= on single element requires size to be 1, found "
            "size: " +
            std::to_string(__first.get_size()));
    }
    other >>= __first.__array_reference->__array[__first.offset];
    return other;
}

template <typename T1, typename T2>
inline auto &operator&=(T1 &other, const MdStaticArrayReference<T2> &__first) {
    if (__first.get_size() > 1) {
        throw std::runtime_error(
            "Operator &= on single element requires size to be 1, found "
            "size: " +
            std::to_string(__first.get_size()));
    }
    other &= __first.__array_reference->__array[__first.offset];
    return other;
}

template <typename T1, typename T2>
inline auto &operator|=(T1 &other, const MdStaticArrayReference<T2> &__first) {
    if (__first.get_size() > 1) {
        throw std::runtime_error(
            "Operator |= on single element requires size to be 1, found "
            "size: " +
            std::to_string(__first.get_size()));
    }
    other |= __first.__array_reference->__array[__first.offset];
    return other;
}

template <typename T1, typename T2>
inline auto &operator^=(T1 &other, const MdStaticArrayReference<T2> &__first) {
    if (__first.get_size() > 1) {
        throw std::runtime_error(
            "Operator ^= on single element requires size to be 1, found "
            "size: " +
            std::to_string(__first.get_size()));
    }
    other |= __first.__array_reference->__array[__first.offset];
    return other;
}

template <typename T>
MdStaticAxisReference<T> MdStaticArray<T>::get_axis_reference(
    const size_t axis) {
    return MdStaticAxisReference(*this, axis);
}

template <typename T>
MdStaticAxisReference<T> MdStaticArray<T>::get_nth_axis_reference(
    const size_t axis, const size_t n) {
    return MdStaticAxisReference(*this, axis, n);
}

#endif
