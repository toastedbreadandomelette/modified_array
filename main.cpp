#include <chrono>
#include <cmath>
#include <complex>
#include <iomanip>
#include <iostream>

#include "./include/data_table.hpp"
#include "./include/md_static/functions.hpp"
#include "./include/md_static/functions/md_static_array_utility.hpp"
#include "./include/md_static/linear_algebra.hpp"
#include "./include/md_static/md_static_array.hpp"

int main(int argc, const char** argv) {
    // auto c = MdArrayUtility::f_arctan(f);
    size_t sz = 400;
    MdStaticArray<double> c({sz, sz, sz, 2}, 23);
    MdStaticArray<double> d({sz, sz}, 0.22231232132);
    MdStaticArray<double>::set_threshold_size(1000000);
    // for (size_t i = 0; i < c.get_shape()[0]; ++i) {
    //     for (size_t j = 0; j < c.get_shape()[1]; ++j) {
    //         for (size_t k = 0; k < c.get_shape()[2]; ++k) {
    //             for (size_t l = 0; l < c.get_shape()[3]; ++l) {
    //                 c[i][j][k][l] = i + j + k + l;
    //             }
    //         }
    //     }
    // }

    // for (size_t i = 0; i < d.get_shape()[0]; ++i) {
    //     for (size_t j = 0; j < d.get_shape()[1]; ++j) {
    //         for (size_t k = 0; k < d.get_shape()[2]; ++k) {
    //             for (size_t l = 0; l < d.get_shape()[3]; ++l) {
    //                 d[i][j][k][l] = 30 - (i + j + k + l);
    //             }
    //         }
    //     }
    // }
    // c[16383][16383] = 2;
    // auto c = MdArrayUtility::range<double>(0, 1, 0.000000005);
    auto start = std::chrono::system_clock::now();
    // auto c = MdUtility::dot<size_t, size_t, size_t>(f, g, 16);
    // auto csum = MdArrayUtility::cumulative_sum<double>(c);
    // auto ans = MdLinearAlgebra::multi_dot<double>(c, c, d, d);

    // To do, fix the code seg fault below
    // for (size_t i = 0; i < 511; ++i) {
    //     auto an = MdLinearAlgebra::dot<double, double, double>(c, d, 1);
    // }
    auto an = MdArrayUtility::cumulative_sum<double>(c, 4);
    // auto sum = MdArrayUtility::sum(c);
    // auto c = f + g;
    auto end = std::chrono::system_clock::now();

    std::cout << '\n';
    std::chrono::duration<double> time = end - start;

    // std::cout << dd.get_size() << " " << dd[0] << " " << '\n';

    // for (size_t i = 0; i < an.get_shape()[0]; ++i) {
    //     for (size_t j = 0; j < an.get_shape()[1]; ++j) {
    //         std::cout << an[i][j] << '\n';
    //     }
    //     std::cout << '\n';
    // }
    // for (size_t i = 0; i < dd.get_shape()[0]; ++i) {
    //     // for (size_t j = 0; j < dd.get_shape()[1]; ++j) {
    //     std::cout << dd[i] << '\n';
    //     // }
    //     // std::cout << '\n';
    // }
    std::cout << " Time: " << time.count() << "s"
              << " " << an.get_size() << std::endl;

    return 0;
}
