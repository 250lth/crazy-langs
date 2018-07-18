package main

import "fmt"

type flags byte

const (
	read flags = 1 << iota
	write
	exec
)

func main() {
	f := read | exec
	fmt.Printf("%b\n", f)

	type (
		user struct {
			name string
			age uint8
		}

		event func(string) bool
	)

	u := user{"Tom", 20}
	fmt.Println(u)

	var f1 event = func(s string) bool {
		println(s)
		return s != ""
	}

	f1("abc")
}
