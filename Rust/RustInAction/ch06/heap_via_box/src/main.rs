use std::mem::drop;

fn main() {
    let a = Box::new(1);
    let b = Box::new(1);
    let c = Box::new(1);

    let result1 = *a + *b + *c;

    println!("result1: {}", result1);

    drop(a);

    let d = Box::new(2);

    let result2 = *b + *c + *d;

    println!("result2: {}", result2);
}
