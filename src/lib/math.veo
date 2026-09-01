pub func sum(num: i32): i32 {
    let sum = 0;

    for let i = 0, i <= num, i += 1 {
        sum += i;
    }

    return sum;
}