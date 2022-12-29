#include <iostream>
#include <chrono>
#include <cmath>

#include "include/data_table.hpp"
#include "include/md_static/md_static_array.hpp"
#include "include/md_static/md_static_mat_utility.hpp"

int main (int argc, const char **argv) {
    size_t dm_size = 2048;
    MdStaticArray<double> f(std::vector<size_t>({dm_size, dm_size}), 2);
    MdStaticArray<double> g(std::vector<size_t>({dm_size, dm_size}), 2);

    auto start = std::chrono::system_clock::now();
    auto c = Matrix::multiply<double, double, double>(f, g, 16);
    auto end = std::chrono::system_clock::now();

    std::chrono::duration<double> time = end - start;

    // std::cout << c[0] << std::endl;

    std::cout << f.get_size() << " time: " << time.count() << "s" << std::endl;

    return 0;
}
