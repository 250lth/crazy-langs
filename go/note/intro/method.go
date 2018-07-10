package main

import "fmt"

type X int

func (x *X) inc() {
	*x++
}

type user struct {
	name string
	age byte
}

func (u user) ToString() string {
	return fmt.Sprintf("%+v", u)
}

type manager struct {
	user
	title string
}

func main() {
	var x X
	x.inc()
	println(x)


	var m manager
	m.name = "Tom"
	m.age = 29
	println(m.ToString())
}
