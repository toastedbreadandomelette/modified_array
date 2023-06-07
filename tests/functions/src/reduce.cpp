#include <cassert>
#include <iostream>
#include <vector>

#include "../../../include/md_static/functions.hpp"
#include "../../../include/md_static/md_static_array/md_static_array.hpp"
#include "../../tests.hpp"

int main() {
    Array<u32> range_test(
        std::vector<u32>({10, 23, 45, 33, 12321, 21545, 333, 2134, 2, 9999}));

    u32 min = Utils::reduce<u32>(
        range_test, [](u32 min, u32 next) { return std::min(min, next); },
        U32::max);

    assert(min == 2);

    u32 max = Utils::reduce<u32>(
        range_test,
        [](u32 max, u32 next_val) { return max > next_val ? max : next_val; },
        U32::min);

    assert(max == 21545);

    u32 sum = Utils::reduce<u32>(
        range_test, [](u32 max, u32 next_val) { return max + next_val; });

    assert(sum == 10 + 23 + 45 + 33 + 12321 + 21545 + 333 + 2134 + 2 + 9999);

    u32 xored_value = Utils::reduce<u32>(
        range_test, [](u32 max, u32 next_val) { return max ^ next_val; }, 123);

    assert(sum == 10 ^ 23 ^ 45 ^ 33 ^ 12321 ^ 21545 ^ 333 ^ 2134 ^ 2 ^ 9999 ^
           123 /*init value=123*/);

    Array<c64> angles = Utils::range<f64>(0, Math::pi_2, Math::pi / 8.0);

    c64 red = Utils::reduce<c64>(
        Utils::map<c64>(angles,
                        [](f64 angle) { return c64::from_polar(1.0, angle); }),
        [](c64 curr, c64 nxt) { return curr + nxt; });

    assert(red.abs() < 1e-8);

    Array<f64> mat({4, 8}, 0);
    mat[0] = Array<f64>({1.5, 2.4, 3.3, 4.6, 6, 234, 28, 11});
    mat[1] = Array<f64>({1.2, 4.3, 1.3, 4.56, 696, 3.24, 1, 24});
    mat[2] = Array<f64>({5.8, 2, 3.8, 2.6, 21, 0.5, 34, 2.1});
    mat[3] = Array<f64>({1.5, 1.4, 99.3, 4.5622, 66, 2, 3.3, 2});

    // Along the columns of the matrix (or the second axis)
    Array<f64> red_res = Utils::reduce<f64>(
        mat, [](f64 prev, f64 curr) { return prev + curr; }, 0, 1);

    assert(Utils::compare(
        red_res, Array<f64>({1.5 + 2.4 + 3.3 + 4.6 + 6 + 234 + 28 + 11,
                             1.2 + 4.3 + 1.3 + 4.56 + 696 + 3.24 + 1 + 24,
                             5.8 + 2 + 3.8 + 2.6 + 21 + 0.5 + 34 + 2.1,
                             1.5 + 1.4 + 99.3 + 4.5622 + 66 + 2 + 3.3 + 2})));

    // Along the rows of the matrix (or along the first axis)
    Array<f64> red_res1 = Utils::reduce<f64>(
        mat, [](f64 prev, f64 curr) { return prev + curr; }, 0, 0);

    assert(red_res1.get_size() == 8);

    assert(Utils::compare(
        red_res1, Array<f64>({1.5 + 1.2 + 5.8 + 1.5, 2.4 + 4.3 + 2 + 1.4,
                              3.3 + 1.3 + 3.8 + 99.3, 4.6 + 4.56 + 2.6 + 4.5622,
                              6 + 696 + 21 + 66, 234 + 3.24 + 0.5 + 2,
                              28 + 1 + 34 + 3.3, 11 + 24 + 2.1 + 2})));

    return 0;
}