use libc::{c_void, PROT_EXEC, PROT_READ, PROT_WRITE};

const PAGE_SIZE: usize = 4096;

fn main() {
    let size = 4096;

    let mut ptr: *mut c_void = 0 as *mut _;

    unsafe {
        libc::posix_memalign(&mut ptr, PAGE_SIZE, size);
        assert!(!ptr.is_null());

        // Make memory executable.
        libc::mprotect(ptr, size, PROT_EXEC | PROT_READ | PROT_WRITE);
    }

    unsafe { libc::free(ptr) };
}
