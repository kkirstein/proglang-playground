// check perfect number calculation

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
