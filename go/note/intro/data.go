package main

import (
	"fmt"
)

func main() {
	x := make([]int, 0, 5)

	for i := 0; i < 8; i++ {
		x = append(x, i)
	}

	fmt.Println(x)


	m := make(map[string]int)

	m["a"] = 1

	x1, ok := m["b"]
	fmt.Println(x1, ok)

	delete(m, "a")
}
