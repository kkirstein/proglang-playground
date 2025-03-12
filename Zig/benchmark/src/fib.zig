// vim: set ft=zig sw=4 ts=4:

/// fib.zig
/// Calculating Fibonacci nambers
/// Naive recursive implementation
pub fn fib_naive(n: u64) u64 {
    return if (n < 2) n else fib_naive(n - 1) + fib_naive(n - 2);
}

/// Optimized tail-recursive variant
pub fn fib(comptime T: type, n: u64) !T {
    return fib_aux(T, n, 0, 1);
}

fn fib_aux(comptime T: type, i: u64, a: T, b: T) anyerror!T {
    if (i == 0) return a else {
        //var new_b: T = 0;
        const new_b, const overflow = @addWithOverflow(a, b);
        if (overflow > 0) return error.Overflow else return fib_aux(T, i - 1, b, new_b);
        //if (@addWithOverflow(T, a, b, &new_b)) return error.Overflow else return fib_aux(T, i - 1, b, new_b);
    }
}

/// Iterative variant
pub fn fib_iter(comptime T: type, n: u64) !T {
    var a: T = 0;
    var b: T = 1;
    var i: u64 = n;
    while (i > 0) : ({
        i -= 1;
    }) {
        const new_b, const overflow = @addWithOverflow(a, b);
        if (overflow > 0) return error.Overflow;
        //var new_b: T = 0;
        //if (@addWithOverflow(T, a, b, &new_b)) return error.Overflow;
        a = b;
        b = new_b;
    }
    return a;
}

const testing = @import("std").testing;

test "fib_naive" {
    try testing.expect(fib_naive(1) == 1);
    try testing.expect(fib_naive(2) == 1);
    try testing.expect(fib_naive(3) == 2);
    try testing.expect(fib_naive(35) == 9227465);
}

test "fib_iter" {
    try testing.expect((try fib_iter(u64, 1)) == 1);
    try testing.expect((try fib_iter(u64, 2)) == 1);
    try testing.expect((try fib_iter(u64, 3)) == 2);
    try testing.expect((try fib_iter(u32, 35)) == 9227465);
    try testing.expect((try fib_iter(u64, 35)) == 9227465);
    try testing.expect((try fib_iter(u128, 35)) == 9227465);
}

test "fib" {
    try testing.expect((try fib(u64, 1)) == 1);
    try testing.expect((try fib(u64, 2)) == 1);
    try testing.expect((try fib(u64, 3)) == 2);
    try testing.expect((try fib(u32, 35)) == 9227465);
    try testing.expect((try fib(u64, 35)) == 9227465);
    try testing.expect((try fib(u128, 35)) == 9227465);
}
