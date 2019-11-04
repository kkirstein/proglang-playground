// vim: set ft=zig sw=4 ts=4:

/// perfect.zig
const std = @import("std");
const heap = std.heap;
const mem = std.mem;
//const warn = std.debug.warn;

const testing = std.testing;

/// Finding perfect numbers
/// Predicate for perfect numbers
pub fn is_perfect(comptime T: type, n: T) bool {
    var i: T = 1;
    var sum: T = 0;

    while (i < n) : (i += 1) {
        if (n % i == 0) sum += i;
    }

    return sum == n;
}

/// Generates perfect number up to givien limit [n]
pub fn perfect_numbers(comptime T: type, limit: T) std.SinglyLinkedList(T) {
    const allocator = heap.direct_allocator;
    var res = std.SinglyLinkedList(T).init();

    var i: T = 1;
    while (i <= limit) : (i += 1) {
        if (is_perfect(T, i)) {
            const entry = res.createNode(i, allocator) catch unreachable;
            res.prepend(entry);
        }
    }

    return res;
}

/// String representation of a singly linked list
pub fn to_string(comptime T: type, l: std.SinglyLinkedList(T)) []u8 {
    const allocator = heap.direct_allocator;
    var buf = try std.Buffer.init(allocator);

    while (it) |node| : (it = node.next) {
        // concat to given string
    }
}

test "is perfect" {
    testing.expect(!is_perfect(u32, 1));
    testing.expect(!is_perfect(u32, 2));
    testing.expect(!is_perfect(u32, 3));
    testing.expect(!is_perfect(u32, 4));
    testing.expect(!is_perfect(u32, 5));
    testing.expect(is_perfect(u32, 6));
    testing.expect(!is_perfect(u32, 7));
    testing.expect(is_perfect(u32, 28));
}

test "perfect numbers" {
    const res = perfect_numbers(u32, 1000);
    const exp = [_]u32{ 496, 28, 6 };
    var it = res.first;
    var idx: u32 = 0;
    while (it) |node| : (it = node.next) {
        testing.expect(node.data == exp[idx]);
        idx += 1;
    }
}

test "string representation of perfect numbers list" {
    const res = perfect_numbers(u32, 100);

    //testing.expect(to_string(u32, res) == "[6,28]");
}