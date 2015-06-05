// main.rs
// Main entry point for a Rust version
// of some (micro-) benchmarks
//
// vim: ft=rust sw=4 ts=4
//

// declare submodules
mod fibonacci;

fn main() {

    println!("Rust benchmarks");
    println!("===============");

    println!("");

    println!("Fibonacci numbers:");
    println!("------------------");

    let fib_naive_35 = fibonacci::fib_naive(35);
    println!("fib_naive(35) = {}", fib_naive_35);

    let fib_35 = fibonacci::fib(35);
    println!("fib(35) = {}", fib_35);

//    let fib_1000 = fibonacci::fib(1000);
//    println!("fib(1000) = {}", fib_1000);

    println!("");

    println!("Perfect numbers:");
    println!("----------------");

    println!("");

    println!("Mandelbrot set:");
    println!("--------------");

    println!("");

    println!("------------------");
    println!("Done!");
}
