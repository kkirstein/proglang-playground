// vim: set ft=zig sw=4 ts=4:

/// perfect.zig
const std = @import("std");
const heap = std.heap;
const mem = std.mem;
//const warn = std.debug.warn;

const testing = std.testing;

/// Finding perfect numbers
/// Predicate for perfect numbers
pub fn is_perfect(n: u32) bool {
    var i: u32 = 1;
    var sum: u32 = 0;

    while (i < n) : (i += 1) {
        if (n % i == 0) sum += i;
    }

    return sum == n;
}

/// Generates perfect number up to givien limit [n]
pub fn perfect_numbers(limit: u32) std.SinglyLinkedList(u32) {
    const allocator = heap.direct_allocator;
    var res = std.SinglyLinkedList(u32).init();

    var i: u32 = 1;
    while (i <= limit) : (i += 1) {
        if (is_perfect(i)) {
            const entry = res.createNode(i, allocator) catch unreachable;
            res.prepend(entry);
        }
    }

    return res;
}

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
    const res = perfect_numbers(1000);
    const exp = [_]u64{ 496, 28, 6 };
    var it = res.first;
    var idx: u32 = 0;
    while (it) |node| : (it = node.next) {
        testing.expect(node.data == exp[idx]);
        idx += 1;
    }
}
