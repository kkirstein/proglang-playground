// vim: set ft=zig sw=4 ts=4:

/// image.zig
/// Module image offers structs and functions for pixel
/// and image data.
const std = @import("std");
const Allocator = std.mem.Allocator;
const stbImageWrite = @cImport({
    @cDefine("STB_IMAGE_WRITE_IMPLEMENTATION", {});
    @cInclude("stb_image_write.h");
});

const testing = std.testing;

/// RGB values for a single pixel
pub fn RGB(comptime T: type) type {
    if (T == u8 or T == f32) {
        return struct {
            const Self = @This();

            r: T,
            g: T,
            b: T,

            /// access pixel data by index
            pub fn get_idx(self: Self, idx: usize) !T {
                return switch (idx) {
                    0 => self.r,
                    1 => self.g,
                    2 => self.b,
                    else => error.OutOfBounds,
                };
            }

            /// generate pixel struct from slice of values
            pub fn from_slice(s: []T) !Self {
                if (s.len != 3) return error.InvalidLength else return Self{ .r = s[0], .g = s[1], .b = s[2] };
            }

            /// equality predicate
            pub fn eql(self: Self, other: Self) bool {
                return self.r == other.r and self.g == other.g and self.b == other.b;
            }
        };
    } else unreachable;
}

/// Mono value for a single pixel
pub fn Mono(comptime T: type) type {
    if (T == u8 or T == f32) {
        return struct {
            const Self = @This();

            i: T,

            /// access pixel data by index
            pub fn get_idx(self: Self, idx: usize) !T {
                return if (idx == 0)
                    self.i
                else
                    error.OutOfBounds;
            }

            /// equality predicate
            pub fn eql(self: Self, other: Self) bool {
                return self.i == other.i;
            }
        };
    } else unreachable;
}

/// Determines the number of channels for each pixel data type
fn num_channel(comptime T: fn (type) type) usize {
    return if (T == RGB) 3 else if (T == Mono) 1 else unreachable;
}

/// Image struct, paramterized with pixel and storage types
pub fn Image(comptime TPixel: fn (type) type, comptime TData: type) type {
    return struct {
        const Self = @This();
        /// Pixel type
        //const TPixel = TPixel(TData);
        const TData = TData;

        const chans = num_channel(TPixel);
        //const chans = 3;

        /// array of pixel values
        data: []TData,

        /// image width & height
        width: usize,
        height: usize,

        /// number of channels
        /// (determined from pixel type TPixel)
        channels: usize,

        /// Allocator for image data
        allocator: *Allocator,

        /// initialize memory for image data
        pub fn init(allocator: *Allocator, width: usize, height: usize) !Self {
            var data_mem = try allocator.alloc(TData, width * height * chans);
            return Self{
                .allocator = allocator,
                .width = width,
                .height = height,
                .channels = chans,
                .data = data_mem,
            };
        }

        /// free allocated memory
        pub fn deinit(self: Self) void {
            self.allocator.free(self.data);
        }

        /// set pixel value
        pub fn set_pixel(self: *Self, x: usize, y: usize, value: TPixel(TData)) !void {
            if (x > self.width or y > self.height) return error.OutOfBound;
            const stride = (x + self.width * y) * self.channels;
            var i: usize = 0;
            while (i < self.channels) : (i += 1) {
                self.data[stride + i] = try value.get_idx(i);
            }
        }

        /// get pixel data
        pub fn get_pixel(self: *Self, x: usize, y: usize) !TPixel(TData) {
            if (x > self.width or y > self.height) return error.OutOfBound;
            const stride = (x + self.width * y) * self.channels;
            const s = self.data[stride .. stride + self.channels];
            return TPixel(TData).from_slice(s);
        }

        /// write image data as PNM file
        pub fn writePPM(self: Self, allocator: *std.mem.Allocator, file_path: []const u8) !void {
            if (TData != u8) return error.UnsupportedDataType;

            const file = try std.fs.cwd().createFile(file_path, .{ .truncate = true });
            defer file.close();
            const w = file.writer();

            var line_buf = std.ArrayList(u8).init(allocator);
            defer line_buf.deinit();
            var buf_writer = line_buf.writer();

            try w.print("P3\n", .{});
            try w.print("{} {} {}\n", .{ self.width, self.height, 255 });

            var idx: usize = 0;
            while (idx < self.width * self.height * self.channels) : (idx += self.channels) {
                var ichan: usize = 0;
                while (ichan < self.channels) : (ichan += 1) {
                    try buf_writer.print("{} ", .{self.data[idx + ichan]});
                }
                if (idx % 8 == 0) {
                    _ = try buf_writer.write("\n");
                    _ = try w.write(line_buf.items);
                    line_buf.shrinkRetainingCapacity(0);
                }
            }
            // make sure remaining pixels are written to file
            if (line_buf.items.len > 0) {
                _ = try buf_writer.write("\n");
                _ = try w.write(line_buf.items);
            }
        }

        /// write image data to binary image file
        /// Currently, only PNG with 8-bit channel values is supported
        pub fn write(self: Self, allocator: *std.mem.Allocator, file_path: []const u8) !void {
            // check for supported image data
            if (TData != u8) return error.UnsupportedDataType;

            const c_width = @intCast(c_int, self.width);
            const c_height = @intCast(c_int, self.height);
            const c_chans = @intCast(c_int, self.channels);
            const c_stride = @intCast(c_int, self.width * self.channels);

            //const c_file_path: [file_path.len + 1:0]u8 = undefined;
            const c_file_path = try allocator.alloc(u8, file_path.len + 1);
            defer allocator.free(c_file_path);
            std.mem.copy(u8, c_file_path, file_path);
            c_file_path[c_file_path.len] = 0;

            //const res = stbImageWrite.stbi_write_png(@ptrCast([*:0]const u8, c_file_path), c_width, c_height, c_chans, @ptrCast(*c_void, &self.data), c_stride);
            const fname: [*:0]const u8 = "test.png";
            const res = stbImageWrite.stbi_write_png(fname, c_width, c_height, c_chans, self.data.ptr, c_stride);

            //if (res == 0) {
            //    return error.WriteError;
            //}
        }
    };
}

