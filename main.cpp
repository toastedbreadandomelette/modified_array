#include <chrono>
#include <cmath>
#include <iostream>

#include "include/data_table.hpp"
#include "include/md_static/md_static_array.hpp"
#include "include/md_static/md_static_mat_utility.hpp"
#include "include/md_static/md_static_utility.hpp"

int main(int argc, const char **argv) {
    size_t dm_size = 32;
    MdStaticArray<int> f(
        std::vector<size_t>({dm_size, dm_size, dm_size, dm_size}), 1);
    MdStaticArray<int> g(std::vector<size_t>({dm_size, dm_size, dm_size}), 1);

    // for (int i = 0; i < f.get_shape()[0]; ++i) {
    //     for (int j = 0; j < f.get_shape()[1]; ++j) {
    //         for (int k = 0; k < f.get_shape()[2]; ++k) {
    //             f[i][j][k] = j + k;
    //         }
    //     }
    // }
    // for (int i = 0; i < g.get_shape()[0]; ++i) {
    //     for (int j = 0; j < g.get_shape()[1]; ++j) {
    //         g[i][j] = i + j;
    //     }
    // }
    auto start = std::chrono::system_clock::now();
    auto c = MdUtility::dot<int, int, int>(f, g);
    // auto c = f + g;
    auto end = std::chrono::system_clock::now();

    std::chrono::duration<double> time = end - start;

    // for (int i = 0; i < c.get_shape()[0]; ++i) {
    //     for (int j = 0; j < c.get_shape()[1]; ++j) {
    //         std::cout << c[i][j] << std::endl;
    //     }
    // }

    // for (size_t i = 0; i < c.get_shape_size(); ++i) {
    //     std::cout << c.get_shape()[i] << " ";
    // }
    std::cout << "\n";

    std::cout << c.get_size() << " time: " << time.count() << "s" << std::endl;

    return 0;
}
