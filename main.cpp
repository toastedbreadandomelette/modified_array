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
    size_t sz = 20;
    MdStaticArray<double>::set_threshold_size(1000000);

    MdStaticArray<int64_t> c(sz, (13));
    MdStaticArray<float> d(sz, 223);

    auto start = std::chrono::system_clock::now();
    // clongdouble a = MdLinearAlgebra::c_det<cdouble>(c);
    for (size_t index = 0; index < 100000; ++index) {
        auto p = c + d;
        auto l = c - (d) / 2.5;
        auto m = c * d + 222;
        auto n = (201112 / c) + 1.93;
    }
    auto end = std::chrono::system_clock::now();

    std::cout << '\n';
    std::chrono::duration<double> time = end - start;

    // for (size_t i = 0; i < std::get<1>(a).get_shape()[0]; ++i) {
    //     std::cout << std::get<1>(a)[i] << '\n';
    // }
    std::cout << std::setprecision(20) << '\n';
    // std::cout << p << '\n';
    // std::cout << l << '\n';
    // std::cout << m << '\n';
    // std::cout << n << '\n';
    std::cout << " Time: " << time.count() << "s"
              << " " << std::endl;

    return 0;
}
