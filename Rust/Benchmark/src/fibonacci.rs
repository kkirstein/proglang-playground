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
    fib_loop(n - 1, b.clone(), a + b)
}

// unit tests
#[cfg(test)]
mod test {
    use crate::fibonacci::{fib, fib_naive};

    #[test]
    fn test_fib_naive() {
        assert_eq!(fib_naive(0), 0);
        assert_eq!(fib_naive(1), 1);
        assert_eq!(fib_naive(2), 1);
        assert_eq!(fib_naive(3), 2);
        assert_eq!(fib_naive(4), 3);
        assert_eq!(fib_naive(10), 55);
        assert_eq!(fib_naive(20), 6765);
    }

    #[test]
    fn test_fib() {
        use num::bigint::ToBigInt;
        assert_eq!(fib(0), 0.to_bigint().unwrap());
        assert_eq!(fib(1), 1.to_bigint().unwrap());
        assert_eq!(fib(2), 1.to_bigint().unwrap());
        assert_eq!(fib(3), 2.to_bigint().unwrap());
        assert_eq!(fib(4), 3.to_bigint().unwrap());
        assert_eq!(fib(10), 55.to_bigint().unwrap());
        assert_eq!(fib(20), 6765.to_bigint().unwrap());
    }
}
