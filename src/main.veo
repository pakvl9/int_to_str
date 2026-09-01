import lib.ext;
import lib.str;

func main(): i32 {
    let raw = "hello";
    let string = str.String.Init(raw);

    ext.puts(string.ShowData());
    string.Free();



    // let str = str.int_to_str(-10);

    // ext.puts("The sum is: ");
    // ext.puts(str);

    // ext.free(str);
    return 0;
}