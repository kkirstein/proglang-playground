// vim: set ft=zig sw=4 ts=4:

/// A set of (micro-) benchmarks for the zig programming language
const std = @import("std");
//const format = std.fmt.format;
//const warn = std.debug.warn;
const print = std.debug.print;
const allocator = std.heap.page_allocator;

const fib = @import("fib.zig");
const perfect = @import("perfect.zig");

/// main entry point
pub fn main() !void {
    var timer = try std.time.Timer.start();
    const ns_per_ms = std.time.ns_per_s / std.time.ms_per_s;

    print("Fibonacci numbers\n", .{});
    print("=================\n", .{});

    timer.reset();
    var res = fib.fib_naive(35);
    var elap = timer.read();
    print("fib_naive(35) = {} (Elapsed: {d:.3}ms).\n", .{ res, @intToFloat(f32, elap / ns_per_ms) });

    timer.reset();
    res = try fib.fib(u64, 35);
    elap = timer.read();
    print("fib(35) = {} (Elapsed: {d:.3}ms).\n", .{ res, @intToFloat(f32, elap / ns_per_ms) });

    timer.reset();
    res = try fib.fib_iter(u64, 35);
    elap = timer.read();
    print("fib_iter(35) = {} (Elapsed: {d:.3}ms).\n", .{ res, @intToFloat(f32, elap / ns_per_ms) });

    timer.reset();
    const res_2 = try fib.fib_iter(u1024, 1000);
    elap = timer.read();
    print("fib_iter(1000) = {} (Elapsed: {d:.3}ms).\n", .{ 0, @intToFloat(f32, elap / ns_per_ms) });

    print("\n", .{});
    print("Perfect numbers\n", .{});
    print("===============\n", .{});

    timer.reset();
    const pn_u16 = try perfect.perfect_numbers(u16, allocator, 10000);
    defer pn_u16.deinit();
    elap = timer.read();
    print("perfect_numbers(u16, 10000) = {} (Elapsed: {d:.3}ms).\n", .{
        "[]",
        @intToFloat(f32, elap / ns_per_ms),
    });

    timer.reset();
    const pn_u32 = try perfect.perfect_numbers(u32, allocator, 10000);
    defer pn_u32.deinit();
    elap = timer.read();
    print("perfect_numbers(u32, 10000) = {} (Elapsed: {d:.3}ms).\n", .{
        "[]",
        @intToFloat(f32, elap / ns_per_ms),
    });

    timer.reset();
    const pn_u64 = try perfect.perfect_numbers(u64, allocator, 10000);
    defer pn_u64.deinit();
    elap = timer.read();
    print("perfect_numbers(u64, 10000) = {} (Elapsed: {d:.3}ms).\n", .{
        "[]",
        @intToFloat(f32, elap / ns_per_ms),
    });
}

test "benchmark" {
    _ = @import("fib.zig");
    _ = @import("perfect.zig");
}
