cmake_minimum_required(VERSION 3.16)

# setup project
project(Benchmark VERSION 0.1 LANGUAGES Fortran)

set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "Build_Type")

add_subdirectory("./src")

