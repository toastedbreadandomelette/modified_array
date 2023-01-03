#include <chrono>
#include <cmath>
#include <iostream>

#include "include/data_table.hpp"
#include "include/md_static/functions.hpp"
#include "include/md_static/functions/md_static_array_utility.hpp"
#include "include/md_static/functions/md_static_utility.hpp"
#include "include/md_static/md_static_array.hpp"

int main(int argc, const char **argv) {
    auto c = MdArrayUtility::range<double>(800000000);
    auto start = std::chrono::system_clock::now();
    // auto c = MdUtility::dot<size_t, size_t, size_t>(f, g, 16);
    // auto c = MdArrayUtility::f_arctan(f);
    auto sum = MdArrayUtility::std_dev(c);
    // auto sum = MdArrayUtility::sum(c);

    // auto c = f + g;
    auto end = std::chrono::system_clock::now();

    std::cout << '\n';
    std::chrono::duration<double> time = end - start;

    std::cout << sum << " time: "
              << " " << time.count() << "s" << std::endl;

    return 0;
}
