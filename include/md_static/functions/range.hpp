#include "md_static_array_utility.hpp"

// To do: improve and update since it does not work for all cases
template <typename _T,
          class = typename std::enable_if<std::is_arithmetic<_T>::value>::type>
MdStaticArray<_T> MdArrayUtility::range(const _T start, const _T end,
                                        const _T spacing) {
    if (end == -1) {
        MdStaticArray<_T> result(static_cast<size_t>(start));
        for (size_t index = 0; index < start; ++index) {
            result.__array[index] = index;
        }
        return result;
    } else if (spacing == 1) {
        const auto value = end - start;
        const size_t size = static_cast<size_t>(
            ceil(std::max(value, static_cast<decltype(value)>(0))));
        MdStaticArray<_T> result(size);
        for (size_t index = 0, val = start; index < size; ++index, val += 1) {
            result.__array[index] = val;
        }
        return result;
    } else {
        const auto value = (end - start) / spacing;
        size_t size = static_cast<size_t>(
            ceil(std::max(value, static_cast<decltype(value)>(0))));
        MdStaticArray<_T> result(size);
        _T val = start;
        for (size_t index = 0; index < size; ++index, val += spacing) {
            result.__array[index] = val;
        }
        return result;
    }
}
