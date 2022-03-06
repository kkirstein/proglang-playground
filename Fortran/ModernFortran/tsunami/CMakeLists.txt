# build benchmark executable
#set(sources "benchmark.f90" "fibonacci.f90" "perfect_number.f90" "image.f90" "mandelbrot.f90")

#add_executable(tsunami_1 "tsunami.f90")
add_executable(tsunami_2 "tsunami_2.f90")
add_executable(tsunami_3 "tsunami_3.f90" "mod_diff.f90")
add_executable(tsunami_7 "tsunami_7.f90" "mod_diff.f90" "mod_parallel.f90")

#target_include_directories(Benchmark PUBLIC "${CMAKE_CURRENT_BINARY_DIR}/stb_image")
target_compile_options(tsunami_2 PRIVATE -O3)
target_compile_options(tsunami_3 PRIVATE -O3)
target_compile_options(tsunami_7 PRIVATE -O3)
#target_link_libraries(Benchmark stbi)
#target_link_options(Benchmark PRIVATE -fopenmp)

