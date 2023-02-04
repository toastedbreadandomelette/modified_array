#include <omp.h>

#include <chrono>
#include <cmath>
#include <complex>
#include <iomanip>
#include <iostream>

#include "./include/md_complex/md_complex.hpp"
#include "./include/md_static/array_manipulation.hpp"
#include "./include/md_static/fft.hpp"
#include "./include/md_static/functions.hpp"
#include "./include/md_static/functions/md_static_array_utility.hpp"
#include "./include/md_static/linear_algebra.hpp"
#include "./include/md_static/md_static_array.hpp"

int main(int argc, const char** argv) {
    // auto c = MdArrayUtility::f_arctan(f);
    size_t sz = 16;
    // omp_set_num_threads(8);
    // MdStaticArray<double>::set_threshold_size(100);
    // MdStaticArray<double>::set_thread_count(1);

    MdStaticArray<double> c({sz, sz}, 0);
    for (size_t index = 0; index < sz; ++index) {
        c[index] = MdArrayUtility::range(index, index + sz);
    }
    auto start = std::chrono::system_clock::now();

    cdouble ans = cdouble{-8, 8} * cdouble{0.707107, -0.707107};
    std::cout << FFT::fft(c[0]) << '\n';
    auto end = std::chrono::system_clock::now();

    std::cout << c[0] << '\n';
    std::cout << ans << '\n';
    std::chrono::duration<double> time = end - start;

    std::cout << '\n';

    std::cout << " Time: " << time.count() << "s"
              << " " << std::endl;

    return 0;
}
