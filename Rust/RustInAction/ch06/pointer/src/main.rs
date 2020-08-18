use std::mem::size_of;

// some data
static B: [u8; 10] = [99, 97, 114, 114, 121, 116, 111, 119, 101, 108];
static C: [u8; 11] = [116, 104, 97, 110, 107, 115, 102, 105, 115, 104, 0];

// print_info
fn print_info_ptr<T>(desc: &str, x: T)
where
    T: std::fmt::Pointer + std::fmt::Debug,
{
    println!("{}:", desc);
    println!(" location:  {:p}", &x);
    println!(" size:      {:?} bytes", size_of::<T>());
    println!(" points to: {:p}", x);
}

fn print_info<T: std::fmt::Debug>(desc: &str, x: T) {
    println!("{}:", desc);
    println!(" location:  {:p}", &x);
    println!(" size:      {:?} bytes", size_of::<T>());
    println!(" value:     {:?}", x);
}

fn main() {
    // introduction
    let a = 42;
    let b = &B;
    let c = Box::new(C);

    print_info("a (an unsigned integer)", a);
    println!();

    print_info_ptr("b (a reference to B)", b);
    println!();

    print_info_ptr("c (a 'box' for C):", c);
    println!();

    print_info("B (an array of 10 bytes)", B);
    println!();

    print_info("C (an array of 11 bytes)", C);

    // raw pointers
    println!("");
    println!("raw pointers:");
    println!("-------------");

    let a: i64 = 42;
    let a_ptr = &a as *const i64;
    let a_addr: usize = unsafe { std::mem::transmute(a_ptr) };
    println!("a: {} ({:p}...0x{:x})", a, a_ptr, a_addr + 7);
}
