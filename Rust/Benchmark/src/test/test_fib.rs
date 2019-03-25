use crate::fibonacci::{fib, fib_naive};

// unit tests for Fibonacci numbers
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
