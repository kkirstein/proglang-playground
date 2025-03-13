// vim: set ft=zig sw=4 ts=4:

/// mandelbrot.zig
/// Module to calculate Mandelbrot sets in Zig
///
const std = @import("std");
const C32 = std.math.complex.Complex(f32);
const image = @import("./image.zig");

/// maximum pixel value
const n_max = 255;

/// RGB values for a single pixel
const RGB24 = image.RGB(u8);
const ImageRGB24 = image.Image(image.RGB, u8);

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
fn to_rgb(val: u8) RGB24 {
    return RGB24{
        .r = 5 * @mod(val, 15),
        .g = 32 * @mod(val, 7),
        .b = 8 * @mod(val, 31),
    };
}

/// creates a Mandelbrot RGB image of given size
pub fn create(allocator: *std.mem.Allocator, width: usize, height: usize, x_center: f32, y_center: f32, pixel_size: f32) !ImageRGB24 {
    var img = try ImageRGB24.init(allocator, width, height);

    const offset = C32{
        .re = x_center - 0.5 * pixel_size * @as(f32, @floatFromInt(width)),
        .im = y_center + 0.5 * pixel_size * @as(f32, @floatFromInt(height)),
    };

    var y: usize = 0;
    while (y < height) : (y += 1) {
        var x: usize = 0;
        while (x < width) : (x += 1) {
            const coord = C32.add(offset, C32{
                .re = @as(f32, @floatFromInt(x)) * pixel_size,
                .im = -@as(f32, @floatFromInt(y)) * pixel_size,
            });
            const p = to_rgb(pixel_value(coord, 2.0));
            try img.set_pixel(x, y, p);
        }
    }
    return img;
}

/// writes image as PNM file
//pub fn writePPM(allocator: *std.mem.Allocator, img: []RGB, width: usize, height: usize, file_path: []const u8) !void {
//    const file = try std.fs.cwd().createFile(file_path, .{ .truncate = true });
//    defer file.close();
//    const w = file.writer();
//
//    var line_buf = std.ArrayList(u8).init(allocator);
//    defer line_buf.deinit();
//    var buf_writer = line_buf.writer();
//
//    try w.print("P3\n", .{});
//    try w.print("{} {} {}\n", .{ width, height, 255 });
//    for (img) |pix, i| {
//        try buf_writer.print("{} {} {} ", .{ pix.r, pix.g, pix.b });
//        if (i % 8 == 13) {
//            _ = try buf_writer.write("\n");
//            _ = try w.write(line_buf.items);
//            line_buf.shrinkRetainingCapacity(0);
//        }
//    }
//    // make sure remaining pixels are written to file
//    if (line_buf.items.len > 0) {
//        _ = try buf_writer.write("\n");
//        _ = try w.write(line_buf.items);
//    }
//}

const testing = std.testing;

//test "write image as PPM" {
//    const test_allocator = std.testing.allocator;
//
//    var img = [_]RGB{
//        RGB{ .r = 0, .g = 0, .b = 0 },
//        RGB{ .r = 128, .g = 0, .b = 0 },
//        RGB{ .r = 255, .g = 0, .b = 0 },
//        RGB{ .r = 0, .g = 0, .b = 0 },
//        RGB{ .r = 0, .g = 128, .b = 0 },
//        RGB{ .r = 0, .g = 255, .b = 0 },
//        RGB{ .r = 0, .g = 0, .b = 0 },
//        RGB{ .r = 0, .g = 0, .b = 128 },
//        RGB{ .r = 0, .g = 0, .b = 255 },
//    };
//    const img_slice: []RGB = img[0..];
//
//    try writePPM(test_allocator, img_slice, 3, 3, "test_image.ppm");
//    defer std.fs.cwd().deleteFile("test_image.ppm") catch unreachable;
//
//    const file = try std.fs.cwd().openFile("test_image.ppm", .{ .read = true });
//    defer file.close();
//
//    const contents = try file.reader().readAllAlloc(
//        test_allocator,
//        120,
//    );
//    defer test_allocator.free(contents);
//
//    testing.expect(std.mem.eql(u8, contents, "P3\n3 3 255\n0 0 0 128 0 0 255 0 0 0 0 0 0 128 0 0 255 0 0 0 0 0 0 128 0 0 255 \n"));
//}
