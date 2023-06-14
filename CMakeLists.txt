cmake_minimum_required(VERSION 3.13)

project(nd_array)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_FLAGS "-O3 -mavx -mfma -fopenmp -ffast-math -march=native")

file(GLOB SOURCES "main.cpp")

enable_testing()
add_subdirectory(tests/md_static)
add_subdirectory(tests/functions)

add_executable(nd_array ${SOURCES})
