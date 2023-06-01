#include <iostream>

#include "../../../include/md_static/md_static_array/md_static_array.hpp"
#include "../../tests.hpp"

int main() {
    MdStaticArray<int> s;
    {
        s = MdStaticArray<int>(10);
        TEST(s.get_size() == 10);
        TEST(s.get_shape_size() == 1);

        try {
            auto c = s[11];
        } catch (std::runtime_error e) {
            TEST(std::string(e.what()).find("Index out of bounds") == 0);
        }
    }

    {
        s = MdStaticArray<int>(20, 123);
        TEST(s.get_size() == 20);
        TEST(s.get_shape_size() == 1);
        for (int i = 0; i < s.get_size(); ++i) {
            TEST(s[i] == 123);
        }
    }
    // Testing
    {
        s = MdStaticArray<int>({20, 30, 40}, 123);
        TEST(s.get_size() == 20 * 30 * 40);
        TEST(s.get_shape_size() == 3);
        TEST(s.get_shape()[0] == 20);
        TEST(s.get_shape()[1] == 30);
        TEST(s.get_shape()[2] == 40);

        size_t index = 0;
        for (int i = 0; i < s.get_shape()[0]; ++i) {
            for (int j = 0; j < s.get_shape()[1]; ++j) {
                for (int k = 0; k < s.get_shape()[2]; ++k) {
                    TEST(s[i][j][k] == 123);
                    ++index;
                }
            }
        }
        TEST(index == s.get_size());
    }

    return 0;
}
