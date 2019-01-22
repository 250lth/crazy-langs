fn main() {
    // float
    let x = 2.0;
    let y: f32 = 3.0;
    println!("x: {}, y: {}", x, y);

    // data calculation
    let sum = 5 + 10;
    println!("sum: {}", sum);

    let difference = 95.3 - 4.6;
    println!("difference: {}", difference);

    let product = 4 * 30;
    println!("product: {}", product);

    let quotient = 56.7 / 32.2;
    println!("quotient: {}", quotient);

    let remainer = 43 % 5;
    println!("remainer: {}", remainer);

    // bool
    let t = true;
    println!("t: {}", t);

    let f: bool = false;
    println!("f: {}", f);

    // char
    let c = 'z';
    let z = 'ℤ';
    let heart_eyed_cat = '😻';

    println!("c: {}, z: {}, heart_eyed_cat: {}", c, z, heart_eyed_cat);

    // tuple
    let tup: (i32, f64, u8) = (500, 6.4, 1);
    let (t1, t2, t3) = tup;
    println!("t1: {}, t2: {}, t3: {}", t1, t2, t3);

    let five_hundred = tup.0;
    let six_point_four = tup.1;
    let one = tup.2;
    println!(
        "five_hundred: {}, six_point_four: {}, one: {}",
        five_hundred, six_point_four, one
    );

    // array
    let a = [1, 2, 3, 4, 5];
    let first = a[0];
    let second = a[1];
    println!("first: {}, second: {}", first, second);
}
