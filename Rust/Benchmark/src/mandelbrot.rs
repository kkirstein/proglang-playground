// mandelbrot.rs
// Calulate Mandelbrot sets in Rust
//
// vim: ft=rust sw=4 ts=4
//

use image;
use image::{ImageBuffer, Rgb};
use num_complex::Complex;

// global constant for Mandelbrot set
const R_MAX: f64 = 2.0;
const N_MAX: u8 = 255;

// calculate pixel value
fn pixel_value(x: f64, y: f64) -> u8 {
    let z0 = Complex::new(x, y);
    let mut z = Complex::new(x, y);
    let mut n = N_MAX;

    while z.norm() <= R_MAX && n > 0 {
        z = z * z + z0;
        n -= 1;
    }

    // return final "index"
    n
}

// convert pixel value to RGB color
fn to_rgb(n: u8) -> image::Rgb<u8> {
    image::Rgb([15 * (n % 15), 32 * (n % 7), 8 * (n % 31)])
}

// Calculate Mandelbrot set for given image size
pub fn mandelbrot(
    width: u32,
    height: u32,
    center_x: f64,
    center_y: f64,
    pixel_size: f64,
) -> ImageBuffer<Rgb<u8>, Vec<u8>> {
    let x_offset = center_x - 0.5 * pixel_size * width as f64;
    let y_offset = center_y + 0.5 * pixel_size * height as f64;

    ImageBuffer::from_fn(width, height, |x, y| {
        to_rgb(pixel_value(
            x as f64 * pixel_size + x_offset,
            y as f64 * pixel_size - y_offset,
        ))
    })
}
