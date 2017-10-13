package start

object PolymorphicFuncs {

  def findFirst[A](as: Array[A], p: A => Boolean): Int = {
    @annotation.tailrec
    def loop(n: Int): Int = {
      if (n >= as.length) - 1
      else if (p(as(n))) n
      else loop(n + 1)
    }

    loop(0)
  }

  def isSorted[A](as: Array[A], gt: (A, A) => Boolean): Boolean = {
    @annotation.tailrec
    def go(n: Int): Boolean = {
      if (n >= as.length - 1) true
      else if (gt(as(n), as(n+1))) false
      else go(n+1)
    }

    go(0)
  }

  def main(args: Array[String]): Unit = {
    println(findFirst(Array(7, 9, 13), (x: Int) => x == 9))
    println(isSorted(Array(3, 2, 1), (x:Int, y: Int) => x > y))
    println(isSorted(Array(3, 4, 5), (x:Int, y: Int) => x > y))

  }

}
