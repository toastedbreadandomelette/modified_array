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
    size_t sz = 1231232;
    MdStaticArray<double>::set_threshold_size(10000);
    MdStaticArray<double> c({102, sz}, 1), d({2, sz}, 1);
    for (size_t index = 0; index < c.get_shape()[0]; ++index) {
        c[index] = MdArrayUtility::range<double>(1231232);
    }
    std::cout << c.get_shape()[0] << '\n';
    auto start = std::chrono::system_clock::now();
    // clongdouble a = MdLinearAlgebra::c_det<cdouble>(c);
    auto p = MdArrayUtility::mean<double>(c, 0, 1);
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
