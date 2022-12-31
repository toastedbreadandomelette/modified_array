#include <chrono>
#include <cmath>
#include <iostream>

#include "include/data_table.hpp"
#include "include/md_static/md_static_array.hpp"
#include "include/md_static/md_static_utility.hpp"

int main(int argc, const char **argv) {
    size_t dm_size = 1024;
    MdStaticArray<size_t> f(std::vector<size_t>({dm_size, dm_size, dm_size}),
                            1);
    MdStaticArray<size_t> g(std::vector<size_t>({dm_size}), 1);

    for (int i = 0; i < f.get_shape()[0]; ++i) {
        for (int j = 0; j < f.get_shape()[1]; ++j) {
            for (int k = 0; k < f.get_shape()[2]; ++k) {
                f[i][j][k] = i + j + k;
            }
            // std::cout << f[i][j] << std::endl;
        }
        // std::cout << std::endl;
    }
    for (int i = 0; i < g.get_shape()[0]; ++i) {
        //     for (int j = 0; j < g.get_shape()[1]; ++j) {
        g[i] = i;
        //     }
    }

    auto start = std::chrono::system_clock::now();
    auto c = MdUtility::dot<size_t, size_t, size_t>(g, f, 1);
    // auto c = f + g;
    auto end = std::chrono::system_clock::now();

    std::chrono::duration<double> time = end - start;

    // for (int i = 0; i < c.get_shape()[0]; ++i) {
    //     // for (int j = 0; j < c.get_shape()[1]; ++j) {
    //     std::cout << c[i] << std::endl;
    //     // }
    // }

    // for (size_t i = 0; i < c.get_shape_size(); ++i) {
    //     std::cout << c.get_shape()[i] << " ";
    // }
    std::cout << "\n";

    std::cout << c.get_size() << " time: " << time.count() << "s" << std::endl;

    return 0;
}
