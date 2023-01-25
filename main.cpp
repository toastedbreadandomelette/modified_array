#include <chrono>
#include <cmath>
#include <complex>
#include <iomanip>
#include <iostream>

#include "./include/md_complex/md_complex.hpp"
#include "./include/md_static/array_manipulation.hpp"
#include "./include/md_static/functions.hpp"
#include "./include/md_static/functions/md_static_array_utility.hpp"
#include "./include/md_static/linear_algebra.hpp"
#include "./include/md_static/md_static_array.hpp"

int main(int argc, const char** argv) {
    // auto c = MdArrayUtility::f_arctan(f);
    // size_t sz = 3;
    MdStaticArray<double>::set_threshold_size(10000);
    // MdStaticArray<size_t> c({sz}, 0), d({2, sz}, 1);
    // for (size_t i = 0; i < c.get_shape()[0]; ++i) {
    //     // for (size_t j = 0; j < c.get_shape()[1]; ++j) {
    //     // c[i][j] = MdArrayUtility::range<size_t>(3, 3 * 33, 3);
    //     c[i] = MdArrayUtility::range<size_t>(3, 3 * (sz + 1), 3);
    //     // }
    // }
    // std::cout << c << '\n';
    auto c = MdArrayUtility::range<size_t>(200000000) % 30 + 1;
    auto start = std::chrono::system_clock::now();
    // clongdouble a = MdLinearAlgebra::c_det<cdouble>(c);
    auto p = MdArrayUtility::lcm<size_t>(c);
    auto end = std::chrono::system_clock::now();

    std::cout << '\n';
    std::chrono::duration<double> time = end - start;

    // for (size_t i = 0; i < std::get<1>(a).get_shape()[0]; ++i) {
    //     std::cout << std::get<1>(a)[i] << '\n';
    // }
    // std::cout << c << '\n';
    std::cout << " Time: " << time.count() << "s"
              << " " << p << std::endl;

    return 0;
}
