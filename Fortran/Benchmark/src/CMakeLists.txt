# build benchmark executable
set(sources "benchmark.f90" "fibonacci.f90" "perfect_number.f90" "image.f90" "mandelbrot.f90")

#configure_file(benchmark_config.h.in benchmark_config.h)

add_executable(Benchmark "${sources}")

#target_include_directories(Benchmark PUBLIC "${CMAKE_CURRENT_BINARY_DIR}")
target_compile_options(Benchmark PRIVATE -fopenmp -cpp)
#target_link_libraries(Benchmark gmp m)
target_link_options(Benchmark PRIVATE -fopenmp)


