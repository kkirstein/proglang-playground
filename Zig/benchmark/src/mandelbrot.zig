// vim: set ft=zig sw=4 ts=4:

/// mandelbrot.zig
/// Module to calculate Mandelbrot sets in Zig
///
const std = @import("std");
const C32 = std.math.complex.Complex(f32);

/// maximum pixel value
const n_max = 255;

/// RGB values for a single pixel
const RGB = struct {
    r: u8, g: u8, b: u8
};

/// calculate Mandelbrot value for given (complex) coordinates
fn pixel_value(z: C32, r_max: f32) u8 {
    var n: u8 = n_max;
    var z1 = C32{ .re = 0, .im = 0 };
    while (n > 0) : (n -= 1) {
        if (std.math.complex.abs(z1) > r_max) return n;
        z1 = C32.add(C32.mul(z1, z1), z);
    }

    return 0;
}

/// convert pixel value to RGB value(s)
fn to_rgb(val: u8) RGB {
    return RGB{
        .r = 5 * @mod(val, 15),
        .g = 32 * @mod(val, 7),
        .b = 8 * @mod(val, 31),
    };
}

/// creates a Mandelbrot RGB image of given size
pub fn create(allocator: *std.mem.Allocator, width: usize, height: usize, x_center: f32, y_center: f32, pixel_size: f32) ![]RGB {
    var img = try allocator.alloc(RGB, width * height);

    const offset = C32{
        .re = x_center - 0.5 * pixel_size * @intToFloat(f32, width),
        .im = y_center + 0.5 * pixel_size * @intToFloat(f32, height),
    };

    var y: usize = 0;
    while (y < height) : (y += 1) {
        var x: usize = 0;
        while (x < width) : (x += 1) {
            const coord = C32.add(offset, C32{
                .re = @intToFloat(f32, x) * pixel_size,
                .im = -@intToFloat(f32, y) * pixel_size,
            });
            img[x + width * y] = to_rgb(pixel_value(coord, 2.0));
        }
    }
    return img;
}

/// writes image as PNM file
pub fn writePPM(img: *const []RGB, width: usize, height: usize, file_path: []const u8) !void {
    const file = try std.fs.cwd().createFile(file_path, .{ .truncate = true });
    defer file.close();
    const w = file.writer();

    try w.print("P3\n", .{});
    try w.print("{} {} {}\n", .{ width, height, 255 });
    for (img.*) |pix, i| {
        try w.print("{} {} {} ", .{ pix.r, pix.g, pix.b });
        if (i % 8 == 7) try w.print("\n", .{});
    }
}
