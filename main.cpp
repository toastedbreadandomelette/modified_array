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
    MdStaticArray<double> c({sz, sz, sz, 3}, 23);
    MdStaticArray<double> d({sz, sz}, 0.22231232132);
    MdStaticArray<double>::set_threshold_size(1000000);
    auto start = std::chrono::system_clock::now();
    auto an = MdArrayUtility::cumulative_product<double>(c, 1);
    auto end = std::chrono::system_clock::now();

    std::cout << '\n';
    std::chrono::duration<double> time = end - start;

    std::cout << " Time: " << time.count() << "s"
              << " " << an.get_size() << std::endl;

    return 0;
}
