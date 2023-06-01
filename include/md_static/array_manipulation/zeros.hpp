#pragma once
#ifndef _ZEROS_HPP_
#define _ZEROS_HPP_

#include "./md_array_manipulation.hpp"

template <typename T>
MdStaticArray<T> MdArrayManipulate::zeros(const size_t __size) {
    return MdStaticArray<T>(__size, 0);
}

template <typename T>
MdStaticArray<T> MdArrayManipulate::zeros(const std::vector<size_t>& __shape) {
    return MdStaticArray<T>(__shape, 0);
}

#endif
