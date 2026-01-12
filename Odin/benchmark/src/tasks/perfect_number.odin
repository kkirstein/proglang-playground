package tasks

import sa "core:container/small_array"

// Check whether given number is perfect, meaning equal to the
// sum of its proper divisors.
is_perfect_number :: proc(n: int) -> bool {
    if n < 2 {
        return false
    }

    sum := 0
    for i := 1; i <= n / 2; i += 1 {
        if n % i == 0 {
            sum += i
        }
    }

    return sum == n
}

perfect_numbers :: proc(limit: int) -> [dynamic]int {
    perfects : [dynamic]int
    for i := 2; i <= limit; i += 1 {
        if is_perfect_number(i) {
            append(&perfects, i)
        }
    }
    return perfects
}
