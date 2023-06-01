#pragma once
#ifndef _TABLE_COLVIEW_COMMON_HPP_
#define _TABLE_COLVIEW_COMMON_HPP_

#include "./column_view.hpp"
#include "./tables.hpp"

ColView Table::operator[](const std::string &val) {
    uint16_t index =
        std::find(header.begin(), header.end(), val) - header.begin();
    return {header[index].c_str(), index, this};
}

template <typename _T1, typename _T2>
std::pair<MdStaticArray<_T1>, MdStaticArray<_T2>>
Table::split_dep_and_indep_variables(
    const std::string &classifier_header_name) {
    const size_t index =
        std::find(header.begin(), header.end(), classifier_header_name) -
        header.begin();

    if (index >= header.size()) {
        return {MdStaticArray<_T1>(), MdStaticArray<_T2>()};
    }

    std::vector<uint16_t> other_indices;
    for (int i = 0; i < col_size; ++i) {
        if (index != i) {
            other_indices.push_back(i);
        }
    }

    MdStaticArray<_T1> values(
        std::vector<size_t>({table.size(), other_indices.size()}), 0);
    MdStaticArray<_T2> classifier_array(table.size());

    size_t t_index = 0;
    for (int i = 0; i < table.size(); ++i) {
        for (auto &cindex : other_indices) {
            values[t_index++] = get_values<_T1>(table[i][cindex]);
        }
        classifier_array[i] = get_values<_T2>(table[i][index]);
    }

    return {values, classifier_array};
}

#endif