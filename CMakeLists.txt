cmake_minimum_required(VERSION 3.13)

project(nd_array)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_FLAGS "-O2 -march=native -mavx")

file(GLOB SOURCES "main.cpp")

add_executable(nd_array ${SOURCES})
