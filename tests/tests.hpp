#pragma once
#ifndef _TEST_HPP_MAIN_
#define _TEST_HPP_MAIN_

#define assert(expr)                                   \
    if (!(expr)) {                                     \
        std::cout << "Expression failed: " << #expr    \
                  << " at line: " << __LINE__ << '\n'; \
        return 1;                                      \
    }

#define assert_eq(expr, val_test)                                           \
    {                                                                       \
        auto val = expr;                                                    \
        auto eq = (val_test);                                               \
        if (!((val) == (eq))) {                                             \
            std::cout << "Equality failed: " << #expr                       \
                      << " at line: " << __LINE__ << "\nExpected: " << (eq) \
                      << ", Found: " << val << '\n';                        \
            return 1;                                                       \
        }                                                                   \
    }

#endif