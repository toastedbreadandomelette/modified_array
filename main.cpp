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
    size_t sz = 12;
    MdStaticArray<size_t> c({sz, sz}, 1), d({sz, sz}, 2);
    MdStaticArray<double>::set_threshold_size(1000000);
    // c[16383][16383] = 2;
    // auto c = MdArrayUtility::range<double>(0, 1, 0.000000005);
    auto start = std::chrono::system_clock::now();
    // auto c = MdUtility::dot<size_t, size_t, size_t>(f, g, 16);
    // auto csum = MdArrayUtility::cumulative_sum<double>(c);
    auto ans = MdLinearAlgebra::multi_dot<double>(
        c, c, c, c, c, c, c, c, c, c, c, c, c, c, c, c, d, d, d, d, d, d, d);

    // To do, fix the code seg fault below

    // auto an =
    //     MdLinearAlgebra::multi_dot<double, size_t, size_t, size_t>(c, c,
    //     d[0]);
    // auto sum = MdArrayUtility::sum(c);
    // auto c = f + g;
    auto end = std::chrono::system_clock::now();

    std::cout << '\n';
    std::chrono::duration<double> time = end - start;

    // std::cout << dd.get_size() << " " << dd[0] << " " << '\n';

    for (size_t i = 0; i < 2; ++i) {
        std::cout << ans[i] << '\n';
    }
    // for (size_t i = 0; i < dd.get_shape()[0]; ++i) {
    //     // for (size_t j = 0; j < dd.get_shape()[1]; ++j) {
    //     std::cout << dd[i] << '\n';
    //     // }
    //     // std::cout << '\n';
    // }
    std::cout << " Time: " << time.count() << "s"
              << " " << ans.get_size() << std::endl;

    return 0;
}
