// main.rs
// Main entry point for a Rust version
// of some (micro-) benchmarks
//
// vim: ft=rust sw=4 ts=4
//

extern crate time;
extern crate num;

use time::precise_time_ns;

// declare submodules
mod fibonacci;
mod perfect_number;


// a helper function to time closures
fn time_it<F, T>(fun: F) -> (T, u64) where F: Fn() -> T {
    let tic = precise_time_ns();
    let res = fun();
    let toc = precise_time_ns();

    (res, (toc-tic)/1000000)
}

fn main() {

    println!("Rust benchmarks");
    println!("===============");

    println!("");

    println!("Fibonacci numbers:");
    println!("------------------");

    let (res, elap) = time_it(|| fibonacci::fib_naive(35));
    println!("fib_naive(35) = {}\tElapsed: {}ms", res, elap);

    let (res, elap) = time_it(|| fibonacci::fib(35));
    println!("fib(35) = {}\tElapsed: {}ms", res, elap);

    let (res, elap) = time_it(|| fibonacci::fib(1000));
    println!("fib(1000) = {}\tElapsed: {}ms", res, elap);

    println!("");

    println!("Perfect numbers:");
    println!("----------------");

    let (res, elap) = time_it(|| perfect_number::perfect_numbers(10000));
    println!("pn(10000) = {:?}\tElapsed: {}ms", res, elap);

    let (res, elap) = time_it(|| perfect_number::perfect_number_iter(4));
    println!("pn_iter(4) = {:?}\tElapsed: {}ms", res, elap);

    println!("");

    println!("Mandelbrot set:");
    println!("--------------");

    println!("");

    println!("------------------");
    println!("Done!");
}
