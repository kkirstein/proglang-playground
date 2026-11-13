module benchmark::fibonacci;

import std::math;

fn int fib_naive(int n)
{
	if (n <= 1)
	{
		return n;
	}
	else
	{
		return fib_naive(n - 1) + fib_naive(n - 2);
	}
}

fn int fib(int n)
{
	return fib_helper(n, 0, 1);
}

fn int fib_helper(int n, int a, int b) @private
{
	if (n == 0)
	{
		return a;
	}
	else
	{
		return fib_helper(n - 1, b, a + b);
	}
}

fn BigInt fib_big(int n)
{
	return fib_helper_big(n, bigint::from_int(0), bigint::from_int(1));
}

fn BigInt fib_helper_big(int n, BigInt a, BigInt b) @private
{
	if (n == 0)
	{
		return a;
	}
	else
	{
		return fib_helper_big(n - 1, b, BigInt.add(a, b));
	}
}


// Testing the Fibonacci functions
fn void t_fib_naive() @test
{
	int result = fib_naive(35);
	assert(result == 9227465);
}

fn void t_fib() @test
{
	int result = fib(35);
	assert(result == 9227465);
}

fn void t_fib_big() @test
{
	BigInt result = fib_big(35);
	assert(result == bigint::from_int(9227465));
}


// Benchmarking the Fibonacci functions
fn void b_fib_naive() @benchmark
{
	int result = fib_naive(20);
}

fn void b_fib() @benchmark
{
	int result = fib(20);
}

fn void b_fib_big() @benchmark
{
	BigInt result = fib_big(20);
}
