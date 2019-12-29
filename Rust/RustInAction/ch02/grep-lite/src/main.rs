
extern crate regex;

use regex::Regex;

fn main() {
    let search_term = "picture";
    let re = Regex::new(search_term).unwrap();

    let quote = "Every face, every shop, bedroom window, public-house, and
dark square is a picture feverishly turned--in search of what?
It is the same with books. What do we seek through millions of pages?"; //<1>

    for line in quote.lines() {
        match re.find(line) {
            Some(_) => println!("{}", line),
            None    => (),
        }
    }

    // functional approach
    //quote.lines().filter(|l| re.is_match(l)).map(|m| println!("{}", m));
}
