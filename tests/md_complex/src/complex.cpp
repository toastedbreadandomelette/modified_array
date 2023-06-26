#include <iostream>

#include "../../../include/md_static/md_static_array/md_static_array.hpp"
#include "../../tests.hpp"

int main() {
    ci8 a = 2 + 3_i;
    ci8 b = 4 + 6_i;
    assert_eq(a + b, 6 + 9_i);
    assert_eq(a - b, -2 - 3_i);
    assert_eq(a * b, -10 + 24_i);

    c32 c = 3.0 - 12.5_i;
    c32 d = 2.0 - 13.5_i;

    c32 res = c + d;

    assert_eq(c + d, 5.0 - 26.0_i);
    assert_eq(c - d, 1 + 1.0_i);
    assert_eq(c * d, (6.0 - 12.5 * 13.5) - 65.5_i);
    return 0;
}