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
    size_t sz = 8;
    MdStaticArray<double>::set_threshold_size(100);
    // MdStaticArray<double>::set_thread_count(1);

    MdStaticArray<double> c = MdArrayUtility::range(5242880);
    // MdStaticArray<double> c({8000}, 1.03);
    // MdStaticArray<float> d(sz, 223);

    auto start = std::chrono::system_clock::now();
    // clongdouble a = MdLinearAlgebra::c_det<cdouble>(c);
    // for (size_t index = 0; index < 1; ++index) {
    // auto p = c + d;
    // auto l = c - (d) / 2.5;
    // auto m = c * d + 222;
    // auto n = (201112 / c) + 1.93;

    // MdStaticArray<double> arr({20, 20, 20}, 0);
    // for (size_t i = 0; i < arr.get_shape()[0]; ++i) {
    //     for (size_t j = 0; j < arr.get_shape()[1]; ++j) {
    //         arr[i][j] = MdArrayUtility::range<double>(0 + i + j, 20 + i + j,
    //         1);
    //     }
    // }

    // arr[18] = arr[17];
    // for (size_t index = 0; index < 100; ++index) {
    auto ans = FFT::fft(c);
    // auto ians = FFT::ifft<double>(ans);
    // }
    // auto ans = MdArrayManipulate::vandermonte(c);
    // }
    auto end = std::chrono::system_clock::now();

    std::cout << '\n';
    std::chrono::duration<double> time = end - start;

    // for (size_t i = 0; i < std::get<1>(a).get_shape()[0]; ++i) {
    //     std::cout << std::get<1>(a)[i] << '\n';
    // }
    // std::cout << std::setprecision(20) << '\n';
    // std::cout << p << '\n';
    // std::cout << l << '\n';
    // std::cout << m << '\n';
    // std::cout << n << '\n';
    // s <<= c[12];
    // c[2] = -c[2];

    // for (size_t i = 0; i < arr.get_shape()[0]; ++i) {
    //     for (size_t j = 0; j < arr.get_shape()[1]; ++j) {
    //         std::cout << arr[i][j] << '\n';
    //     }
    //     std::cout << '\n';
    // }

    // std::cout << ians << '\n';
    // for (size_t i = 0; i < ans.get_shape_size(); ++i) {
    //     std::cout << ans.get_shape()[i] << '\n';
    // }

    std::cout << '\n';

    std::cout << " Time: " << time.count() << "s"
              << " " << std::endl;

    return 0;
}
