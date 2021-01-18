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
            r: T,
            g: T,
            b: T,

            /// generate a slice of pixel values
            pub fn to_slice(self: Self) []T {
                const s = []T{ r, g, b };
                return s[0..];
            }

            pub fn from_slice(s: []T) Self {
                if (s.len != 3) return error.InvalidLength else return Self{ .r = s[0], .g = s[1], .b = s[2] };
            }
        };
    } else unreachable;
}

/// Mono value for a single pixel
pub fn Mono(comptime T: type) type {
    if (T == u8 or T == f32) {
        return struct {
            i: T,

            /// generate a slice of pixel values
            pub fn to_slice(self: Self) []T {
                const s = []T{i};
                return s[0..];
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
        const TPixel = TPixel(TData);
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
        pub fn set_pixel(self.Self, w: usize, h: usize, value: TPixel) !void {
            // TODO: check coordinates
            if (w > self.width or h > self.height) return error.OutOfBound;
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
