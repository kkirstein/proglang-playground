package tests

import "../src/tasks"
import "core:testing"

@(test)
fib_naive_test :: proc(t: ^testing.T) {
	testing.expect_value(t, tasks.fib_naive(0), 0)
	testing.expect_value(t, tasks.fib_naive(1), 1)
	testing.expect_value(t, tasks.fib_naive(2), 1)
	testing.expect_value(t, tasks.fib_naive(3), 2)
	testing.expect_value(t, tasks.fib_naive(4), 3)
	testing.expect_value(t, tasks.fib_naive(10), 55)
}

@(test)
fib_int_test :: proc(t: ^testing.T) {
	testing.expect_value(t, tasks.fib_int(0), 0)
	testing.expect_value(t, tasks.fib_int(1), 1)
	testing.expect_value(t, tasks.fib_int(2), 1)
	testing.expect_value(t, tasks.fib_int(3), 2)
	testing.expect_value(t, tasks.fib_int(4), 3)
	testing.expect_value(t, tasks.fib_int(10), 55)
}
