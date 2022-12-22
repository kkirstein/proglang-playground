
module;

/// <summary>
/// Fibonacci module contains differnt implemntation to calculate Fibbonacci numbers
/// </summary>
module fibonacci;

namespace fib {

	/// <summary>
	/// Naive recursive implementation of Fibbonacci numbers
	/// </summary>
	/// <param name="n">Index of Fibonacci number to be calculated</param>
	/// <returns>nth FIbonacci number</returns>
	int fib_naive(const int n) {

		if (n < 2) {
			return n;
		}
		else {
			return fib_naive(n - 1) + fib_naive(n - 2);
		}
		return 0;
	}

	/// <summary>
	/// Helper for tail-call optimized version
	/// </summary>
	int fib_aux(const int a, const int b, const int n) {

		if (n < 1) {
			return a;
		}
		else {
			return fib_aux(b, a + b, n - 1);
		}
	}

	/// <summary>
	/// Tail-call optimized implementation of Fibonacci numbers
	/// </summary>
	/// <param name="n">Index of Fibonacci number to be calculated</param>
	/// <returns>nth FIbonacci number</returns>
	int fib(const int n)
	{
		return fib_aux(0, 1, n);
	}
}

