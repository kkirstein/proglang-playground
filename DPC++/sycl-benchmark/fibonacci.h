#pragma once

/// <summary>
/// Fibonacci module contains differnt implemntation to calculate Fibbonacci numbers
/// </summary>
namespace fib {

	/// <summary>
	/// Naive recursive implementation of Fibbonacci numbers
	/// </summary>
	/// <param name="n">Index of Fibonacci number to be calculated</param>
	/// <returns>nth FIbonacci number</returns>
	int fib_naive(const int n);

	/// <summary>
	/// Tail-call optimized implementation of Fibonacci numbers
	/// </summary>
	/// <param name="n">Index of Fibonacci number to be calculated</param>
	/// <returns>nth FIbonacci number</returns>
	int fib(const int n);
}



