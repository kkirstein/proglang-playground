use std::collections::HashMap;
use std::hash::Hash;
use std::thread;
use std::time::Duration;

// struct to cache results of expensive calculations
struct Cacher<T, U, V>
where
    T: Fn(U) -> V,
    U: Eq + Hash + Copy,
    V: Copy,
{
    calculation: T,
    values: HashMap<U, V>,
}

impl<T, U, V> Cacher<T, U, V>
where
    T: Fn(U) -> V,
    U: Eq + Hash + Copy,
    V: Copy,
{
    fn new(calculation: T) -> Cacher<T, U, V> {
        Cacher {
            calculation,
            values: HashMap::new(),
        }
    }

    fn value(&mut self, arg: U) ->  V {
        match self.values.get(&arg) {
            Some(v) => v.to_owned(),
            None => {
                let v = (self.calculation)(arg);
                self.values.insert(arg, v);
                v
            }
        }
    }
}

fn generate_workout(intensity: u32, random_number: u32) {
    let mut expensive_result = Cacher::new(|num| {
        println!("calculating slowly...");
        thread::sleep(Duration::from_secs(2));
        num
    });

    if intensity < 25 {
        println!("Today, do {} pushups!", expensive_result.value(intensity));
        println!("Next, do {} situps!", expensive_result.value(intensity));
    } else {
        if random_number == 3 {
            println!("Take a break today! Remember to stay hydrated!");
        } else {
            println!(
                "Today, run for {} minutes!",
                expensive_result.value(intensity)
            );
        }
    }
}

fn main() {
    let simulated_user_specified_value = 10;
    let simulated_randon_number = 7;

    generate_workout(simulated_user_specified_value, simulated_randon_number);
}

#[test]
fn call_with_different_values() {
    let mut c = Cacher::new(|a| a);

    let v1 = c.value(1);
    let v2 = c.value(2);

    assert_ne!(v2, v1);
    assert_eq!(v2, 2);
}

#[test]
fn call_with_different_types() {
    let mut c1 = Cacher::new(|a| a);
    let mut c2 = Cacher::new(|a| a);

    let v1 = c1.value(1);
    let v2 = c2.value("Test");

    assert_eq!(v1, 1);
    assert_eq!(v2, "Test");
}
