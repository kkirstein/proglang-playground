
#include "perfect_number.h"

/// <summary>
/// Find perfect numbers that are equal to the sum of their divisors
/// </summary>
namespace perfect_number {

	/// <summary>
	/// Check for perfect number property
	/// </summary>
	/// <param name="n">Number to be checked</param>
	/// <returns>True, if n is a perfect number, false otherwise</returns>
	bool is_perfect(const int n) {
		if (n < 2) return false;

		int sum = 0;
		for (unsigned i = 1; i < n; ++i) {
			if (n % i == 0) sum += i;
		}

		return (sum == n);
	}


	/// <summary>
	/// List all perfect numbers up to given limit
	/// </summary>
	/// <param name="limit">Upper limit for perfect number list</param>
	/// <returns>A vector of perfect numbers</returns>
	std::vector<int> perfect_numbers(const int limit) {
		std::vector<int> pn = std::vector<int>();

		for (int i = 2; i <= limit; ++i) {
			if (is_perfect(i)) pn.push_back(i);
		}

		return pn;
	}
}
