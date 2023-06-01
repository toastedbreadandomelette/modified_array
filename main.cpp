#include <omp.h>

#include <chrono>
#include <cmath>
#include <iomanip>
#include <iostream>

#include "./include/md_complex/md_complex.hpp"
#include "./include/md_static/array_manipulation.hpp"
#include "./include/md_static/fft.hpp"
#include "./include/md_static/functions.hpp"
#include "./include/md_static/functions/md_static_array_utility.hpp"
#include "./include/md_static/linear_algebra.hpp"
#include "./include/md_static/md_static_array/md_static_array.hpp"

int main(int argc, const char** argv) {
    // auto c = MdArrayUtility::f_arctan(f);

    // size_t sz = 32;
    // omp_set_num_threads(16);
    // MdStaticArray<double> c({sz, sz, sz, sz, sz}, 0);

    // for (size_t i = 1; i <= sz; ++i) {
    //     for (size_t k = 1; k <= sz; ++k) {
    //         for (size_t j = 1; j <= sz; ++j) {
    //             for (size_t l = 1; l <= sz; ++l) {
    //                 c[i - 1][k - 1][j - 1][l - 1] =
    //                     MdArrayUtility::range<double>(i, i + (sz) * (i), i);
    //             }
    //         }
    //     }
    // }

    MdStaticArray<double>::set_threshold_size(100000);
    MdStaticArray<double>::set_thread_count(8);
    size_t sz = 2048;
    // MdStaticArray<double>::set_thread_count(1);
    MdStaticArray<double> c({sz, sz}, 12), d({sz, sz}, 1024);
    std::cout << c.get_size() << '\n';

    auto start = std::chrono::system_clock::now();

    auto ans = Linalg::mat_multiply<double>(c, d);
    auto end = std::chrono::system_clock::now();

    std::chrono::duration<double> time = end - start;

    std::cout << "Time: " << time.count() << "s"
              << " " << std::endl;

    return 0;
}
