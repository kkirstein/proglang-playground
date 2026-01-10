package tasks

// Naive recursive implementation of Fibonacci number calculation
fib_naive :: proc(n: int) -> int {
	if n < 2 {
		return n
	} else {
		return fib_naive(n - 1) + fib_naive(n - 2)
	}
}

fib_int :: proc(n: int) -> int {
	fib_loop :: proc(n, a, b: int) -> int {
		if n == 0 {
			return a
		} else {
			return fib_loop(n - 1, b, a + b)
		}
	}

	return fib_loop(n, 0, 1)
}