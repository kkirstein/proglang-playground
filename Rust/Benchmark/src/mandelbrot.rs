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

// convert pixel value to RGB color
fn to_vec(n: u8) -> Vec<u8> {
    vec![15 * (n % 15), 32 * (n % 7), 8 * (n % 31)]
}

// Calculate Mandelbrot set for given image size
pub fn mandelbrot(
    width: u32,
    height: u32,
    center_x: f64,
    center_y: f64,
    pixel_size: f64,
) -> ImageBuffer<Rgb<u8>, Vec<u8>> {
    let x_offset = center_x - 0.5 * pixel_size * f64::from(width);
    let y_offset = center_y + 0.5 * pixel_size * f64::from(height);

    ImageBuffer::from_fn(width, height, |x, y| {
        to_rgb(pixel_value(
            f64::from(x) * pixel_size + x_offset,
            f64::from(y) * pixel_size - y_offset,
        ))
    })
}

// Calculate Mandelbrot set with multithreading
pub fn mandelbrot_rayon(
    width: u32,
    height: u32,
    center_x: f64,
    center_y: f64,
    pixel_size: f64,
) -> ImageBuffer<Rgb<u8>, Vec<u8>> {
    use rayon::prelude::*;

    let x_offset = center_x - 0.5 * pixel_size * f64::from(width);
    let y_offset = center_y + 0.5 * pixel_size * f64::from(height);

    let buf: Vec<_> = (0..width * height)
        .into_par_iter()
        .map(|i| {
            let x = i % width;
            let y = i / width;
            to_vec(pixel_value(
                f64::from(x) * pixel_size + x_offset,
                f64::from(y) * pixel_size - y_offset,
            ))
        })
        .flatten()
        .collect();

    let img: ImageBuffer<Rgb<u8>, Vec<u8>> =
        image::ImageBuffer::from_vec(width, height, buf).unwrap();
    img
}
#[allow(dead_code)]
pub fn mandelbrot_rayon2(
    width: u32,
    height: u32,
    //center_x: f64,
    //center_y: f64,
    //pixel_size: f64,
) -> ImageBuffer<Rgb<u8>, Vec<u8>> {
    ImageBuffer::new(width, height)
}
