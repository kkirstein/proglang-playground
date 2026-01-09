package tasks

// Naive recursive implementation of Fibonacci number calculation
fib_naive :: proc(n: int) -> int {
	if n < 2 {
		return n
	} else {
		return fib_naive(n - 1) + fib_naive(n - 2)
	}
}
