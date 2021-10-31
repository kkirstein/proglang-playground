# build benchmark executable
set(sources "stbi.f90")
set(c_sources "stb_image_impl.c")

#configure_file(benchmark_config.h.in benchmark_config.h)

add_library(stbi "${sources}" "${c_sources}")

#target_include_directories(Benchmark PUBLIC "${CMAKE_CURRENT_BINARY_DIR}")
target_compile_options(stbi PRIVATE -O3)
