// montecarlo.rs
// Some simple Monte-Carlo simulations in Rust
// Taken from: https://ggcarvalho.dev/posts/montecarlo
//
// vim: ft=rust sw=4 ts=4
//

extern crate rand;

//use rand::rngs::SmallRng::from_seed;
use rand::distributions::Uniform;
use rand::prelude::*;

/// Run a given number of simulations to estimate the value of Pi
#[allow(dead_code)]
pub fn simulate_pi(n: usize) -> f64 {
    // random generator
    let mut rng = SmallRng::seed_from_u64(1234);
    let unif = Uniform::new(0.0, 1.0);

    let mut count: usize = 0;
    for _ in (1..n).into_iter() {
        let x: f64 = 2.0 * rng.sample(unif) - 1.0;
        let y: f64 = 2.0 * rng.sample(unif) - 1.0;

        if x * x + y * y < 1.0 {
            count += 1;
        }
    }
    let pi_approx = 4.0 * (count as f64 / n as f64);

    pi_approx
}

// unit tests
#[cfg(test)]
mod test {
    use crate::montecarlo::simulate_pi;

    #[test]
    fn test_sim_pi() {
        let pi_approx = simulate_pi(100_000);

        println!("pi_approx: {}", pi_approx);
        assert!(f64::abs(pi_approx - std::f64::consts::PI) < 0.001);
    }
}
