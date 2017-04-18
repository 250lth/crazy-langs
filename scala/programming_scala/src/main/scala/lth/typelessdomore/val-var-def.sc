// use val to def vals
val array: Array[String] = new Array(5)

//array = new Array(2) => error

array(0) = "Hello"
array

// def var
var stockPrice: Double = 100.0
stockPrice = 200.1


class Person(val name: String, var age: Int)

val p = new Person("Dean Winchester", 29)

p.name
p.age
//p.name = "Buck"
p.age = 30