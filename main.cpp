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

int main(int argc, const char **argv) {
    // auto c = MdArrayUtility::f_arctan(f);
    size_t sz = 2048;
    MdStaticArray<double> c({sz, sz}, 1), d({sz, sz}, 1);
    auto start = std::chrono::system_clock::now();
    // auto c = MdUtility::dot<size_t, size_t, size_t>(f, g, 16);
    auto sum = MdLinearAlgebra::mat_multiply<double, double, double>(c, d);
    // auto sum = MdArrayUtility::sum(c);
    // auto c = f + g;
    auto end = std::chrono::system_clock::now();

    std::cout << '\n';
    std::chrono::duration<double> time = end - start;

    std::cout << sum.get_size() << " time: " << sum[2047] << " " << time.count()
              << "s" << std::endl;

    return 0;
}
