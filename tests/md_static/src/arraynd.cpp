#include <iostream>

#include "../../../include/md_static/md_static_array/md_static_array.hpp"
#include "../../tests.hpp"

#define TEST(condition)                                    \
    if (!(condition)) {                                    \
        std::cout << "Error for condition: " << #condition \
                  << " at line: " << __LINE__ << '\n';     \
        return 1;                                          \
    }

int main() {
    MdStaticArray<f64> s;
    {
        s = MdStaticArray<f64>({20, 30}, 10);
        TEST(s.get_size() == 600);
        TEST(s.get_shape_size() == 2);

        try {
            auto c = s[21];
        } catch (std::runtime_error e) {
            TEST(std::string(e.what()).find("Index out of bounds") == 0);
        }
    }

    {
        // Create a 12-dimensional array
        std::vector<usize> v(12, 2);
        s = MdStaticArray<f64>(v, 123);
        TEST(s.get_size() == 4096);
        TEST(s.get_shape_size() == 12);
        for (usize index = 0; index < s.get_shape_size(); ++index) {
            TEST(s.get_shape()[index] == 2);
        }
    }
    // Testing
    {
        s = MdStaticArray<f64>({20, 30, 40, 50}, 123);
        TEST(s.get_size() == 20 * 30 * 40 * 50);
        TEST(s.get_shape_size() == 4);
        TEST(s.get_shape()[0] == 20);
        TEST(s.get_shape()[1] == 30);
        TEST(s.get_shape()[2] == 40);
        TEST(s.get_shape()[3] == 50);

        usize index = 0;
        for (i32 i = 0; i < s.get_shape()[0]; ++i) {
            for (i32 j = 0; j < s.get_shape()[1]; ++j) {
                for (i32 k = 0; k < s.get_shape()[2]; ++k) {
                    for (i32 l = 0; l < s.get_shape()[3]; ++l) {
                        TEST(s[i][j][k][l] == 123);
                        ++index;
                    }
                }
            }
        }
        TEST(index == s.get_size());
    }

    return 0;
}
