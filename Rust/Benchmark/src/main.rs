// main.rs
// Main entry point for a Rust version
// of some (micro-) benchmarks
//
// vim: ft=rust sw=4 ts=4
//

extern crate image;
extern crate num;
extern crate num_complex;
extern crate rayon;
extern crate time;

use time::precise_time_ns;

// declare submodules
mod fibonacci;
mod mandelbrot;
mod perfect_number;
mod primes;

// a helper function to time closures
fn time_it<F, T>(fun: F) -> (T, u64)
where
    F: Fn() -> T,
{
    let tic = precise_time_ns();
    let res = fun();
    let toc = precise_time_ns();

    (res, (toc - tic) / 1_000_000)
}

fn main() {
    println!("Rust benchmarks");
    println!("===============");

    println!();

    println!("Fibonacci numbers:");
    println!("------------------");

    let (res, elap) = time_it(|| fibonacci::fib_naive(35));
    println!("fib_naive(35) = {}\tElapsed: {}ms", res, elap);

    let (res, elap) = time_it(|| fibonacci::fib(35));
    println!("fib(35) = {}\tElapsed: {}ms", res, elap);

    let (res, elap) = time_it(|| fibonacci::fib(1000));
    println!("fib(1000) = {}\tElapsed: {}ms", res, elap);

    println!();

    println!("Prime numbers:");
    println!("--------------");

    let (res, elap) = time_it(|| primes::find_primes(100_000));
    println!("find_primes(100_000): {:?} primes\tElapsed: {}ms", res.len(), elap);

    let (res, elap) = time_it(|| primes::find_primes_rayon(100_000));
    println!("find_primes_rayon(100_000): {:?} primes\tElapsed: {}ms", res.len(), elap);

    println!();

    println!("Perfect numbers:");
    println!("----------------");

    let (res, elap) = time_it(|| perfect_number::perfect_numbers(10000));
    println!("pn(10000) = {:?}\tElapsed: {}ms", res, elap);

    let (res, elap) = time_it(|| perfect_number::perfect_number_iter(4));
    println!("pn_iter(4) = {:?}\tElapsed: {}ms", res, elap);

    let (res, elap) = time_it(|| perfect_number::perfect_numbers_rayon(10000));
    println!("pn_rayon(10000) = {:?}\tElapsed: {}ms", res, elap);

    println!();

    println!("Mandelbrot set:");
    println!("--------------");

    let (res, elap) = time_it(|| mandelbrot::mandelbrot(640, 480, -0.5, 0.0, 4.0 / f64::from(640)));
    println!("mandelbrot(640, 480) done\tElapsed: {}ms", elap);
    let (_, elap) = time_it(|| res.save("./mandelbrot.png").unwrap());
    println!("mandelbrot(640, 480) written to PNG\tElapsed: {}ms", elap);

    let (res, elap) =
        time_it(|| mandelbrot::mandelbrot(1920, 1200, -0.5, 0.0, 4.0 / f64::from(1920)));
    println!("mandelbrot(1920, 1200) done\tElapsed: {}ms", elap);
    let (_, elap) = time_it(|| res.save("./mandelbrot.png").unwrap());
    println!("mandelbrot(1920, 1200) written to PNG\tElapsed: {}ms", elap);

    let _: Vec<()> = vec![1, 2, 4, 8, 16, 30, 60]
        .into_iter()
        .map(|i| {
            let (_res, elap) = time_it(|| {
                mandelbrot::mandelbrot_rayon(1920, 1200, -0.5, 0.0, 4.0 / f64::from(1920), i)
            });
            println!("mandelbrot_rayon(1920, 1200, {}) done\tElapsed: {}ms", i, elap);
        })
        .collect();

    let (_, elap) = time_it(|| res.save("./mandelbrot.png").unwrap());
    println!(
        "mandelbrot_rayon(1920, 1200) written to PNG\tElapsed: {}ms",
        elap
    );
    println!();

    println!("------------------");
    println!("Done!");
}
