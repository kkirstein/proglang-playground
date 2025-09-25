// montecarlo.rs
// Some simple Monte-Carlo simulations in Rust
// Taken from: https://ggcarvalho.dev/posts/montecarlo
//
// vim: ft=rust sw=4 ts=4
//

extern crate rand;

//use rand::rngs::SmallRng::from_seed;
use rand::distr::Uniform;
use rand::prelude::*;

use rayon::prelude::*;

/// Run a given number of simulations to estimate the value of Pi
pub fn simulate_pi(n: usize) -> Result<f64, Box<dyn std::error::Error>> {
    // random generator
    let mut rng = SmallRng::seed_from_u64(1234);
    let unif = Uniform::new(0.0, 1.0)?;

    let count = (1..n)
        .into_iter()
        .filter(|_| {
            let x: f64 = 2.0 * rng.sample(unif) - 1.0;
            let y: f64 = 2.0 * rng.sample(unif) - 1.0;

            x * x + y * y < 1.0
        })
        .count();

    let pi_approx = 4.0 * (count as f64 / n as f64);

    Ok(pi_approx)
}

/// Run a given number of simulations to estimate the value of Pi
/// Parallel version using rayon::ParallelIterator
pub fn simulate_pi_rayon(n: usize) -> Result<f64, Box<dyn std::error::Error>> {
    // random generator
    //let mut rng = SmallRng::seed_from_u64(1234);
    let unif = Uniform::new(0.0, 1.0)?;
    //let mut thr_rng = ThreadRng::default();

    let count = (1..n)
        .into_par_iter()
        .filter(|_| {
            let mut rng = rand::rng();
            let x: f64 = 2.0 * rng.sample(unif) - 1.0;
            let y: f64 = 2.0 * rng.sample(unif) - 1.0;

            x * x + y * y < 1.0
        })
        .count();

    let pi_approx = 4.0 * (count as f64 / n as f64);

    Ok(pi_approx)
}

/// Run a given number of simulations to estimate the value of e (2.71..)
pub fn simulate_e(n: usize) -> Result<f64, Box<dyn std::error::Error>> {
    // random generator
    let mut rng = SmallRng::seed_from_u64(1234);
    let unif = Uniform::new(0.0, 1.0)?;

    let counts = (1..n).into_iter().map(|_| {
        let mut sum = 0f64;
        let mut sum_count: usize = 0;
        while sum < 1.0 {
            sum += rng.sample(unif);
            sum_count += 1;
        }
        sum_count
    });

    let e_approx = counts.sum::<usize>() as f64 / n as f64;

    Ok(e_approx)
}

/// Run a given number of simulations to estimate the value of e (2.71..)
/// Run a given number of simulations to estimate the value of e (2.71..)
pub fn simulate_e_rayon(n: usize) -> Result<f64, Box<dyn std::error::Error>> {
    // random generator
    let unif = Uniform::new(0.0, 1.0)?;

    let counts = (1..n).into_par_iter().map(|_| {
        let mut rng = rand::rng();
        let mut sum = 0f64;
        let mut sum_count: usize = 0;
        while sum < 1.0 {
            sum += rng.sample(unif);
            sum_count += 1;
        }
        sum_count
    });

    let e_approx = counts.sum::<usize>() as f64 / n as f64;

    Ok(e_approx)
}

// unit tests
#[cfg(test)]
mod test {
    extern crate float_cmp;
    use crate::montecarlo::{simulate_e, simulate_e_rayon, simulate_pi, simulate_pi_rayon};
    use float_cmp::approx_eq;

    #[test]
    fn test_sim_pi() {
        let pi_approx = simulate_pi(1_000_000);

        assert!(approx_eq!(
            f64,
            pi_approx.unwrap(),
            std::f64::consts::PI,
            epsilon = 0.01
        ));
    }

    #[test]
    fn test_sim_pi_rayon() {
        let pi_approx = simulate_pi_rayon(100_000);

        assert!(approx_eq!(
            f64,
            pi_approx.unwrap(),
            std::f64::consts::PI,
            epsilon = 0.01
        ));
    }

    #[test]
    fn test_sim_e() {
        let e_approx = simulate_e(100_000);

        assert!(approx_eq!(
            f64,
            e_approx.unwrap(),
            std::f64::consts::E,
            epsilon = 0.001
        ));
    }

    #[test]
    fn test_sim_e_rayon() {
        let e_approx = simulate_e_rayon(100_000);

        assert!(approx_eq!(
            f64,
            e_approx.unwrap(),
            std::f64::consts::E,
            epsilon = 0.01
        ));
    }
}
