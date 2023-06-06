#pragma once
#ifndef _ZEROS_HPP_
#define _ZEROS_HPP_

#include "./md_array_manipulation.hpp"

template <typename T>
MdStaticArray<T> Manip::zeros(const usize size) {
    return MdStaticArray<T>(size, 0);
}

template <typename T>
MdStaticArray<T> Manip::zeros(const std::vector<usize>& shape) {
    return MdStaticArray<T>(shape, 0);
}

#endif
