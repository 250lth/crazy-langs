package main

import (
	"errors"
	"fmt"
)

func div(a, b int) (int, error) {
	if b == 0 {
		return 0, errors.New("division by zero")
	}

	return a / b, nil
}

func test(x int) func() {
	return func() {
		println(x)
	}
}

func test2(a, b int) {
	defer println("dispose...")
	println(a / b)
}

func main() {
	a, b := 10, 2
	c, err := div(a, b)
	fmt.Println(c, err)

	x := 100
	f := test(x)
	f()

	test2(10, 0)
}
