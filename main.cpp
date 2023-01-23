#include <chrono>
#include <cmath>
#include <complex>
#include <iomanip>
#include <iostream>

#include "./include/data_table.hpp"
#include "./include/md_complex/md_complex.hpp"
#include "./include/md_static/array_manipulation.hpp"
#include "./include/md_static/functions.hpp"
#include "./include/md_static/functions/md_static_array_utility.hpp"
#include "./include/md_static/linear_algebra.hpp"
#include "./include/md_static/md_static_array.hpp"

int main(int argc, const char** argv) {
    // auto c = MdArrayUtility::f_arctan(f);
    size_t sz = 4;
    MdStaticArray<double>::set_threshold_size(1000000);
    MdStaticArray<cdouble> c({sz, sz}, (12.5 - 2.112_i));
    c[0][0] = 11 + 5.2_i;
    c[0][1] = 9 + 6_i;
    c[0][2] = 24 + 0.2112_i;
    c[0][3] = 2 + 0.2112_i;

    c[1][0] = 1;
    c[1][1] = 5;
    c[1][2] = 2;
    c[1][3] = 6 + 13.5_i;

    c[2][0] = 3;
    c[2][1] = 17;
    c[2][2] = 18 + 0.2112_i;
    c[2][3] = 1;

    c[3][0] = 2;
    c[3][1] = 5;
    c[3][2] = 7 - 0.2112_i;
    c[3][3] = 1 - 123._i;
    // for (size_t i = 0; i < c.get_shape()[0]; ++i) {
    //     for (size_t j = 0; j < c.get_shape()[1]; ++j) {
    //         // for (size_t k = 0; k < c.get_shape()[2]; ++k) {
    //         c[i][j] = i * j + 1;
    //         // }
    //     }
    //     // std::cout << '\n';
    // }

    // for (size_t i = 0; i < c.get_shape()[0]; ++i) {
    //     for (size_t j = 0; j < c.get_shape()[1]; ++j) {
    //         std::cout << c[i][j] << '\n';
    //     }
    //     std::cout << '\n';
    // }

    auto start = std::chrono::system_clock::now();
    cdouble a = MdLinearAlgebra::c_det<cdouble>(c);
    auto end = std::chrono::system_clock::now();

    std::cout << '\n';
    std::chrono::duration<double> time = end - start;

    // for (size_t i = 0; i < std::get<0>(a).get_shape()[0]; ++i) {
    //     std::cout << std::get<0>(a)[i] << '\n';
    // }

    std::cout << " Time: " << time.count() << "s"
              << " " << a << std::endl;

    return 0;
}
