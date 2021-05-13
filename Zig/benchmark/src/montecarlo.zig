// vim: set ft=zig sw=4 ts=4:

const std = @import("std");

const Result = struct { success: usize, failed: usize };

/// montecarlo.zig
/// Module to perform some Monte-Carlo simulations in Zig
///
/// approximate Pi by counting points inside of a unit circle and
/// its surrounding square
/// returns a tuple of number of points inside & outside unit circle
pub fn simulatePi(count: usize) f64 {
    var inside: usize = 0;
    var outside: usize = 0;

    // init random generator
    var prng = std.rand.DefaultPrng.init(0);
    const rnd = &prng.random;

    var i: usize = 0;
    while (i < count) : (i += 1) {
        const x = 2.0 * rnd.float(f64) - 1.0;
        const y = 2.0 * rnd.float(f64) - 1.0;

        if (x * x + y * y < 1.0) {
            inside += 1;
        } else {
            outside += 1;
        }
    }

    const res = 4 * @intToFloat(f64, inside) / @intToFloat(f64, count);
    return res;
}

// testing
const testing = std.testing;

//test "no samples" {
//    const res = simulatePi(0);
//
//    testing.expect(res == 0);
//}

test "calulate Pi" {
    const count = 1_000_000;
    const res = simulatePi(count);

    //std.debug.print("res: {}", .{res});
    testing.expect(std.math.absFloat(res - std.math.pi) < 1e-4);
}
