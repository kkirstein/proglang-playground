/// memscan
/// A tool to scan its own memory content

static GLOBAL: i32 = 1000;

fn noop() -> *const i32 {
    let noop_local = 12345;
    &noop_local
}

fn main() {
    let local_str = "a";
    let local_int = 123;
    let boxed_str = Box::new("b");
    let boxed_int = Box::new(789);
    let fn_int = noop();

    println!("GLOBAL:    {:p}", &GLOBAL);
    println!("local_str: {:p}", local_str);
    println!("local_int: {:p}", &local_int);
    println!("boxed_str: {:p}", Box::into_raw(boxed_str));
    println!("boxed_int: {:p}", Box::into_raw(boxed_int));
    println!("fn_int:    {:p}", fn_int);

    //let mut n_nonzero = 0;

    //for i in 1..10_000 {
    //    let ptr = i as *const u8;
    //    let byte_at_addr = unsafe { *ptr };

    //    if byte_at_addr != 0 {
    //        n_nonzero += 1;
    //    }
    //}

    //println!("non-zero bytes in memory: {}", n_nonzero);
}
