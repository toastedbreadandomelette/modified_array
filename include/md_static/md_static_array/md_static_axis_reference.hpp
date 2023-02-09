#pragma once
#ifndef _MD_STATIC_AXIS_REFERENCE_HPP_
#define _MD_STATIC_AXIS_REFERENCE_HPP_

#include "./md_static_array.hpp"

template <class T>
class MdStaticAxisReference {
    const MdStaticArray<T> *arr_ref;
    size_t axis;
    size_t stride;
    size_t total_number_of_axes;
    size_t current_axes;
    size_t start;
    size_t axis_size;

 public:
    constexpr MdStaticAxisReference() {
        arr_ref = nullptr;
        axis = 0;
        stride = 0;
        total_number_of_axes = 0;
        current_axes = start = axis_size = 0;
    }

    constexpr MdStaticAxisReference(const MdStaticArray<T> &other) {
        for (size_t index = 0; index < axis_size; ++index) {
            (*this)[index] = other.__array[index];
        }
    }

    constexpr MdStaticAxisReference &operator=(const MdStaticArray<T> &other) {
        for (size_t index = 0; index < axis_size; ++index) {
            (*this)[index] = other.__array[index];
        }

        return *this;
    }

    constexpr MdStaticAxisReference(const MdStaticArray<T> &new_array,
                                    const size_t a) {
        arr_ref = &new_array;
        axis = a;
        stride = new_array.skip_vec[axis];
        axis_size = new_array.shape[axis];
        total_number_of_axes = new_array.get_size() / new_array.shape[axis];
        current_axes = 0;
        start = 0;
    }

    constexpr MdStaticAxisReference(const MdStaticArray<T> &new_array,
                                    const size_t a, const size_t n) {
        arr_ref = &new_array;
        axis = a;
        stride = new_array.skip_vec[axis];
        axis_size = new_array.shape[axis];
        total_number_of_axes = new_array.get_size() / new_array.shape[axis];
        current_axes = n;
        const size_t dim_skip = stride * axis_size;
        start = (n / stride) * (dim_skip) + n % stride;
    }

    inline T &operator[](const size_t index) const {
        // std::cout << "index " << start << " " << stride << " " << index << "
        // "
        //           << arr_ref->get_size() << " " << (start + stride * index)
        //           << '\n';
        return arr_ref->__array[start + stride * index];
    }

    inline bool switch_to_next_axis_index() {
        ++current_axes;
        if (current_axes >= total_number_of_axes) {
            return false;
        }
        // std::cout << current_axes << " :: " << total_number_of_axes << '\n';
        ++start;
        if (current_axes % stride == 0) {
            start += (stride * (axis_size - 1));
        }

        return true;
    }

    friend std::ostream &operator<<(std::ostream &op,
                                    const MdStaticAxisReference &arr) {
        op << '[';
        for (size_t index = 0; index < arr.get_size(); ++index) {
            op << arr[index];
            if (index < arr.get_size() - 1) {
                op << ", ";
            }
        }
        op << ']';
        return op;
    }

    inline size_t get_size() const { return axis_size; }

    inline size_t get_axis_index() const { return current_axes; }

    inline size_t get_total_axes() const { return total_number_of_axes; }
};

#endif
