// check prime number checking

use crate::primes::*;

#[test]
fn test_is_prime() {
    assert_eq!(is_prime(0), false);
    assert_eq!(is_prime(1), false);
    assert_eq!(is_prime(2), true);
    assert_eq!(is_prime(3), true);
    assert_eq!(is_prime(4), false);
    assert_eq!(is_prime(5), true);
    assert_eq!(is_prime(6), false);
    assert_eq!(is_prime(7), true);
}

#[test]
fn test_find_primes() {
    assert_eq!(find_primes(19), vec! {2, 3, 5, 7, 11, 13, 17});
    assert_eq!(find_primes(20), vec! {2, 3, 5, 7, 11, 13, 17, 19});
}
