#pragma once
#ifndef _ONES_HPP_
#define _ONES_HPP_

#include "./md_array_manipulation.hpp"

template <typename T>
MdStaticArray<T> Manip::ones(const size_t size) {
    return MdStaticArray<T>(size, 1);
}

template <typename T>
MdStaticArray<T> Manip::ones(const std::vector<size_t>& shape) {
    return MdStaticArray<T>(shape, 1);
}

#endif
