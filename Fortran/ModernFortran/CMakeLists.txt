cmake_minimum_required(VERSION 3.16)

# setup project
project(ModernFortran VERSION 0.1 LANGUAGES Fortran C)
set(CMAKE_Fortran_COMPILER /usr/bin/gfortran-10)

set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "Build_Type")

add_subdirectory("./tsunami")

