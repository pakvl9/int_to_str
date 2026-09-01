import lib.ext;

pub struct String {
    data: *u8;
    len:  usize;
    cap:  usize;
}

impl String {
    pub static func Init(str: *u8): String {
        let raw_len = ext.strlen(str);
        let raw_data = ext.malloc(raw_len);
        raw_data = ext.memcpy(raw_data, str, raw_len);

        let res = String {data: raw_data, len: raw_len, cap: raw_len};

        return res;
    }
    pub func ShowData(): *u8 {
        return this.data;
    }
    pub func Free() {
        ext.free(this.data);
    }
}

pub func int_to_str(num: i32): *u8 {
    let buf   = ext.calloc(12uz);
    let len   = 0;
    let numcp = num;
    let i     = 0;
    
    if num == 0 {
        *buf = '0'.(u8);
        return buf;
    } else if num < 0 {
        *buf = '-'.(u8);
        num *= -1;
        i = -1;
    }

    for numcp != 0 {
        numcp /= 10;
        len += 1;
    }

    for num != 0, i += 1 {
        let dig = '0'.(u8) + (num % 10).(u8);
        *(buf + (len - 1 - i)) = dig;
        num /= 10;
    }

    return buf;
}