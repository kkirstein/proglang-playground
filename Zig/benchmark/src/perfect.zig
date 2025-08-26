// vim: set ft=zig sw=4 ts=4:

/// perfect.zig
/// Module to find perfect numbers
///
const std = @import("std");
const Allocator = std.mem.Allocator;
//const heap = std.heap;
//const mem = std.mem;
//const warn = std.debug.warn;

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

/// Generates perfect number up to given limit [n]
pub fn perfect_numbers(comptime T: type, allocator: Allocator, limit: T) !std.ArrayList(T) {
    var res = try std.ArrayList(T).initCapacity(allocator, 16);
    var i: T = 1;
    while (i <= limit) : (i += 1) {
        if (is_perfect(T, i)) {
            try res.append(allocator, i);
        }
    }
    return res;
}

/// String representation of perfect numbers array list
pub fn to_str(comptime T: type, allocator: Allocator, ary: std.ArrayList(T)) !std.ArrayList(u8) {
    var buf = try std.ArrayList(u8).initCapacity(allocator, 64);
    const w = buf.writer(allocator);
    const slice = ary.items;

    _ = try w.write("[");
    if (slice.len > 0) {
        try w.print("{}", .{slice[0]});
        for (slice[1..]) |e| {
            try w.print(", {}", .{e});
        }
        //try w.print("length: {}", .{slice.len});
    }
    _ = try w.write("]");
    return buf;
}

fn print_list_head(comptime T: type, list: std.SinglyLinkedList(T)) void {
    if (list.first) |head| {
        std.debug.print("head: {}", .{head.data});
        if (head.next) |snd| {
            std.debug.print(" snd: {}", .{snd.data});
            if (snd.next) |third| {
                std.debug.print(" third: {}", .{third.data});
            }
        }
    } else {
        std.debug.print("<EMPTY>", .{});
    }
    std.debug.print("\n", .{});
}

/// Generates perfect number up to given limit [n]
pub fn perfect_number_list(comptime T: type, limit: T) std.SinglyLinkedList(T) {
    const L = std.SinglyLinkedList(T);
    var res = L{};

    var i: T = 1;
    while (i <= limit) : (i += 1) {
        if (is_perfect(T, i)) {
            var entry = L.Node{ .data = i };
            std.debug.print("new node: {}\n", .{entry});
            res.prepend(&entry);
            print_list_head(T, res);
        }
    }

    return res;
}
/// String representation of a singly linked list
//pub fn to_str(comptime T: type, l: std.SinglyLinkedList(T)) ![]u8 {
//    const allocator = heap.page_allocator;
//    var buf = try std.Buffer.init(allocator, "[");
//    defer buf.deinit();
//
//    var it = l.first;
//    while (it) |node| : (it = node.next) {
//        // concat to given string
//        try std.fmt.formatIntValue(node.data, "", std.fmt.FormatOptions{}, &buf, @TypeOf(std.Buffer.append).ReturnType.ErrorSet, std.Buffer.append);
//        try buf.append(",");
//    }
//    try buf.append("]");
//
//    return buf.toOwnedSlice();
//}
const testing = std.testing;

test "is perfect" {
    try testing.expect(!is_perfect(u32, 1));
    try testing.expect(!is_perfect(u32, 2));
    try testing.expect(!is_perfect(u32, 3));
    try testing.expect(!is_perfect(u32, 4));
    try testing.expect(!is_perfect(u32, 5));
    try testing.expect(is_perfect(u32, 6));
    try testing.expect(!is_perfect(u32, 7));
    try testing.expect(is_perfect(u32, 28));
}

test "perfect numbers" {
    const ta = testing.allocator;
    const exp = [_]u32{ 6, 28, 496 };
    var res = try perfect_numbers(u32, ta, 1000);
    defer res.deinit(ta);

    try testing.expect(std.mem.eql(u32, res.items, exp[0..]));
}

//test "perfect number list" {
//    var res = perfect_number_list(u32, 1000);
//    const exp = [_]u32{ 496, 28, 6 };
//    {
//        var it = res.first;
//        var idx: u32 = 0;
//        //std.debug.print("\n", .{});
//        while (it) |node| : (it = node.next) { // FIXME: test failure all node.data = 496?
//            //std.debug.print("idx: {}, &node: {}, data: {}, next: {}\n", .{ idx, &node, node.data, &node.next });
//            //testing.expect(node.data == exp[idx]);
//            idx += 1;
//            if (idx > 10) break;
//        }
//    }
//}

test "string representation of perfect numbers list" {
    const test_allocator = testing.allocator;
    var res_0 = try perfect_numbers(u32, test_allocator, 5);
    defer res_0.deinit(test_allocator);

    var res_1 = try perfect_numbers(u32, test_allocator, 10);
    defer res_1.deinit(test_allocator);

    var res_2 = try perfect_numbers(u32, test_allocator, 30);
    defer res_2.deinit(test_allocator);

    var res_0_str = try to_str(u32, test_allocator, res_0);
    defer res_0_str.deinit(test_allocator);

    var res_1_str = try to_str(u32, test_allocator, res_1);
    defer res_1_str.deinit(test_allocator);

    var res_2_str = try to_str(u32, test_allocator, res_2);
    defer res_2_str.deinit(test_allocator);

    try testing.expect(std.mem.eql(u8, res_0_str.items, "[]"));
    try testing.expect(std.mem.eql(u8, res_1_str.items, "[6]"));
    try testing.expect(std.mem.eql(u8, res_2_str.items, "[6, 28]"));
}
