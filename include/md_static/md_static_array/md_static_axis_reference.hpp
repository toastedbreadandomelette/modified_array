#pragma once
#ifndef _MD_STATIC_AXIS_REFERENCE_HPP_
#define _MD_STATIC_AXIS_REFERENCE_HPP_

#include "./md_static_array.hpp"

template <class T>
class MdStaticAxisReference {
    const MdStaticArray<T> *arr_ptr_;
    size_t axis_;
    size_t stride_;
    size_t total_number_of_axes_;
    size_t current_axes_;
    size_t start_;
    size_t axis_size_;

 public:
    constexpr MdStaticAxisReference() {
        arr_ptr_ = nullptr;
        axis_ = 0;
        stride_ = 0;
        total_number_of_axes_ = 0;
        current_axes_ = start_ = axis_size_ = 0;
    }

    constexpr MdStaticAxisReference(const MdStaticArray<T> &other) {
        for (int index = 0; index < axis_size_; ++index) {
            (*this)[index] = other.__array[index];
        }
    }

    constexpr MdStaticAxisReference &operator=(const MdStaticArray<T> &other) {
        for (int index = 0; index < axis_size_; ++index) {
            (*this)[index] = other.__array[index];
        }

        return *this;
    }

    constexpr MdStaticAxisReference(const MdStaticArray<T> &new_array,
                                    const size_t a) {
        arr_ptr_ = &new_array;
        axis_ = a;
        stride_ = new_array.skip_vec[axis_];
        axis_size_ = new_array.shape[axis_];
        total_number_of_axes_ = new_array.get_size() / new_array.shape[axis_];
        current_axes_ = 0;
        start_ = 0;
    }

    constexpr MdStaticAxisReference(const MdStaticArray<T> &new_array,
                                    const size_t a,
                                    const size_t current_axis_init) {
        arr_ptr_ = &new_array;
        axis_ = a;
        stride_ = new_array.skip_vec[axis_];
        axis_size_ = new_array.shape[axis_];
        total_number_of_axes_ = new_array.get_size() / new_array.shape[axis_];
        current_axes_ = current_axis_init;
        const size_t dim_skip = stride_ * axis_size_;
        start_ = (current_axis_init / stride_) * (dim_skip) +
                 current_axis_init % stride_;
    }

    inline T &operator[](const size_t index) const {
        return arr_ptr_->__array[start_ + stride_ * index];
    }

    inline bool switch_to_next_axis_index() {
        ++current_axes_;
        if (current_axes_ >= total_number_of_axes_) {
            return false;
        }
        ++start_;
        if (current_axes_ % stride_ == 0) {
            start_ += (stride_ * (axis_size_ - 1));
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

    inline size_t get_size() const { return axis_size_; }

    inline size_t get_axis_index() const { return current_axes_; }

    inline size_t get_total_axes() const { return total_number_of_axes_; }
};

#endif