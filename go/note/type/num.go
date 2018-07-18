package main

import (
	"fmt"
	"math"
)

func main() {
	a, b, c := 100, 0144, 0x64

	fmt.Println(a, b, c)
	fmt.Printf("0b%b, %#o, %#x\n", a, a, a)

	fmt.Println(math.MinInt8, math.MaxInt8)
}
