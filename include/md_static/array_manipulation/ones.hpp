#pragma once
#ifndef _ONES_HPP_
#define _ONES_HPP_

#include "./md_array_manipulation.hpp"

template <typename T>
MdStaticArray<T> MdArrayManipulate::ones(const size_t __size) {
    return MdStaticArray<T>(__size, 1);
}

template <typename T>
MdStaticArray<T> MdArrayManipulate::ones(const std::vector<size_t>& __shape) {
    return MdStaticArray<T>(__shape, 1);
}

#endif
