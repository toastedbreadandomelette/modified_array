add_executable(array1d src/array1d.cpp)
add_executable(arraynd src/arraynd.cpp)
add_executable(array_op src/array_operators.cpp)

add_test(array1d array1d)
add_test(arraynd arraynd)
add_test(array_op array_op)
