// vim: set ft=zig sw=4 ts=4:

/// A set of (micro-) benchmarks for the zig programming language
const std = @import("std");
const format = std.fmt.format;
const warn = std.debug.warn;

const fib = @import("fib.zig");
const perfect = @import("perfect.zig");

/// main entry point
pub fn main() !void {
    const stdout_file = try std.io.getStdOut();

    var timer = try std.time.Timer.start();
    const ns_per_ms = std.time.ns_per_s / std.time.ms_per_s;

    try stdout_file.write("Fibonacci numbers\n");
    try stdout_file.write("=================\n");

    timer.reset();
    var res = fib.fib_naive(35);
    var elap = timer.read();
    warn("fib_naive(35) = {} (Elapsed: {d:.3}ms).\n", u64(res), @intToFloat(f32, elap / ns_per_ms));

    timer.reset();
    res = try fib.fib(u64, 35);
    elap = timer.read();
    warn("fib(35) = {} (Elapsed: {d:.3}ms).\n", u64(res), @intToFloat(f32, elap / ns_per_ms));

    timer.reset();
    res = try fib.fib_iter(u64, 35);
    elap = timer.read();
    warn("fib_iter(35) = {} (Elapsed: {d:.3}ms).\n", u64(res), @intToFloat(f32, elap / ns_per_ms));

    timer.reset();
    const res_2 = try fib.fib_iter(u1024, 1000);
    elap = timer.read();
    warn("fib_iter(1000) = {} (Elapsed: {d:.3}ms).\n", u64(0), @intToFloat(f32, elap / ns_per_ms));

    try stdout_file.write("\n");
    try stdout_file.write("Perfect numbers\n");
    try stdout_file.write("===============\n");

    timer.reset();
    const pn_u16 = perfect.perfect_numbers(u16, 10000);
    elap = timer.read();
    warn("perfect_numbers(u16, 10000) = {} (Elapsed: {d:.3}ms).\n", pn_u16, @intToFloat(f32, elap / ns_per_ms));

    timer.reset();
    const pn_u32 = perfect.perfect_numbers(u32, 10000);
    elap = timer.read();
    warn("perfect_numbers(u32, 10000) = {} (Elapsed: {d:.3}ms).\n", pn_u32, @intToFloat(f32, elap / ns_per_ms));
    
    timer.reset();
    const pn_u64 = perfect.perfect_numbers(u64, 10000);
    elap = timer.read();
    warn("perfect_numbers(u64, 10000) = {} (Elapsed: {d:.3}ms).\n", pn_u64, @intToFloat(f32, elap / ns_per_ms));
}

test "benchmark" {
    _ = @import("fib.zig");
    _ = @import("perfect.zig");
}
