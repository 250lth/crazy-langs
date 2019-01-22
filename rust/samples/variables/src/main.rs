fn main() {
    let mut x = 5;
    println!("The value of x is: {}", x);
    x = 6;
    println!("The value of x is: {}", x);

    const MAX_POINTS: u32 = 100_000;
    println!("We have a const: {}", MAX_POINTS);

    let y = 5;
    println!("The value of x is: {}", y);
    let y = y + 1;
    println!("The value of x is: {}", y);
    let y = y * 2;
    println!("The value of x is: {}", y);

    let spaces = " ";
    println!("spaces is: {}", spaces);
    let spaces = spaces.len();
    println!("spaces is: {}", spaces);
}
