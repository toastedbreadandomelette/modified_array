#pragma once
#ifndef _ZEROS_HPP_
#define _ZEROS_HPP_

#include "./md_array_manipulation.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayManipulate::zeros(const size_t __size) {
    return MdStaticArray<_T>(__size, 0);
}

template <typename _T>
MdStaticArray<_T> MdArrayManipulate::zeros(const std::vector<size_t>& __shape) {
    return MdStaticArray<_T>(__shape, 0);
}

#endif
