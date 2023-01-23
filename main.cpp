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
    size_t sz = 1024;
    MdStaticArray<double>::set_threshold_size(1000000);
    MdStaticArray<cdouble> c({2, sz, sz}, 12 + 24.3_i),
        d({2, sz, sz}, 12 + 2.34_i);
    // c[0][0] = 11;
    // c[0][1] = 9;
    // c[0][2] = 24;
    // c[0][3] = 2 + 0.2112e-7_i;

    // c[1][0] = 1;
    // c[1][1] = 5 + 66.2112e-7_i;
    // c[1][2] = 2;
    // c[1][3] = 6;

    // c[2][0] = 3;
    // c[2][1] = 17;
    // c[2][2] = 18;
    // c[2][3] = 1;

    // c[3][0] = 2;
    // c[3][1] = 5;
    // c[3][2] = 7;
    // c[3][3] = 1;

    std::cout << c.get_shape()[1] << '\n';
    auto start = std::chrono::system_clock::now();
    // clongdouble a = MdLinearAlgebra::c_det<cdouble>(c);
    auto p = MdLinearAlgebra::dot<cdouble>(c, d);
    auto end = std::chrono::system_clock::now();

    std::cout << '\n';
    std::chrono::duration<double> time = end - start;

    // for (size_t i = 0; i < std::get<1>(a).get_shape()[0]; ++i) {
    //     std::cout << std::get<1>(a)[i] << '\n';
    // }

    std::cout << " Time: " << time.count() << "s"
              << " " << p.get_size() << std::endl;

    return 0;
}
