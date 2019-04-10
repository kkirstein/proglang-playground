// main.rs
// Main entry point for a dining philosophers,
// a concurrency problem.
//
// taken from the rust-lang tutorial:
// https://doc.rust-lang.org/stable/book/dining-philosophers.html
//
// vim: ft=rust sw=4 ts=4

use std::sync::{Arc, Mutex};
use std::thread;
use std::time::Duration;

// a philosopher struct
struct Philosopher {
    name: String,
    left: usize,
    right: usize,
}

impl Philosopher {
    fn new(name: &str, left: usize, right: usize) -> Philosopher {
        Philosopher {
            name: name.to_string(),
            left,
            right,
        }
    }

    fn eat(&self, table: &Table) {
        let _left = table.forks[self.left].lock().unwrap();
        let _right = table.forks[self.right].lock().unwrap();

        println!("{} has started eating.", self.name);

        thread::sleep(Duration::from_millis(1000));

        println!("{} has finished eating.", self.name);
    }

    fn mult_eat(&self, table: &Table, pause: u32, repeat: u32) {
        for x in 0..repeat {
            thread::sleep(Duration::from_millis(u64::from(pause)));
            println!("{} went to table for {}. time.", self.name, (x + 1));
            self.eat(table);
        }
    }
}

struct Table {
    forks: Vec<Mutex<()>>,
}

fn main() {
    let table = Arc::new(Table {
        forks: vec![
            Mutex::new(()),
            Mutex::new(()),
            Mutex::new(()),
            Mutex::new(()),
            Mutex::new(()),
        ],
    });

    let philosophers = vec![
        Philosopher::new("Baruch Spinoza", 0, 1),
        Philosopher::new("Gilles Deleuze", 1, 2),
        Philosopher::new("Karl Marx", 2, 3),
        Philosopher::new("Friedich Nietzsche", 3, 4),
        Philosopher::new("Michel Foucault", 0, 4), // swap "hands" to prevent deadlock
    ];

    let handles: Vec<_> = philosophers
        .into_iter()
        .map(|p| {
            let table = table.clone();

            thread::spawn(move || {
                //p.eat(&table);
                p.mult_eat(&table, 2000, 3);
            })
        })
        .collect();

    for h in handles {
        h.join().unwrap();
    }
}