test "RGB(u8)" {
    var pix = RGB(u8){ .r = 128, .g = 255, .b = 12 };
    const pix_ary = [_]u8{ try pix.get_idx(0), try pix.get_idx(1), try pix.get_idx(2) };

    try testing.expect(pix.eql(RGB(u8){ .r = 128, .g = 255, .b = 12 }));
    try testing.expect(pix_ary.len == 3);
    try testing.expect(std.mem.eql(u8, &pix_ary, &[_]u8{ 128, 255, 12 }));
}

test "Mono(u8)" {
    var pix = Mono(u8){ .i = 128 };
    const pix_ary = [_]u8{try pix.get_idx(0)};

    try testing.expect(pix.eql(Mono(u8){ .i = 128 }));
    try testing.expect(pix_ary.len == 1);
    try testing.expect(std.mem.eql(u8, &pix_ary, &[_]u8{128}));
}

test "Image(RGB).init()" {
    var img = try Image(RGB, u8).init(testing.allocator, 640, 480);
    defer img.deinit();

    try testing.expect(img.data.len == 640 * 480 * 3);
}

test "Image(Mono).init()" {
    var img = try Image(Mono, u8).init(testing.allocator, 640, 480);
    defer img.deinit();

    try testing.expect(img.data.len == 640 * 480);
}

test "Image(RGB).set_pixel()" {
    var img = try Image(RGB, u8).init(testing.allocator, 3, 3);
    defer img.deinit();

    const RGB24 = RGB(u8);
    const pixel = [_]RGB24{
        RGB24{ .r = 0, .g = 0, .b = 0 },
        RGB24{ .r = 128, .g = 0, .b = 0 },
        RGB24{ .r = 255, .g = 0, .b = 0 },
        RGB24{ .r = 0, .g = 0, .b = 0 },
        RGB24{ .r = 0, .g = 128, .b = 0 },
        RGB24{ .r = 0, .g = 255, .b = 0 },
        RGB24{ .r = 0, .g = 0, .b = 0 },
        RGB24{ .r = 0, .g = 0, .b = 128 },
        RGB24{ .r = 0, .g = 0, .b = 255 },
    };

    for (pixel) |p, i| {
        const x = i % 3;
        const y = i / 3;
        try img.set_pixel(x, y, p);
    }

    for (pixel) |p, i| {
        const x = i % 3;
        const y = i / 3;
        const act = try img.get_pixel(x, y);
        try testing.expect(act.eql(p));
    }
}

test "Image(RGB).writePPM" {
    const test_allocator = std.testing.allocator;

    var img = try Image(RGB, u8).init(testing.allocator, 3, 3);
    defer img.deinit();
    const RGB24 = RGB(u8);
    var pixel = [_]RGB24{
        RGB24{ .r = 0, .g = 0, .b = 0 },
        RGB24{ .r = 128, .g = 0, .b = 0 },
        RGB24{ .r = 255, .g = 0, .b = 0 },
        RGB24{ .r = 0, .g = 0, .b = 0 },
        RGB24{ .r = 0, .g = 128, .b = 0 },
        RGB24{ .r = 0, .g = 255, .b = 0 },
        RGB24{ .r = 0, .g = 0, .b = 0 },
        RGB24{ .r = 0, .g = 0, .b = 128 },
        RGB24{ .r = 0, .g = 0, .b = 255 },
    };
    for (pixel) |p, i| {
        const x = i % 3;
        const y = i / 3;
        try img.set_pixel(x, y, p);
    }

    try img.writePPM(test_allocator, "test_image.ppm");
    defer std.fs.cwd().deleteFile("test_image.ppm") catch unreachable;

    const file = try std.fs.cwd().openFile("test_image.ppm", .{ .read = true });
    defer file.close();

    const contents = try file.reader().readAllAlloc(
        test_allocator,
        120,
    );
    defer test_allocator.free(contents);

    try testing.expect(std.mem.eql(u8, contents, "P3\n3 3 255\n0 0 0 \n128 0 0 255 0 0 0 0 0 0 128 0 0 255 0 0 0 0 0 0 128 0 0 255 \n"));
}

test "Image(RGB).write" {
    const test_allocator = std.testing.allocator;

    var img = try Image(RGB, u8).init(testing.allocator, 3, 3);
    defer img.deinit();
    const RGB24 = RGB(u8);
    var pixel = [_]RGB24{
        RGB24{ .r = 0, .g = 0, .b = 0 },
        RGB24{ .r = 128, .g = 0, .b = 0 },
        RGB24{ .r = 255, .g = 0, .b = 0 },
        RGB24{ .r = 0, .g = 0, .b = 0 },
        RGB24{ .r = 0, .g = 128, .b = 0 },
        RGB24{ .r = 0, .g = 255, .b = 0 },
        RGB24{ .r = 0, .g = 0, .b = 0 },
        RGB24{ .r = 0, .g = 0, .b = 128 },
        RGB24{ .r = 0, .g = 0, .b = 255 },
    };
    for (pixel) |p, i| {
        const x = i % 3;
        const y = i / 3;
        try img.set_pixel(x, y, p);
    }

    try img.write(test_allocator, "test_image.ppm");
    defer std.fs.cwd().deleteFile("test_image.ppm") catch unreachable;
}
