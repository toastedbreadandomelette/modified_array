cmake_minimum_required(VERSION 3.13)

project(nd_array)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_FLAGS "-O3 -march=native -mavx -msse4a -funroll-loops -mfpmath=sse -pthread -fopenmp")

file(GLOB SOURCES "main.cpp")

add_executable(nd_array ${SOURCES})
