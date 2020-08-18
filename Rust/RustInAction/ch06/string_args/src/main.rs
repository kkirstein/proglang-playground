// use genric function args for strings
fn is_strong_bad(password: String) -> bool {
    password.len() > 6
}

fn is_strong_generic<T: AsRef<str>>(password: T) -> bool {
    password.as_ref().len() > 6
}

fn is_strong_implicit<T: Into<String>>(password: T) -> bool {
   password.into().len() > 6 
}
fn main() {
    let pw = "qwertz";
    let _ = is_strong_bad(pw.to_owned());
    let _ = is_strong_generic(pw.to_owned());
    let _ = is_strong_generic(pw);
    let _ = is_strong_implicit(pw.to_owned());
    let _ = is_strong_implicit(pw);

    println!("Hello, world!");
}
