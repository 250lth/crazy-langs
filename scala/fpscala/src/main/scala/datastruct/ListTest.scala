package datastruct

object ListTest {
  import List._

  // sample
  val x = List(1,2,3,4,5) match {
    case Cons(x, Cons(2, Cons(4, _))) => x
    case Nil => 42
    case Cons(x, Cons(y, Cons(3, Cons(4, _)))) => x + y
    case Cons(h, t) => h + sum(t)
    case _ => 101
  }

  val xs: List[Int] = List(1,2,3,4,5)
  val ex1 = dropWhile(xs, (x: Int) => x < 4)
  val ex2 = dropWhile2(xs)(x => x < 4)

  def main(args: Array[String]): Unit = {
    println(x)
    println(ex1)
    println(ex2)
  }

}
