// main.rs
// Main entry point for a guessing game
//
// taken from the rust-lang tutorial:
// http://doc.rust-lang.org/stable/book/guessing-game.html
//

use std::io;

fn main() {
    println!("Guess the number!");

    println!("Please input your guess.");

    let mut guess = String::new();

    io::stdin().read_line(&mut guess)
        .ok()
        .expect("Failed to read line");

    println!("You guessed: {}", guess);
}

