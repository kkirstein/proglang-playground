# compiler flags
if(CMAKE_Fortran_COMPILER_ID MATCHES GNU)
    #set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fopenmp -cpp")
    set(CMAKE_Fortran_FLAGS "-fopenmp -cpp")
    set(CMAKE_Fortran_FLAGS_DEBUG "-O0 -g")
    set(CMAKE_Fortran_FLAGS_RELEASE "-O3 -march=native")
endif()

# build benchmark executable
set(sources "benchmark.f90" "fibonacci.f90" "perfect_number.f90" "image.f90" "mandelbrot.f90")
add_executable(Benchmark "${sources}")


target_include_directories(Benchmark PUBLIC "${CMAKE_CURRENT_BINARY_DIR}/stb_image")
target_link_libraries(Benchmark stbi)

add_subdirectory(stb_image)
