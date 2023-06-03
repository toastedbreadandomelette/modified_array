cmake_minimum_required(VERSION 3.13)

project(nd_array)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_FLAGS "-O3 -march=native -mavx -mavx2 -msse -msse2 -msse4a -pthread -fopenmp")

file(GLOB SOURCES "main.cpp")

enable_testing()
add_subdirectory(tests/md_static)

add_executable(nd_array ${SOURCES})
