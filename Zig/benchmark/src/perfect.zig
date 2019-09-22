// vim: set ft=zig sw=4 ts=4:

/// perfect.zig
/// Finding perfect numbers
/// Predicate for perfect numbers
pub fn is_perfect(n: u64) bool {
    return true;
}

/// Generates perfect number up to givien limit [n]
pub fn perfect_numbers(limit: u64) [_]u64 {
    return [_]u64{};
}

const testing = @import("std").testing;

test "is perfect" {
    testing.expect(!is_perfect(1));
    testing.expect(!is_perfect(2));
    testing.expect(!is_perfect(3));
    testing.expect(!is_perfect(4));
    testing.expect(!is_perfect(5));
    testing.expect(is_perfect(6));
    testing.expect(!is_perfect(7));
    testing.expect(is_perfect(28));
}

test "perfect numbers" {
    testing.expect(perfect_numbers(1000) == [_]u64{ 6, 28, 496 });
}
