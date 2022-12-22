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
//#include <CL/sycl.hpp>
//#include <vector>
#include <iostream>
//#include <string>
//#if FPGA || FPGA_EMULATOR
//#include <sycl/ext/intel/fpga_extensions.hpp>
//#endif
#include <functional>
#include <chrono>

#include "fibonacci.h"

//using namespace sycl;

using namespace std::chrono;

/// <summary>
/// struct to hold calculation result together with elapsed time
/// </summary>
/// <typeparam name="T">type of calculation result</typeparam>
template<typename T>
struct result {
	T result;
	milliseconds elapsed;
};

template<typename T>
result<T> time_it(T (*fun)(void)) {
	auto tic = high_resolution_clock::now();
	auto res = fun();
	auto toc = high_resolution_clock::now();
	auto elapsed = duration_cast<milliseconds>(toc - tic);

	return result<T>{ .result = res, .elapsed = elapsed };
};

//************************************
// Main entry point
//************************************
int main(int argc, char* argv[]) {

	std::cout << "Fibonacci Numbers" << std::endl;
	std::cout << "-----------------" << std::endl;

	const result res_1 = time_it<int>([]() { return fib::fib_naive(35);});
	std::cout << "fib_naive(35) = " << res_1.result << " (elapsed: " << res_1.elapsed << ")" << std::endl;

	const result res_2 = time_it<int>([]() { return fib::fib(35);});
	std::cout << "fib(35) = " << res_2.result << " (elapsed: " << res_2.elapsed << ")" << std::endl;

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