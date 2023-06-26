#include <iomanip>
#include <iostream>

#include "../../../include/md_static/md_static_array/md_static_array.hpp"
#include "../../tests.hpp"

int main() {
    Array<i32> a(10, 5), b(10, 12);
    {
        auto c = a + b;
        assert(c.get_size() == 10);
        assert(c.get_shape_size() == 1);
        for (usize index = 0; index < c.get_shape()[0]; ++index) {
            assert_eq(c[index], 17);
        }
    }
    // Array generated should be auto typed to double
    {
        auto d = a + 4.23;
        assert(d.get_size() == 10);
        assert(d.get_shape_size() == 1);
        for (usize index = 0; index < d.get_shape()[0]; ++index) {
            assert_eq(d[index], 9.23);
        }
    }
    {
        auto d = a + (10 - 4.23);
        assert(d.get_size() == 10);
        assert(d.get_shape_size() == 1);
        for (usize index = 0; index < d.get_shape()[0]; ++index) {
            assert_eq(d[index], 10.77);
        }
    }

    {
        auto d = a + c64(10 - 4.5_i);
        assert(d.get_size() == 10);
        assert(d.get_shape_size() == 1);
        for (usize index = 0; index < d.get_shape()[0]; ++index) {
            assert_eq(d[index], (15 - 4.5_i));
        }
    }
    {
        auto d = Array<i8>({30, 30}, 23) / (8 + 16_i) + 13;
        assert_eq(d.get_size(), 900);
        assert_eq(d.get_shape_size(), 2);
        assert_eq(d.get_shape()[0], 30);
        assert_eq(d.get_shape()[1], 30);

        const auto ans = ((23 / (8 + 16_i)) + 13);
        for (usize i = 0; i < d.get_shape()[0]; ++i) {
            for (usize j = 0; j < d.get_shape()[1]; ++j) {
                assert_eq(d[i][j], ans);
            }
        }
    }

    {
        auto d = Array<i8>({30, 30}, 23) & Array<i8>({30, 30}, 123);
        assert_eq(d.get_size(), 900);
        assert_eq(d.get_shape_size(), 2);
        assert_eq(d.get_shape()[0], 30);
        assert_eq(d.get_shape()[1], 30);

        const auto ans = (23 & 123);
        for (usize i = 0; i < d.get_shape()[0]; ++i) {
            for (usize j = 0; j < d.get_shape()[1]; ++j) {
                assert_eq(d[i][j], ans);
            }
        }
    }

    {
        auto d = Array<f32>({30, 90}, 23) == Array<i8>({30, 90}, 123);
        assert_eq(d.get_size(), 2700);
        assert_eq(d.get_shape_size(), 2);
        assert_eq(d.get_shape()[0], 30);
        assert_eq(d.get_shape()[1], 90);

        for (usize i = 0; i < d.get_shape()[0]; ++i) {
            for (usize j = 0; j < d.get_shape()[1]; ++j) {
                assert_eq(d[i][j], false);
            }
        }
    }

    {
        auto d = Array<c128>({30, 90}, 213) != Array<i8>({30, 90}, 231);
        assert_eq(d.get_size(), 2700);
        assert_eq(d.get_shape_size(), 2);
        assert_eq(d.get_shape()[0], 30);
        assert_eq(d.get_shape()[1], 90);

        for (usize i = 0; i < d.get_shape()[0]; ++i) {
            for (usize j = 0; j < d.get_shape()[1]; ++j) {
                assert_eq(d[i][j], true);
            }
        }
    }

    {
        auto d = Array<usize>({300, 90}, 213) << 12;
        assert_eq(d.get_size(), 27000);
        assert_eq(d.get_shape_size(), 2);
        assert_eq(d.get_shape()[0], 300);
        assert_eq(d.get_shape()[1], 90);

        const auto ans = (213 << 12);
        for (usize i = 0; i < d.get_shape()[0]; ++i) {
            for (usize j = 0; j < d.get_shape()[1]; ++j) {
                assert_eq(d[i][j], 213 << 12);
            }
        }
    }

    {
        auto d = Array<usize>({312, 123, 11, 2123, 321324})
                 << Array<i8>({3, 4, 5, 6, 7});
        assert_eq(d.get_size(), 5);
        assert_eq(d.get_shape_size(), 1);
        assert_eq(d.get_shape()[0], 5);

        assert_eq(d[0], 312 << 3);
        assert_eq(d[1], 123 << 4);
        assert_eq(d[2], 11 << 5);
        assert_eq(d[3], 2123 << 6);
        assert_eq(d[4], 321324ULL << 7);
    }

    {
        auto d = Array<usize>({312, 123, 11, 2123, 321324}) >>
                 Array<i8>({3, 4, 5, 6, 7});
        assert_eq(d.get_size(), 5);
        assert_eq(d.get_shape_size(), 1);
        assert_eq(d.get_shape()[0], 5);

        assert_eq(d[0], 39);
        assert_eq(d[1], (123 >> 4));
        assert_eq(d[2], 0);
        assert_eq(d[3], 33);
        assert_eq(d[4], 2510);
    }

    {
        auto d = Array<usize>({312, 123, 11, 2123, 321324}) ^
                 Array<i32>({3312, 44, 554, 9887, 435});
        assert_eq(d.get_size(), 5);
        assert_eq(d.get_shape_size(), 1);
        assert_eq(d.get_shape()[0], 5);

        assert_eq(d[0], 312 ^ 3312);
        assert_eq(d[1], 123 ^ 44);
        assert_eq(d[2], 11 ^ 554);
        assert_eq(d[3], 2123 ^ 9887);
        assert_eq(d[4], 321324 ^ 435);
    }

    {
        auto d = 9876543 ^ Array<usize>({312, 123, 11, 2123, 321324});
        assert_eq(d.get_size(), 5);
        assert_eq(d.get_shape_size(), 1);
        assert_eq(d.get_shape()[0], 5);

        assert_eq(d[0], 312 ^ 9876543);
        assert_eq(d[1], 123 ^ 9876543);
        assert_eq(d[2], 11 ^ 9876543);
        assert_eq(d[3], 2123 ^ 9876543);
        assert_eq(d[4], 321324 ^ 9876543);
    }

    {
        auto d = 9876543 & Array<usize>({312, 123, 11, 2123, 321324});
        assert_eq(d.get_size(), 5);
        assert_eq(d.get_shape_size(), 1);
        assert_eq(d.get_shape()[0], 5);

        assert_eq(d[0], 312 & 9876543);
        assert_eq(d[1], 123 & 9876543);
        assert_eq(d[2], 11 & 9876543);
        assert_eq(d[3], 2123 & 9876543);
        assert_eq(d[4], 321324 & 9876543);
    }

    return 0;
}
