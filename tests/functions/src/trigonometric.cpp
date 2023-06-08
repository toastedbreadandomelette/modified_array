#include <cassert>
#include <iostream>
#include <vector>

#include "../../../include/md_static/functions.hpp"
#include "../../../include/md_static/md_static_array/md_static_array.hpp"
#include "../../../include/utility/math.hpp"
#include "../../tests.hpp"

int main() {
    Array<f64> sin_val =
        Utils::sin(Utils::range<f64>(0, Math::pi_by_2 * 5.0, Math::pi_by_2));

    Array<f64> expected(std::vector<f64>({0, 1, 0, -1, 0}));

    assert(Utils::compare(sin_val, expected));

    Array<f64> sin_val2 =
        Utils::sin(Utils::range<f64>(0, Math::pi * 4.0, Math::pi / 4.0));

    Array<f64> expected2(std::vector<f64>({
        0.0,
        sin(Math::pi / 4.0),
        sin(Math::pi / 2.0),
        sin(3.0 * Math::pi / 4.0),
        sin(Math::pi),
        sin(5.0 * Math::pi / 4.0),
        sin(3.0 * Math::pi / 2.0),
        sin(7.0 * Math::pi / 4.0),
        sin(2.0 * Math::pi),
        sin(9.0 * Math::pi / 4.0),
        sin(5.0 * Math::pi / 2.0),
        sin(11.0 * Math::pi / 4.0),
        sin(3.0 * Math::pi),
        sin(13.0 * Math::pi / 4.0),
        sin(7.0 * Math::pi / 2.0),
        sin(15.0 * Math::pi / 4.0),
    }));

    assert(Utils::compare(sin_val2, expected2));

    Array<f64> cos_val =
        Utils::cos(Utils::range<f64>(0, Math::pi * 5.0, Math::pi / 4.0));

    Array<f64> cos_expected(std::vector<f64>({
        1.0,
        cos(Math::pi / 4.0),
        cos(Math::pi / 2.0),
        cos(3.0 * Math::pi / 4.0),
        cos(Math::pi),
        cos(5.0 * Math::pi / 4.0),
        cos(3.0 * Math::pi / 2.0),
        cos(7.0 * Math::pi / 4.0),
        cos(2.0 * Math::pi),
        cos(9.0 * Math::pi / 4.0),
        cos(5.0 * Math::pi / 2.0),
        cos(11.0 * Math::pi / 4.0),
        cos(3.0 * Math::pi),
        cos(13.0 * Math::pi / 4.0),
        cos(7.0 * Math::pi / 2.0),
        cos(15.0 * Math::pi / 4.0),
        cos(4.0 * Math::pi),
        cos(17.0 * Math::pi / 4.0),
        cos(9.0 * Math::pi / 2.0),
        cos(19.0 * Math::pi / 4.0),
    }));

    Array<f64> tan_val =
        Utils::tan(Utils::range<f64>(0, Math::pi * 3.0, Math::pi_by_2 / 2.0));

    Array<f64> tan_expected(std::vector<f64>(
        {0, tan(Math::pi / 4.0), tan(Math::pi / 2.0), tan(3.0 * Math::pi / 4.0),
         tan(Math::pi), tan(5.0 * Math::pi / 4.0), tan(3.0 * Math::pi / 2.0),
         tan(7.0 * Math::pi / 4.0), tan(2.0 * Math::pi),
         tan(9.0 * Math::pi / 4.0), tan(5.0 * Math::pi / 2.0),
         tan(11.0 * Math::pi / 4.0)}));

    assert(Utils::compare(tan_val, tan_expected));
    return 0;
}
