cmake_minimum_required(VERSION 3.16)

# setup project
project(Benchmark VERSION 0.1 LANGUAGES C)

set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "Build_Type")

# find dependencies
find_package(PkgConfig REQUIRED)

pkg_check_modules(GMP REQUIRED gmp)

add_subdirectory("./src")

