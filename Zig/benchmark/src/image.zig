// vim: set ft=zig sw=4 ts=4:

/// image.zig
/// Module image offers structs and functions for pixel
/// and image data.
const std = @import("std");
const Allocator = std.mem.Allocator;

const testing = std.testing;

/// RGB values for a single pixel
pub fn RGB(comptime T: type) type {
    if (T == u8 or T == f32) {
        return struct {
            const Self = @This();

            r: T,
            g: T,
            b: T,

            /// generate a slice of pixel values
            pub fn to_slice(self: Self) []T {
                const s = &[_]T{ self.r, self.g, self.b };
                return s[0..];
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

            /// generate a slice of pixel values
            pub fn to_slice(self: Self) []T {
                const s = []T{i};
                return s[0..];
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
    // TODO: assert valid types
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
            return Self{
                .allocator = allocator,
                .width = width,
                .height = height,
                .channels = chans,
                .data = try allocator.alloc(TData, width * height * chans),
            };
        }

        /// free allocated memory
        pub fn deinit(self: Self) void {
            self.allocator.free(self.data);
        }

        /// set pixel value
        pub fn set_pixel(self: Self, x: usize, y: usize, value: TPixel(TData)) !void {
            if (x > self.width or y > self.height) return error.OutOfBound;
            const stride = (x + self.width * y) * self.channels;
            const values = value.to_slice();
            var i: usize = 0;
            while (i < self.channels) : (i += 1) {
                self.data[stride + i] = values[i];
            }
        }

        /// get pixel data
        pub fn get_pixel(self: Self, x: usize, y: usize) !TPixel(TData) {
            if (x > self.width or y > self.height) return error.OutOfBound;
            const stride = (x + self.width * y) * self.channels;
            const s = self.data[stride .. stride + self.channels];
            return TPixel(TData).from_slice(s);
        }
    };
}

test "Image(RGB).init()" {
    var img = try Image(RGB, u8).init(testing.allocator, 640, 480);
    defer img.deinit();

    testing.expect(img.data.len == 640 * 480 * 3);
}

test "Image(Mono).init()" {
    var img = try Image(Mono, u8).init(testing.allocator, 640, 480);
    defer img.deinit();

    testing.expect(img.data.len == 640 * 480);
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
        testing.expect(act.eql(p));
    }
}
