package tasks

import "core:math/big"

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

fib_big_int :: proc(n: int) -> ^big.Int {
	fib_loop :: proc(n: int, a, b: ^big.Int) -> ^big.Int {
		if n == 0 {
			free(b)
			return a
		} else {
			new_a := b
			new_b := a // reuse big_int at location a
			big.int_add(new_b, a, b) // TODO: handle error condition
			return fib_loop(n - 1, new_a, new_b)
		}
	}

	a := new(big.Int)
	b := new(big.Int)
	big.int_set_from_integer(a, 0)
	big.int_set_from_integer(b, 1)
	return fib_loop(n, a, b)
}
