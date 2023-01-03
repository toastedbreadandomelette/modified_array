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
    auto c = MdArrayUtility::range<double>(0, 1, 0.00000005);
    // auto sum = MdArrayUtility::sum(c);

    // auto c = f + g;
    auto end = std::chrono::system_clock::now();

    std::chrono::duration<double> time = end - start;

    std::cout << c.get_size() << " time: "
              << " " << time.count() << "s" << std::endl;

    return 0;
}
