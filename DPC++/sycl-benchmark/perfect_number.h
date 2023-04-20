#pragma once

#include <vector>

/// <summary>
/// Find perfect numbers that are equal to the sum of their divisors
/// </summary>
namespace perfect_number {

	/// <summary>
	/// List all perfect numbers up to given limit
	/// </summary>
	/// <param name="limit">Upper limit for perfect number list</param>
	/// <returns>A vector of perfect numbers</returns>
	std::vector<int> perfect_numbers(const int limit);

}
