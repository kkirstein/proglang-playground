#![feature(plugin)]
#![plugin(rocket_contrib)]

extern crate chrono;
extern crate rocket;
extern crate rocket_contrib;
extern crate serde;

#[macro_use]
extern crate serde_derive;

use chrono::prelude::*;
use rocket_contrib::json::*;

#[derive(Serialize)]
struct Timestamp {
    time: String,
}

#[get("/")]
fn index() -> &'static str {
    "Hello World!"
}

#[get("/time")]
fn time_now() -> Json<Timestamp> {
    let now: DateTime<Utc> = Utc::now();
    let timestamp = Timestamp {
        time: now.to_rfc3339(),
    };
    Json(timestamp)
}

fn main() {
    rocket::ignite().mount("/", [index, time_now]).launch();
}
