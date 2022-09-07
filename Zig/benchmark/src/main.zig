// vim: set ft=zig sw=4 ts=4:

/// A set of (micro-) benchmarks for the zig programming language
const std = @import("std");
//const format = std.fmt.format;
//const warn = std.debug.warn;
const print = std.debug.print;
var gpa = std.heap.GeneralPurposeAllocator(.{}){};

const fib = @import("fib.zig");
const perfect = @import("perfect.zig");
const mandel = @import("mandelbrot.zig");
const mc = @import("montecarlo.zig");

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
    print("fib_iter(1000) = {} (Elapsed: {d:.3}ms).\n", .{ res_2, @intToFloat(f32, elap / ns_per_ms) });

    print("\n", .{});
    print("Perfect numbers\n", .{});
    print("===============\n", .{});

    timer.reset();
    const pn_u16 = try perfect.perfect_numbers(u16, &gpa.allocator, 10000);
    defer pn_u16.deinit();
    elap = timer.read();
    const pn_u16_str = try perfect.to_str(u16, &gpa.allocator, pn_u16);
    defer pn_u16_str.deinit();
    print("perfect_numbers(u16, 10000) = {s} (Elapsed: {d:.3}ms).\n", .{
        pn_u16_str.items,
        @intToFloat(f32, elap / ns_per_ms),
    });

    timer.reset();
    const pn_u32 = try perfect.perfect_numbers(u32, &gpa.allocator, 10000);
    defer pn_u32.deinit();
    elap = timer.read();
    const pn_u32_str = try perfect.to_str(u32, &gpa.allocator, pn_u32);
    defer pn_u32_str.deinit();
    print("perfect_numbers(u32, 10000) = {s} (Elapsed: {d:.3}ms).\n", .{
        pn_u32_str.items,
        @intToFloat(f32, elap / ns_per_ms),
    });

    timer.reset();
    const pn_u64 = try perfect.perfect_numbers(u64, &gpa.allocator, 10000);
    defer pn_u64.deinit();
    elap = timer.read();
    const pn_u64_str = try perfect.to_str(u64, &gpa.allocator, pn_u64);
    defer pn_u64_str.deinit();
    print("perfect_numbers(u64, 10000) = {s} (Elapsed: {d:.3}ms).\n", .{
        pn_u64_str.items,
        @intToFloat(f32, elap / ns_per_ms),
    });

    print("\n", .{});
    print("Mandelbrot set\n", .{});
    print("==============\n", .{});

    timer.reset();
    const width = 1920;
    const height = 1600;
    const img = try mandel.create(&gpa.allocator, width, height, -0.5, 0.0, 4.0 / @intToFloat(f32, width));
    defer img.deinit();
    elap = timer.read();
    print("mandelbrot({}, {}) (Elapsed: {d:.3}ms).\n", .{
        width,
        height,
        @intToFloat(f32, elap / ns_per_ms),
    });

    timer.reset();
    try img.writePPM(&gpa.allocator, "mandelbrot.ppm");
    elap = timer.read();
    print("mandelbrot({}, {}) written as PPM (Elapsed: {d:.3}ms).\n", .{
        width,
        height,
        @intToFloat(f32, elap / ns_per_ms),
    });

    timer.reset();
    try img.write(&gpa.allocator, "mandelbrot.png");
    elap = timer.read();
    print("mandelbrot({}, {}) written as PNG (Elapsed: {d:.3}ms).\n", .{
        width,
        height,
        @intToFloat(f32, elap / ns_per_ms),
    });

    print("\n", .{});
    print("Monte-Carlo simulations\n", .{});
    print("=======================\n", .{});

    const count = 100_000_000;
    timer.reset();
    const pi_value = mc.simulatePi(count);
    elap = timer.read();
    print("mc_pi({}) = {} Error: {e:.3} (Elapsed: {d:.3}ms.)\n", .{
        count,
        pi_value,
        std.math.absFloat(pi_value - std.math.pi),
        @intToFloat(f32, elap / ns_per_ms),
    });
}

test "benchmark" {
    _ = @import("fib.zig");
    _ = @import("perfect.zig");
    _ = @import("image.zig");
    _ = @import("mandelbrot.zig");
    _ = @import("montecarlo.zig");
}
