def checkY(y: Int) = {
  for {
    x <- Seq(99, 100, 101)
  } {
    val str = x match {
      case `y` => "found y!"
      case i: Int => "int: " + i
    }
    println(str)
  }
}

checkY(100)

// right output
// use `` to tell the real pattern