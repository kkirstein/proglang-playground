// perfect_number.rs
// Calulate perfect numbers in Rust
//
// vim: ft=rust sw=4 ts=4
//

// predicate to check for a perfect number
pub fn is_perfect(n: u64) -> bool {
    let mut sum = 0;
    for i in (1..n) {
        if (n % i) == 0 { sum += i; }
    }

    sum == n
}

// generate a list of perfect numbers
//pub fn perfect_numbers(limit: u64) -> Vec<u64> {
//    let mut pn: Vec<u64> = Vec::new();
//
//    for i in (1..limit) {
//        if is_perfect(i) { pn.push(i); }
//    }
//
//    pn
//}

pub fn perfect_numbers(limit: u64) -> Vec<u64> {
    use std::iter::FromIterator;

    let pn: Vec<u64> = Vec::from_iter(
        (1..limit).filter(|&i| is_perfect(i)));

    pn
}

pub fn perfect_number_iter(count: usize) -> Vec<u64> {
    use std::iter::FromIterator;
    
    let pn: Vec<u64> = Vec::from_iter(PerfectNumber::new().take(count));

    pn
}

// Iterator for perfect numbers
pub struct PerfectNumber {
    current: u64
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
            if is_perfect(self.current) { return Some(self.current); }
        }
    }
}
            
