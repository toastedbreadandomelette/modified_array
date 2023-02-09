#pragma once
#ifndef _SHAPE_HPP_
#define _SHAPE_HPP_

#include <stdlib.h>

#include <ostream>
#include <vector>

/**
 * @brief Shape struct
 */
struct Shape {
    size_t* shape;        /// Actual shape array
    size_t* skip_vec;     /// Stride vector
    size_t shape_size;    /// Size of shape array
    size_t overall_size;  /// Overall size of the master array

    constexpr Shape()
        : shape(nullptr), skip_vec(nullptr), shape_size(0), overall_size(0) {}

    constexpr Shape(size_t size)
        : shape(nullptr), skip_vec(nullptr), shape_size(1), overall_size(0) {
        shape = static_cast<size_t*>(malloc(sizeof(size_t)));
        skip_vec = static_cast<size_t*>(malloc(sizeof(size_t)));
        shape[0] = size;
        skip_vec[0] = 1;
        overall_size = 1;
    }

    constexpr Shape(const std::vector<size_t>& shp)
        : shape(nullptr),
          skip_vec(nullptr),
          shape_size(shp.size()),
          overall_size(0) {
        size_t size = shp.size();
        shape = static_cast<size_t*>(malloc(shape_size * sizeof(size_t)));
        skip_vec = static_cast<size_t*>(malloc(shape_size * sizeof(size_t)));
        for (const size_t axis_size : shp) {
            overall_size *= axis_size;
        }

        shape[shape_size - 1] = shp[shape_size - 1];
        skip_vec[shape_size - 1] = 1;
        for (int16_t i = shape_size - 2; i >= 0; --i) {
            shape[i] = shp[i];
            skip_vec[i] = shp[i + 1] * skip_vec[i + 1];
        }
    }

    const size_t operator[](const size_t index) const { return shape[index]; }

    friend std::ostream& operator<<(std::ostream& op, const Shape& shp) {
        op << '(';
        for (size_t index = 0; index < shp.shape_size; ++index) {
            op << shp.shape[index];
            if (index < shp.shape_size - 1) {
                op << ", ";
            }
        }
        op << ')';
        return op;
    }
};

#endif
