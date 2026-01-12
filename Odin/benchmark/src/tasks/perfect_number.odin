package tasks

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
