// main.rs
// Main entry point for a dining philosophers,
// a concurrency problem.
//
// taken from the rust-lang tutorial:
// https://doc.rust-lang.org/stable/book/dining-philosophers.html
//
// vim: ft=rust sw=4 ts=4

// a philosopher struct
struct Philosopher {
	name: String,
}

impl Philosopher {
	fn new(name: &str) -> Philosopher {
		Philosopher {
			name: name.to_string(),
		}
	}
}


fn main() {
	let p1 = Philosopher::new("Baruch Spinoza");
	let p2 = Philosopher::new("Gilles Deleuze"); 
	let p3 = Philosopher::new("Karl Marx"); 
	let p4 = Philosopher::new("Friedich Nietzsche"); 
	let p5 = Philosopher::new("Michel Foucault"); 
}

