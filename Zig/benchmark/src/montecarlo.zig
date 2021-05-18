// vim: set ft=zig sw=4 ts=4:

/// montecarlo.zig
/// Module to perform some Monte-Carlo simulations in Zig
///
const std = @import("std");

/// result statistic for Monte-Carlo simulations
const Result = struct { success: usize, failed: usize };

/// type of generator for a stimulus of type T of a Monte-Carlo run
fn Generator(comptime T: type) type {
    return fn (*std.rand.Random) T;
}

/// type of Monte-Carlo simulation evaluator
fn Evaluator(comptime T: type) type {
    return fn (T) bool;
}

/// runs a Monte-Carlo simulation with given number of runs
fn runner(comptime T: type, gen: Generator(T), eval: Evaluator(T), rand: *std.rand.Random, n: usize) Result {
    var res = Result{ .success = 0, .failed = 0 };
    var i: usize = 0;

    while (i < n) : (i += 1) {
        const stimulus = gen(rand);
        if (eval(stimulus)) {
            res.success += 1;
        } else {
            res.failed += 1;
        }
    }

    return res;
}

/// generate random distance for pi simulation
fn piGen(rnd: *std.rand.Random) f64 {
    const x = 2.0 * rnd.float(f64) - 1.0;
    const y = 2.0 * rnd.float(f64) - 1.0;

    return x * x + y * y;
}

/// check whether distance is within unit circle
fn piEval(val: f64) bool {
    return (val < 1.0);
}

/// approximate Pi by counting points inside of a unit circle and
/// its surrounding square
/// returns a tuple of number of points inside & outside unit circle
pub fn simulatePi(count: usize) f64 {

    // init random generator
    var prng = std.rand.DefaultPrng.init(0);
    const rnd = &prng.random;

    const stat = runner(f64, piGen, piEval, rnd, count);

    const res = 4 * @intToFloat(f64, stat.success) / @intToFloat(f64, count);
    return res;
}

// testing
const testing = std.testing;

fn simpleSampler(rnd: *std.rand.Random) u8 {
    return rnd.intRangeAtMost(u8, 0, 1);
}
fn trueEval(val: u8) bool {
    return (val > 0);
}

test "no samples" {
    var prng = std.rand.DefaultPrng.init(0);
    const rnd = &prng.random;
    const res = runner(u8, simpleSampler, trueEval, rnd, 0);

    try testing.expect(res.success == 0);
    try testing.expect(res.failed == 0);
}

test "100 samples" {
    var prng = std.rand.DefaultPrng.init(0);
    const rnd = &prng.random;
    const res = runner(u8, simpleSampler, trueEval, rnd, 100);

    try testing.expect(res.success + res.failed == 100);
}

test "calulate Pi" {
    const count = 1_000_000;
    const res = simulatePi(count);

    try testing.expect(std.math.absFloat(res - std.math.pi) < 1e-4);
}
