# build stock-price executable
#set(CMAKE_Fortran_COMPILER /usr/local/bin/caf)
#set(CMAKE_Fortran_LINKER_EXECUTABLE /usr/local/bin/caf)

add_executable(stock_price "stock_volatility.f90" "mod_io.f90" "mod_array.f90" "mod_alloc.f90")

target_compile_options(stock_price PRIVATE -O3)

file(COPY data DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
