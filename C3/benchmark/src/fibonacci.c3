module benchmark::fibonacci;

fn int fib(int n)
{
	if (n <= 1)
	{
		return n;
	}
	else
	{
		return fib(n - 1) + fib(n - 2);
	}
}


// Benchmarking the Fibonacci functions
fn void b_fib() @benchmark
{
	int result = fib(35);
}
