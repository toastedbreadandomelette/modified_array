#include <chrono>
#include <cmath>
#include <iostream>

#include "include/data_table.hpp"
#include "include/md_static/functions.hpp"
#include "include/md_static/functions/md_static_array_utility.hpp"
#include "include/md_static/functions/md_static_utility.hpp"
#include "include/md_static/md_static_array.hpp"

int main(int argc, const char **argv) {
    auto start = std::chrono::system_clock::now();
    // auto c = MdUtility::dot<size_t, size_t, size_t>(f, g, 16);
    // auto c = MdArrayUtility::f_arctan(f);
    auto p = 0.0000005;
    auto c = MdArrayUtility::sum(
        MdArrayUtility::range<double>(1, -1.00002, -0.00002));
    // auto sum = MdArrayUtility::sum(c);

    // auto c = f + g;
    auto end = std::chrono::system_clock::now();

    std::cout << '\n';
    std::chrono::duration<double> time = end - start;

    std::cout << c << " time: "
              << " " << time.count() << "s" << std::endl;

    return 0;
}
