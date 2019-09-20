// vim: set ft=zig sw=4 ts=4:

/// A set of (micro-) benchmarks for the zig programming language
const std = @import("std");
const format = std.fmt.format;
const warn = std.debug.warn;

const fib = @import("fib.zig");

/// main entry point
pub fn main() !void {
    const stdout_file = try std.io.getStdOut();

    //var timer = try std.time.Timer.start();

    try stdout_file.write("Fibonacci numbers\n");
    try stdout_file.write("=================\n");
    const tic = 1;
    const res = fib.fib_naive(35);
    const toc = 2;
    //try stdout_file.write(format("fib:naive(35) = {0} (Elapsed: {1}s.\n", res, toc - tic));
    warn("fib_naive(35) = {0} (Elapsed: {1}s).\n", u64(res), f64(toc - tic));
}
