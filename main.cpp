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

int main(i32 argc, const char **argv) {
    // MdStaticArray<double>::set_threshold_size(1000);
    usize sz = 1024;
    // MdStaticArray<double>::set_thread_count(1);
    Array<c32> c({sz, sz}, 0), d({sz, sz}, 0);
    for (usize i = 0; i < sz; ++i) {
        c[i] = Utils::range<f64>(i * sz, i * sz + sz) + 12_i;
        d[i] = Utils::range<f64>(i * sz, i * sz + sz) + 32.3_i;
    }

    std::cout << c.get_size() << '\n';

    auto start = std::chrono::system_clock::now();
    auto ans = Linalg::mat_multiply<c32>(c, d, 16);
    auto end = std::chrono::system_clock::now();

    std::chrono::duration<f64> time = end - start;

    // std::cout << ans << '\n';

    std::cout << "Time: " << time.count() << "s"
              << " " << std::endl;

    return 0;
}
