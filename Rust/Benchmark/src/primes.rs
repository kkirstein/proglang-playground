// primes.rs
// Calulate prime numbers in Rust
//
// vim: ft=rust sw=4 ts=4
//

// predicate to check for a prime number
pub fn is_prime(n: u64) -> bool {
    if n < 2 {
        false
    } else {
        let limit = (f32::sqrt(n as f32)) as u64;
        for i in 2..limit + 1 {
            if n % i == 0 {
                return false;
            }
        }
        true
    }
}

// find all primes below [limit]
pub fn find_primes(limit: u64) -> Vec<u64> {
    (1..limit).filter(|i| is_prime(*i)).collect()
}

// unit tests
#[cfg(test)]
mod test {
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
}
