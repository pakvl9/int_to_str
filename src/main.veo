extern "C" {
    func puts(str: *u8): i32;
    func malloc(size: usize): *u8;
    func calloc(num: usize, size: usize): *u8;
    func free(ptr: *u8);
}

func calloc(size: usize): *u8 {
    return calloc(1uz, size);
}

func main(): i32 {
    let str = int_to_str(-10);

    puts("The sum is: ");
    puts(str);

    free(str);
    return 0;
}

func sum(num: i32): i32 {
    let sum = 0;

    for let i = 0, i <= num, i += 1 {
        sum += i;
    }

    return sum;
}

func int_to_str(num: i32): *u8 {
    let buf   = calloc(12uz);
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