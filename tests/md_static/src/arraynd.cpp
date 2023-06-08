#include <iostream>

#include "../../../include/md_static/md_static_array/md_static_array.hpp"
#include "../../tests.hpp"

int main() {
    Array<f64> s;
    {
        s = Array<f64>({20, 30}, 10);
        assert(s.get_size() == 600);
        assert(s.get_shape_size() == 2);

        try {
            auto c = s[21];
        } catch (std::runtime_error e) {
            assert(std::string(e.what()).find("Index out of bounds") == 0);
        }
    }

    {
        // Create a 12-dimensional array
        std::vector<usize> v(12, 2);
        s = Array<f64>(v, 123);
        assert(s.get_size() == 4096);
        assert(s.get_shape_size() == 12);
        for (usize index = 0; index < s.get_shape_size(); ++index) {
            assert(s.get_shape()[index] == 2);
        }
    }
    // Testing
    {
        s = Array<f64>({20, 30, 40, 50}, 123);
        assert(s.get_size() == 20 * 30 * 40 * 50);
        assert(s.get_shape_size() == 4);
        assert(s.get_shape()[0] == 20);
        assert(s.get_shape()[1] == 30);
        assert(s.get_shape()[2] == 40);
        assert(s.get_shape()[3] == 50);

        usize index = 0;
        for (i32 i = 0; i < s.get_shape()[0]; ++i) {
            for (i32 j = 0; j < s.get_shape()[1]; ++j) {
                for (i32 k = 0; k < s.get_shape()[2]; ++k) {
                    for (i32 l = 0; l < s.get_shape()[3]; ++l) {
                        assert(s[i][j][k][l] == 123);
                        ++index;
                    }
                }
            }
        }
        assert(index == s.get_size());
    }

    return 0;
}
