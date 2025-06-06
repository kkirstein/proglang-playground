extern crate kernel32;
/// meminfo
///
/// A tool to show memory content of processes
///
extern crate winapi;

use winapi::{
    DWORD, HANDLE, LPSYSTEM_INFO, LPVOID, MEMORY_BASIC_INFORMATION, PVOID, SIZE_T, SYSTEM_INFO,
};

fn main() {
    let this_pid: DWORD;
    let this_proc: HANDLE;
    let min_app_addr: LPVOID;
    let max_app_addr: LPVOID;

    let mut base_addr: PVOID;
    let mut proc_info: SYSTEM_INFO;
    let mut mem_info: MEMORY_BASIC_INFORMATION;

    const MEM_SIZE: usize = std::mem::size_of::<MEMORY_BASIC_INFORMATION>();

    // init mutable values
    unsafe {
        base_addr = std::mem::zeroed();
        proc_info = std::mem::zeroed();
        mem_info = std::mem::zeroed();
    }

    // get current process
    unsafe {
        this_pid = kernel32::GetCurrentProcessId();
        this_proc = kernel32::GetCurrentProcess();
        kernel32::GetSystemInfo(&mut proc_info as LPSYSTEM_INFO);
    }

    min_app_addr = proc_info.lpMinimumApplicationAddress;
    max_app_addr = proc_info.lpMaximumApplicationAddress;

    println!("{:?} @ {:p}", this_pid, this_proc);
    println!("{:#?}", proc_info);
    println!("min: {:p}, max: {:p}", min_app_addr, max_app_addr);

    // scan thu process memory space
    loop {
        let rc: SIZE_T = unsafe {
            kernel32::VirtualQueryEx(this_proc, base_addr, &mut mem_info, MEM_SIZE as SIZE_T)
        };
        if rc == 0 {
            break;
        }

        println!("{:#?}", mem_info);
        base_addr = ((base_addr as u64) + mem_info.RegionSize) as PVOID;
    }
}
