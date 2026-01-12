package tests

import "../src/tasks"
import "core:testing"

@(test)
test_is_perfect_number :: proc(t: ^testing.T) {
	testing.expect(t, tasks.is_perfect_number(6))
	testing.expect(t, tasks.is_perfect_number(28))
	testing.expect(t, tasks.is_perfect_number(496))
	testing.expect(t, tasks.is_perfect_number(8128))

	testing.expect(t, !tasks.is_perfect_number(0))
	testing.expect(t, !tasks.is_perfect_number(1))
	testing.expect(t, !tasks.is_perfect_number(5))
	testing.expect(t, !tasks.is_perfect_number(12))
	testing.expect(t, !tasks.is_perfect_number(97))
}

@(test)
test_perfect_numbers :: proc(t: ^testing.T) {
	perfects := tasks.perfect_numbers(10000)
	defer delete(perfects)
	expected := [?]int{6, 28, 496, 8128}

	testing.expect(t, len(perfects) == len(expected))

	for i in 0 ..< len(expected) {
		testing.expect(t, perfects[i] == expected[i])
	}
}
