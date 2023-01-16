#pragma once
#ifndef _ONES_HPP_
#define _ONES_HPP_

#include "./md_array_manipulation.hpp"

template <typename _T>
MdStaticArray<_T> MdArrayManipulate::ones(const size_t __size) {
    return MdStaticArray<_T>(__size, 1);
}

template <typename _T>
MdStaticArray<_T> MdArrayManipulate::ones(const std::vector<size_t>& __shape) {
    return MdStaticArray<_T>(__shape, 1);
}

#endif
