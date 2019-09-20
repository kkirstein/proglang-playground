// vim: set ft=zig sw=4 ts=4:

/// fib.zig
/// Calculating Fibonacci nambers

/// Naive recursive implementation
pub fn fib_naive(n: u64) u64 {
    return if (n < 2) n else fib_naive(n-1) + fib_naive(n-2);
}

/// Optimized tail-recursive variant
pub fn fib(n: u64) u64 {

    return fib_aux(n, 0, 1);
}

fn fib_aux(i: u64, a: u64, b: u64) u64 {
    return if (i == 0) a else fib_aux(i - 1, b, a + b);
}


const assert = @import("std").debug.assert;

test "fib_naive" {
    assert(fib_naive(1) == 1);
    assert(fib_naive(2) == 1);
    assert(fib_naive(3) == 2);
    assert(fib_naive(35) == 9227465);
}

test "fib" {
    assert(fib(1) == 1);
    assert(fib(2) == 1);
    assert(fib(3) == 2);
    assert(fib(35) == 9227465);
}

