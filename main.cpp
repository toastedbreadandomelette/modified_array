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
    size_t sz = 500;
    MdStaticArray<double>::set_threshold_size(1000000);
    MdStaticArray<double> c({sz, sz, sz}, 12.22);
    for (size_t i = 0; i < c.get_shape()[0]; ++i) {
        for (size_t j = 0; j < c.get_shape()[1]; ++j) {
            for (size_t k = 0; k < c.get_shape()[2]; ++k) {
                c[i][j][k] = i * j * k + 1;
            }
        }
        // std::cout << '\n';
    }

    // for (size_t i = 0; i < c.get_shape()[0]; ++i) {
    //     for (size_t j = 0; j < c.get_shape()[1]; ++j) {
    //         std::cout << c[i][j] << '\n';
    //     }
    //     std::cout << '\n';
    // }

    MdStaticArray<double> d({sz, sz}, 1.2);
    auto start = std::chrono::system_clock::now();
    auto a = MdArrayUtility::diff<double>(c, 1, 1);
    auto end = std::chrono::system_clock::now();

    std::cout << '\n';
    std::chrono::duration<double> time = end - start;

    // for (size_t i = 0; i < a.get_shape()[0]; ++i) {
    //     for (size_t j = 0; j < a.get_shape()[1]; ++j) {
    //         std::cout << a[i][j] << '\n';
    //     }
    //     std::cout << '\n';
    // }

    std::cout << " Time: " << time.count() << "s"
              << " " << std::endl;

    return 0;
}
