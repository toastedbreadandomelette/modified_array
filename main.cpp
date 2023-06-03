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
    // MdStaticArray<double>::set_threshold_size(10000000);
    MdStaticArray<double>::set_thread_count(1);
    size_t sz = 1024;
    // MdStaticArray<double>::set_thread_count(1);
    MdStaticArray<double> c({sz, sz}, 0), d({sz, sz}, 0);
    for (size_t i = 0; i < sz; ++i) {
        c[i] = MdArrayUtility::range(sz);
        d[i] = MdArrayUtility::range(sz);
    }

    std::cout << c.get_size() << '\n';

    auto start = std::chrono::system_clock::now();
    auto ans = Linalg::mat_multiply<double>(c, d);
    auto end = std::chrono::system_clock::now();

    std::chrono::duration<double> time = end - start;

    // std::cout << ans << '\n';

    std::cout << "Time: " << time.count() << "s"
              << " " << std::endl;

    return 0;
}
