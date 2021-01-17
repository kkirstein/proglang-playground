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

            pub const num_channel = 3;
        };
    } else unreachable;
}

/// Image struct, paramterized with pixel and storage types
pub fn Image(comptime TPixel: type, comptime TData: type) type {
    // TODO: assert valid types
    return struct {
        const Self = @This();

        /// Pixel type
        const TPixel = TPixel;
        //const num_channel = num_channel;
        const num_channel = 3;

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
                .channels = num_channel,
                .data = try allocator.alloc(TData, width * height * num_channel),
            };
        }

        /// free allocated memory
        pub fn deinit(self: Self) void {
            self.allocator.free(self.data);
        }
    };
}

test "Image(RGB).init()" {
    var img = try Image(RGB(u8), u8).init(testing.allocator, 640, 480);
    defer img.deinit();

    testing.expect(img.data.len == 640 * 480 * 3);
}
