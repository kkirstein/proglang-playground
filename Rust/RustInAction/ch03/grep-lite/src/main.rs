extern crate clap;
extern crate regex;

use clap::{App, Arg};
use regex::Regex;
use std::fs::File;
//use std::io;
use std::io::prelude::*;
use std::io::BufReader;

fn process_lines<T: BufRead>(reader: T, re: Regex) {
    for line_ in reader.lines() {
        //let line = line_.unwrap();
        match line_ {
            Ok(line) => match re.find(&line) {
                Some(_) => println!("{}", line),
                None => (),
            },
            Err(e) => panic!("{}", e),
        }
    }
}

fn main() {
    let args = App::new("grep-lite")
        .version("0.1")
        .about("searches for patterns")
        .arg(
            Arg::with_name("pattern")
                .help("The pattern to search for")
                .takes_value(true)
                .required(true),
        )
        .arg(
            Arg::with_name("input")
                .help("File to search")
                .takes_value(true)
                .required(false),
        )
        .get_matches();

    let pattern = args.value_of("pattern").unwrap();
    let re = Regex::new(pattern).unwrap();

    let input = args.value_of("input").unwrap_or("-");

    if input == "-" {
        let stdin = std::io::stdin();
        let reader = stdin.lock();
        process_lines(reader, re);
    } else {
        let f = File::open(input).unwrap();
        let reader = BufReader::new(f);
        process_lines(reader, re);
    }

    // functional approach
    //quote.lines().filter(|l| re.is_match(l)).map(|m| println!("{}", m));
}
