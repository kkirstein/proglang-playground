# build benchmark executable
set(sources "main.c" "fib.c" "perfect_number.c" "primes.c"
    "dynarr.c" "image.c" "mandelbrot.c")

configure_file(benchmark_config.h.in benchmark_config.h)

add_executable(Benchmark "${sources}")

if (MINGW)
	target_compile_options(Benchmark PRIVATE -fopenmp)
	target_include_directories(Benchmark PUBLIC ${GMP_INCLUDE_DIRS} ${CMAKE_CURRENT_BINARY_DIR})
	target_link_libraries(Benchmark ${GMP_LIBRARIES} m)
	target_link_options(Benchmark PRIVATE -fopenmp)
elseif (MSVC)
	set(PKG_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/vcpkg/installed/x64-windows/include")
	set(PKG_LIB_DIR "${PROJECT_SOURCE_DIR}/vcpkg/installed/x64-windows/lib")

	target_compile_options(Benchmark PRIVATE /openmp:llvm /std:c11)
	target_include_directories(Benchmark PUBLIC ${PKG_INCLUDE_DIR} ${CMAKE_CURRENT_BINARY_DIR})
	target_link_directories(Benchmark PRIVATE ${PKG_LIB_DIR})
	target_link_libraries(Benchmark gmp)
else ()
	target_compile_options(Benchmark PRIVATE -fopenmp)
	target_include_directories(Benchmark PUBLIC ${GMP_INCLUDE_DIRS} ${CMAKE_CURRENT_BINARY_DIR})
	target_link_libraries(Benchmark ${GMP_LIBRARIES} m)
	target_link_options(Benchmark PRIVATE -fopenmp)
endif ()

