extern "C" {
    pub func puts(str: *u8): i32;
    pub func malloc(size: usize): *u8;
    pub func calloc(num: usize, size: usize): *u8;
    pub func free(ptr: *u8);
    pub func strlen(ptr: *u8): usize;
    pub func memcpy(dest: *u8, src: *u8, bytes: usize): *u8;
}

pub func calloc(size: usize): *u8 {
    return calloc(1uz, size);
}