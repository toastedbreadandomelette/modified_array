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
    usize sz = 262144;
    // MdStaticArray<double>::set_thread_count(1);
    Array<f64> c({sz}, 0), d({sz}, 0);
    for (usize i = 0; i < sz; ++i) {
        // c[i] = Utils::range<f64>(i * sz, i * sz + sz);
        // d[i] = Utils::range<f64>(i * sz, i * sz + sz);
    }
    c = Utils::range<f64>(sz);

    std::cout << c.get_size() << '\n';

    auto start = std::chrono::system_clock::now();
    auto ans = FFT::fft<f64>(c);
    auto end = std::chrono::system_clock::now();

    std::chrono::duration<f64> time = end - start;

    // std::cout << c << "\n\n";
    // std::cout << ans << '\n';

    std::cout << "Time: " << time.count() << "s"
              << " " << std::endl;

    // c64 *ss = aligned_allocate<c64>(64, sz);

    // for (i32 i = 0; i < sz; ++i) ss[i] = i;
    // c64 *dest = aligned_allocate<c64>(64, sz);

    // start = std::chrono::system_clock::now();
    // dft_subarray_inplace(ss, 0, sz);
    // end = std::chrono::system_clock::now();

    // time = end - start;

    // std::cout << "SIMD Time: " << time.count() << "s"
    //           << " " << std::endl;

    // std::cout << ans << '\n';

    // std::cout << '[';
    // for (i32 i = 0; i < sz; ++i) {
    //     std::cout << ss[i];
    //     if (i < sz - 1) {
    //         std::cout << ", ";
    //     }
    // }
    // std::cout << ']';
    return 0;
}
