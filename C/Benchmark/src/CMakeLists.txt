# build benchmark executable
set(sources "main.c" "fib.c" "perfect_number.c" "primes.c" "dynarr.c")
add_executable(Benchmark "${sources}")
target_compile_options(Benchmark PRIVATE -fopenmp)
target_link_libraries(Benchmark gmp m)
target_link_options(Benchmark PRIVATE -fopenmp)


