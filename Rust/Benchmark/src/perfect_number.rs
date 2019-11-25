// perfect_number.rs
// Calulate perfect numbers in Rust
//
// vim: ft=rust sw=4 ts=4
//

// predicate to check for a perfect number
pub fn is_perfect(n: u64) -> bool {
    let mut sum = 0;
    for i in 1..n {
        if (n % i) == 0 {
            sum += i;
        }
    }

    sum == n
}
pub fn is_perfect_opt(n: u64) -> Option<u64> {
    if is_perfect(n) {
        Some(n)
    } else {
        None
    }
}

// calculate all perfect numbers up to given limit
pub fn perfect_numbers(limit: u64) -> Vec<u64> {
    use std::iter::FromIterator;

    let pn: Vec<u64> = Vec::from_iter((1..limit).filter(|&i| is_perfect(i)));

    pn
}
pub fn perfect_numbers_rayon(limit: u64) -> Vec<u64> {
    use rayon::prelude::{IntoParallelIterator, ParallelIterator};

    let res: Vec<_> = (1..limit)
        .into_par_iter()
        .map(is_perfect_opt)
        .filter_map(|i| i)
        .collect();

    res
}

// use an iterator for perfect numbers
pub fn perfect_number_iter(count: usize) -> Vec<u64> {
    use std::iter::FromIterator;

    let pn: Vec<u64> = Vec::from_iter(PerfectNumber::new().take(count));

    pn
}

// Iterator for perfect numbers
pub struct PerfectNumber {
    current: u64,
}

impl PerfectNumber {
    pub fn new() -> PerfectNumber {
        PerfectNumber { current: 0 }
    }
}

impl Iterator for PerfectNumber {
    type Item = u64;

    fn next(&mut self) -> Option<u64> {
        loop {
            self.current += 1;
            if is_perfect(self.current) {
                return Some(self.current);
            }
        }
    }
}

// unit tests
#[cfg(test)]
mod test {
    use crate::perfect_number::*;

    #[test]
    fn test_is_perfect() {
        assert_eq!(is_perfect(1), false);
        assert_eq!(is_perfect(2), false);
        assert_eq!(is_perfect(6), true);
        assert_eq!(is_perfect(7), false);
        assert_eq!(is_perfect(27), false);
        assert_eq!(is_perfect(28), true);
    }

    #[test]
    fn test_is_perfect_opt() {
        assert_eq!(is_perfect_opt(1), None);
        assert_eq!(is_perfect_opt(2), None);
        assert_eq!(is_perfect_opt(6), Some(6));
        assert_eq!(is_perfect_opt(7), None);
        assert_eq!(is_perfect_opt(27), None);
        assert_eq!(is_perfect_opt(28), Some(28));
    }

    #[test]
    fn test_perfect_numbers() {
        assert_eq!(perfect_numbers(100), vec!(6, 28));
        assert_eq!(perfect_number_iter(2), vec!(6, 28));
        assert_eq!(perfect_numbers_rayon(100), vec!(6, 28));
    }
}
