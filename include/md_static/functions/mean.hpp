#pragma once
#ifndef _MEAN_HPP_
#define _MEAN_HPP_
#include "./md_static_array_utility.hpp"

template <typename _T>
long double MdArrayUtility::mean(const MdStaticArray<_T> &__values,
                                 const _T init) {
    return sum(__values) / (__values.get_size() * 1.0);
}

template <typename _T>
long double MdArrayUtility::mean(
    const MdStaticArrayReference<_T> &__values, const _T init) {
    return mean<_T>(MdStaticArray<_T>(*__values.__array_reference,
                                      __values.offset, __values.shp_offset),
                    init);
}

#endif
