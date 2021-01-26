# build benchmark executable
set(sources "main.c" "fib.c" "perfect_number.c" "primes.c"
    "dynarr.c" "image.c" "mandelbrot.c")

configure_file(benchmark_config.h.in benchmark_config.h)

add_executable(Benchmark "${sources}")

target_include_directories(Benchmark PUBLIC ${GMP_INCLUDE_DIRS} ${CMAKE_CURRENT_BINARY_DIR})
target_compile_options(Benchmark PRIVATE -fopenmp)
target_link_libraries(Benchmark ${GMP_LIBRARIES} m)
target_link_options(Benchmark PRIVATE -fopenmp)


