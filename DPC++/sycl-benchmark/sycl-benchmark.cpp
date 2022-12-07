//==============================================================
// A set of micro benchmarks, implemented in modern C++
// 
// It uses the SYCL framework for its parallelization by using 
// Intel DPC++ compiler
// 
//==============================================================
//
// SPDX-License-Identifier: MIT
// =============================================================
#include <CL/sycl.hpp>
#include <vector>
#include <iostream>
#include <string>
#if FPGA || FPGA_EMULATOR
#include <sycl/ext/intel/fpga_extensions.hpp>
#endif

using namespace sycl;


//************************************
// Main entry point
//************************************
int main(int argc, char* argv[]) {

    std::cout << "Fibonacci Numbers" << std::endl;
    std::cout << "-----------------" << std::endl;
    std::cout << std::endl;

    std::cout << "Perfect Numbers" << std::endl;
    std::cout << "---------------" << std::endl;
    std::cout << std::endl;

    std::cout << "Prime Numbers" << std::endl;
    std::cout << "-------------" << std::endl;
    std::cout << std::endl;

    std::cout << "Mandelbrot Set" << std::endl;
    std::cout << "--------------" << std::endl;
    std::cout << std::endl;



    return EXIT_SUCCESS;
}