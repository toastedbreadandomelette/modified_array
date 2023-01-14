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
    size_t sz = 1048576 << 7;
    MdStaticArray<double>::set_threshold_size(1000000);
    MdStaticArray<double> d(sz, 12.22);
    auto start = std::chrono::system_clock::now();
    // #pragma omp parallel for
    // for (size_t index = 0; index < c.get_size(); ++index) {
    //     c[index] = 1.2;
    // }
    MdStaticArray<double> c(sz, 1.2);
    auto end = std::chrono::system_clock::now();

    std::cout << '\n';
    std::chrono::duration<double> time = end - start;

    std::cout << " Time: " << time.count() << "s"
              << " " << std::endl;

    return 0;
}
