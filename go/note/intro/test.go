package main

import "fmt"

func main() {
	println("hello, world")
	fmt.Println("fmt, hello, world")

	var x1 int32
	var s1 = "hello, world"
	println(x1, s1)

	x2 := 100
	println(x2)

	if x2 > 0 {
		println("x")
	} else if x2 < 0 {
		println("-x")
	} else {
		print("0")
	}

	switch {
		case x2 > 0:
			println("x")
		case x2 < 0:
			println("-x")
		default:
			println("0")
	}
	
	for i := 0; i < 5; i++ {
		println(i)
	}

	for i := 4; i >= 0; i-- {
		println(i)
	}
}
