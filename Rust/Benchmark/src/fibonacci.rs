// fibonacci.rs
// Calulate Fibonacci numbers in Rust
//
// vim: ft=rust sw=4 ts=4
//


use num::bigint::BigInt;
use num::{One, Zero};

// a naive recursive implementation
pub fn fib_naive(n: u64) -> u64 {
    if n < 2 {
        n
    } else {
        fib_naive(n - 1) + fib_naive(n - 2)
    }
}

// optimzed tail-recursive implmentation
pub fn fib(n: u64) -> BigInt {
    fib_loop(n, BigInt::zero(), BigInt::one())
}
fn fib_loop(n: u64, a: BigInt, b: BigInt) -> BigInt {
    if n == 0 {
        return a;
    }
    return fib_loop(n - 1, b.clone(), a + b);
}
