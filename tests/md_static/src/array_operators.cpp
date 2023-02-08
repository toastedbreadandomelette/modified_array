#include <iostream>

#include "../../../include/md_static/md_static_array/md_static_array.hpp"
#include "../../tests.hpp"

int main() {
    MdStaticArray<int> a(10, 5), b(10, 12);
    {
        auto c = a + b;
        TEST(c.get_size() == 10);
        TEST(c.get_shape_size() == 1);
        for (size_t index = 0; index < c.get_shape()[0]; ++index) {
            TEST_EQ(c[index], 17);
        }
    }
    // Array generated should be auto typed to double
    {
        auto d = a + 4.23;
        TEST(d.get_size() == 10);
        TEST(d.get_shape_size() == 1);
        for (size_t index = 0; index < d.get_shape()[0]; ++index) {
            TEST_EQ(d[index], 9.23);
        }
    }
    {
        auto d = a + (10 - 4.23);
        TEST(d.get_size() == 10);
        TEST(d.get_shape_size() == 1);
        for (size_t index = 0; index < d.get_shape()[0]; ++index) {
            TEST_EQ(d[index], 10.77);
        }
        return 0;
    }

    {
        auto d = a + (10 - 4.23_i);
        TEST(d.get_size() == 10);
        TEST(d.get_shape_size() == 1);
        for (size_t index = 0; index < d.get_shape()[0]; ++index) {
            TEST_EQ(d[index], (15 - 4.23_i));
        }
        return 0;
    }
    {
        auto d = MdStaticArray<uint8_t>({30, 30}, 23) / (8 + 16_i) + 13;
        TEST_EQ(d.get_size(), 900);
        TEST_EQ(d.get_shape_size(), 2);
        TEST_EQ(d.get_shape()[0], 30);
        TEST_EQ(d.get_shape()[1], 30);

        const auto ans = ((23 / (8 + 16_i)) + 13);
        for (size_t i = 0; i < d.get_shape()[0]; ++i) {
            for (size_t j = 0; j < d.get_shape()[1]; ++j) {
                TEST_EQ(d[i][j], ans);
            }
        }
    }

    {
        auto d = MdStaticArray<uint8_t>({30, 30}, 23) &
                 MdStaticArray<uint8_t>({30, 30}, 123);
        TEST_EQ(d.get_size(), 900);
        TEST_EQ(d.get_shape_size(), 2);
        TEST_EQ(d.get_shape()[0], 30);
        TEST_EQ(d.get_shape()[1], 30);

        const auto ans = (23 & 123);
        for (size_t i = 0; i < d.get_shape()[0]; ++i) {
            for (size_t j = 0; j < d.get_shape()[1]; ++j) {
                TEST_EQ(d[i][j], ans);
            }
        }
    }

    {
        auto d = MdStaticArray<float>({30, 90}, 23) ==
                 MdStaticArray<uint8_t>({30, 90}, 123);
        TEST_EQ(d.get_size(), 2700);
        TEST_EQ(d.get_shape_size(), 2);
        TEST_EQ(d.get_shape()[0], 30);
        TEST_EQ(d.get_shape()[1], 90);

        for (size_t i = 0; i < d.get_shape()[0]; ++i) {
            for (size_t j = 0; j < d.get_shape()[1]; ++j) {
                TEST_EQ(d[i][j], false);
            }
        }
    }

    {
        auto d = MdStaticArray<clongdouble>({30, 90}, 213) !=
                 MdStaticArray<uint8_t>({30, 90}, 231);
        TEST_EQ(d.get_size(), 2700);
        TEST_EQ(d.get_shape_size(), 2);
        TEST_EQ(d.get_shape()[0], 30);
        TEST_EQ(d.get_shape()[1], 90);

        for (size_t i = 0; i < d.get_shape()[0]; ++i) {
            for (size_t j = 0; j < d.get_shape()[1]; ++j) {
                TEST_EQ(d[i][j], true);
            }
        }
    }

    {
        auto d = MdStaticArray<size_t>({300, 90}, 213) << 12;
        TEST_EQ(d.get_size(), 27000);
        TEST_EQ(d.get_shape_size(), 2);
        TEST_EQ(d.get_shape()[0], 300);
        TEST_EQ(d.get_shape()[1], 90);

        const auto ans = (213 << 12);
        for (size_t i = 0; i < d.get_shape()[0]; ++i) {
            for (size_t j = 0; j < d.get_shape()[1]; ++j) {
                TEST_EQ(d[i][j], true);
            }
        }
    }

    {
        auto d = MdStaticArray<size_t>({312, 123, 11, 2123, 321324})
                 << MdStaticArray<int8_t>({3, 4, 5, 6, 7});
        TEST_EQ(d.get_size(), 5);
        TEST_EQ(d.get_shape_size(), 1);
        TEST_EQ(d.get_shape()[0], 5);

        TEST_EQ(d[0], 2496);
        TEST_EQ(d[1], 1968);
        TEST_EQ(d[2], 352);
        TEST_EQ(d[3], 135872);
        TEST_EQ(d[4], 41129472);
    }

    {
        auto d = MdStaticArray<size_t>({312, 123, 11, 2123, 321324}) >>
                 MdStaticArray<int8_t>({3, 4, 5, 6, 7});
        TEST_EQ(d.get_size(), 5);
        TEST_EQ(d.get_shape_size(), 1);
        TEST_EQ(d.get_shape()[0], 5);

        TEST_EQ(d[0], 39);
        TEST_EQ(d[1], 5);
        TEST_EQ(d[2], 0);
        TEST_EQ(d[3], 33);
        TEST_EQ(d[4], 2510);
    }

    return 0;
}
