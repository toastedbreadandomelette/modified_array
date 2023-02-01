#pragma once
#ifndef _TEST_HPP_MAIN_
#define _TEST_HPP_MAIN_

#define TEST(condition)                                    \
    if (!(condition)) {                                    \
        std::cout << "Error for condition: " << #condition \
                  << " at line: " << __LINE__ << '\n';     \
        return 1;                                          \
    }

#define TEST_EQ(value, test)                                            \
    if ((value) != (test)) {                                                \
        std::cout << "Equal error: " << #value << " (" << value << ") " \
                  << " != " << #test << " (" << test << ")\n";          \
        std::cout << " at line: " << __LINE__ << '\n';                  \
        return 1;                                                       \
    }

#endif