# build tsunami executables
set(CMAKE_Fortran_COMPILER /usr/local/bin/caf)
set(CMAKE_Fortran_LINKER_EXECUTABLE /usr/local/bin/caf)

add_executable(tsunami_2 "tsunami_2.f90")
#add_executable(tsunami_3 "tsunami_3.f90" "mod_diff.f90")
add_executable(tsunami "tsunami_7.f90" "mod_diff.f90" "mod_parallel.f90")

#target_include_directories(Benchmark PUBLIC "${CMAKE_CURRENT_BINARY_DIR}/stb_image")
target_compile_options(tsunami_2 PRIVATE -O3)
target_compile_options(tsunami PRIVATE -O3)
#target_link_libraries(Benchmark stbi)
#target_link_options(Benchmark PRIVATE -fopenmp)

