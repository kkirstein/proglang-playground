// lib.rs
// Example library to be embedded into other programming languages
//
// taken from the rust-lang tutorial:
// https://doc.rust-lang.org/stable/book/rust-inside-other-languages.html
//
// vim: ft=rust sw=4 ts=4
//

use std::thread;

#[no_mangle]
pub extern fn process() {
    let handles: Vec<_> = (0..10).map( |_| {
        thread::spawn(|| {
            let mut _x = 0;
            for _ in (0..5_000_001) {
                _x += 1
            }
        })
    }).collect();

    for h in handles {
        h.join().ok().expect("Could not join a thread!");
    }
}


#[test]
fn it_works() {
}
