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
