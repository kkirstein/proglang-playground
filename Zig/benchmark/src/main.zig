// vim: set ft=zig sw=4 ts=4:

/// A set of (micro-) benchmarks for the zig programming language
const std = @import("std");
const format = std.fmt.format;
const warn = std.debug.warn;

const fib = @import("fib.zig");

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
    res = try fib.fib(u32, 35);
    elap = timer.read();
    warn("fib(35) = {} (Elapsed: {d:.3}ms).\n", u64(res), @intToFloat(f32, elap / ns_per_ms));

    //timer.reset();
    //const res_2 = try fib.fib(u256, 1000);
    //elap = timer.read();
    //warn("fib(1000) = {} (Elapsed: {d:.3}ms).\n", u128(0), @intToFloat(f32, elap / ns_per_ms));
}
