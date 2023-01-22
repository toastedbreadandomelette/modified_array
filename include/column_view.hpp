#pragma once
#ifndef _COLUMN_VIEW_HPP_
#define _COLUMN_VIEW_HPP_

#include <string>

#include "./cell.hpp"
#include "./md_static/md_static_array.hpp"
#include "./tables.hpp"

struct Table;

struct ColView {
 public:
    // Pointer of the header name
    const char *name;
    // Index of the string (easy to identify from the table)
    uint16_t col_index;
    // Reference of the table ()
    Table *table;

    static const int total_threads = 8;

    /**
     * @brief returns the size of array
     */
    inline size_t get_size() const { return table->get_size(); }

    /**
     * @brief return index of the value
     */
    inline Cell &operator[](const size_t index) {
        return table->table[index][col_index];
    }

    /**
     * @brief Handle delete for ColView
     */
    ~ColView() {
        name = nullptr;
        table = nullptr;
    }

    /**
     * @brief Aggregates the values by combining previous values defined by the
     * function
     * @param function that aggregates previous value and current value
     * @param init initalizing value before combining
     * @returns Result
     */
    Cell aggregate(const std::function<Cell(const Cell &, const Cell &)> &func,
                   const Cell &init);

    /**
     * @brief Aggregates (with multi-threading) the values by combining previous
     * defined by the function.
     * @param function that aggregates previous value and current value
     * @param init initalizing value before combining
     * @returns Result
     */
    Cell aggregate_mt(
        const std::function<Cell(const Cell &, const Cell &)> &func,
        const Cell &init);

    /**
     * @brief Maps the values and returns the new array.
     */
    template <typename _T>
    MdStaticArray<_T> st_map(const std::function<_T(const Cell &, const size_t,
                                                    const ColView &)> &func);

    /**
     * @brief Maps the values and returns the new array.
     * Uses multi-threading
     */
    template <typename _T>
    MdStaticArray<_T> st_map_mt(
        const std::function<_T(const Cell &, const size_t, const ColView &)>
            &func);

    /**
     * @brief get values of a cell
     */
    template <typename _T>
    friend _T get_values(const Cell &);

    /**
     * @brief Maps the values and returns the new array.
     */
    template <typename _T>
    MdStaticArray<_T> st_map();

    /**
     * @brief Maps the values and returns the new array.
     */
    template <typename _T>
    MdStaticArray<_T> st_map_mt();
};

template <typename _T,
          class = typename std::enable_if<std::is_arithmetic<_T>::value>::type>
_T get_values(const Cell &__value) {
    switch (__value.index()) {
        case 0:
            return std::get<int64_t>(__value);
        case 1:
            return std::get<uint64_t>(__value);
        case 2:
            return std::get<double>(__value);
        default:
            return 0;
    }
}

template <typename _T, class = typename std::enable_if<
                           std::is_same<_T, std::string>::value>::type>
std::string get_values(const Cell &__value) {
    switch (__value.index()) {
        case 3:
            return std::get<std::string>(__value);
        default:
            return 0;
    }
}

Cell ColView::aggregate(
    const std::function<Cell(const Cell &, const Cell &)> &func,
    const Cell &init) {
    Cell start = init;
    for (auto &Table : table->table) {
        start = func(start, Table[col_index]);
    }

    return start;
}

Cell ColView::aggregate_mt(
    const std::function<Cell(const Cell &, const Cell &)> &func,
    const Cell &init) {
    std::vector<Cell> init_array(ColView::total_threads, init);
    std::vector<std::thread> thread_pool;

    auto aggregate_internal = [func, &init, &init_array, this](
                                  const size_t start,
                                  const uint8_t thread_count) {
        for (size_t i = start; i < this->get_size(); i += thread_count) {
            init_array[start] = func(init_array[start], this->operator[](i));
        }
    };

    for (int i = 0; i < ColView::total_threads; ++i) {
        thread_pool.emplace_back(
            std::thread(aggregate_internal, i, ColView::total_threads));
    }

    for (auto &thrd : thread_pool) {
        thrd.join();
    }

    Cell final = init;
    for (int i = 0; i < ColView::total_threads; ++i) {
        final = func(final, init_array[i]);
    }

    return final;
}

template <typename _T>
MdStaticArray<_T> ColView::st_map(
    const std::function<_T(const Cell &, const size_t, const ColView &)>
        &func) {
    const size_t __size = this->get_size();
    MdStaticArray<_T> value(__size);
    const ColView &__ptr = *this;
    for (size_t ptr = 0; ptr < __size; ++ptr) {
        value[ptr] = func(this->operator[](ptr), ptr, __ptr);
    }

    return value;
}

template <typename _T>
MdStaticArray<_T> ColView::st_map_mt(
    const std::function<_T(const Cell &, const size_t, const ColView &)>
        &func) {
    const size_t __size = this->get_size();
    MdStaticArray<_T> value(__size);
    std::vector<std::thread> thread_pool;

    auto mp_internal = [&func, this, &value](const size_t start,
                                             const size_t end) {
        const ColView &__ptr = *this;
        for (size_t ptr = start; ptr < end; ++ptr) {
            value[ptr] = func(this->operator[](ptr), ptr, __ptr);
        }
    };

    const size_t block = __size / ColView::total_threads;
    const uint8_t t_but_one = ColView::total_threads - 1;

    for (int i = 0; i < t_but_one; ++i) {
        thread_pool.emplace_back(
            std::thread(mp_internal, block * i, block * (i + 1)));
    }

    thread_pool.emplace_back(
        std::thread(mp_internal, block * t_but_one, __size));

    for (auto &thrd : thread_pool) {
        thrd.join();
    }

    return value;
}

template <typename _T>
MdStaticArray<_T> ColView::st_map() {
    const size_t __size = this->get_size();
    MdStaticArray<_T> value(__size);
    const ColView &__ptr = *this;
    for (size_t ptr = 0; ptr < __size; ++ptr) {
        value[ptr] = get_values<_T>(this->operator[](ptr));
    }

    return value;
}

template <typename _T>
MdStaticArray<_T> ColView::st_map_mt() {
    const size_t __size = this->get_size();
    MdStaticArray<_T> value(__size);
    std::vector<std::thread> thread_pool;

    auto mp_internal = [this, &value](const size_t start, const size_t end) {
        const ColView &__ptr = *this;
        for (size_t ptr = start; ptr < end; ++ptr) {
            value[ptr] = get_values<_T>(this->operator[](ptr));
        }
    };

    const size_t block = __size / ColView::total_threads;
    const uint8_t t_but_one = ColView::total_threads - 1;

    for (int i = 0; i < t_but_one; ++i) {
        thread_pool.emplace_back(
            std::thread(mp_internal, block * i, block * (i + 1)));
    }

    thread_pool.emplace_back(
        std::thread(mp_internal, block * t_but_one, __size));

    for (auto &thrd : thread_pool) {
        thrd.join();
    }

    return value;
}

#endif
