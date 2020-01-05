
extern crate rand;
use rand::Rng;

fn one_in(n: f64) -> bool {
    rand::thread_rng().gen_bool(n)
}

struct File {
    name: String,

}
fn main() {
    println!("Hello, world!");
}
