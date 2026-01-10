package tests

import "../src/tasks"
import "core:fmt"
import "core:math/big"
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

@(test)
fib_big_int_test :: proc(t: ^testing.T) {
	expected: big.Int
	actual: ^big.Int

	actual = tasks.fib_big_int(0)
	check, _ := big.eq(actual, big.INT_ZERO)
	testing.expect(t, check)
	free(actual)

	actual = tasks.fib_big_int(1)
	check, _ = big.eq(actual, big.INT_ONE)
	testing.expect(t, check)
	free(actual)

	actual = tasks.fib_big_int(2)
	check, _ = big.eq(actual, big.INT_ONE)
	testing.expect(t, check)
	free(actual)

	big.int_set_from_integer(&expected, 2)
	actual = tasks.fib_big_int(3)
	check, _ = big.eq(actual, &expected)
	testing.expect(t, check)
	free(actual)

	big.int_set_from_integer(&expected, 3)
	actual = tasks.fib_big_int(4)
	check, _ = big.eq(actual, &expected)
	testing.expect(t, check)
	free(actual)

	big.int_set_from_integer(&expected, 55)
	actual = tasks.fib_big_int(10)
	check, _ = big.eq(actual, &expected)
	testing.expect(t, check)
	free(actual)
}
