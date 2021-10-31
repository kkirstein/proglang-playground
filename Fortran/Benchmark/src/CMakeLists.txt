# build benchmark executable
set(sources "benchmark.f90" "fibonacci.f90" "perfect_number.f90" "image.f90" "mandelbrot.f90")
set(c_sources "stb_image/stb_image_impl.c")

#configure_file(benchmark_config.h.in benchmark_config.h)

add_executable(Benchmark "${sources}" "${c_sources}")

target_include_directories(Benchmark PUBLIC "stb_image")
target_compile_options(Benchmark PRIVATE -O3 -fopenmp -cpp)
target_link_libraries(Benchmark stbi)
target_link_options(Benchmark PRIVATE -fopenmp)

add_subdirectory(stb_image)
