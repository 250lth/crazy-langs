package start

object Monomorphic {

  def findFirst(ss: Array[String], key: String): Int = {
    @annotation.tailrec
    def loop(n: Int): Int = {
      if (n >= ss.length) - 1
      else if (ss(n) == key) n
      else loop(n + 1)
    }

    loop(0)
  }

  def main(args: Array[String]): Unit = {
    println(findFirst(Array("haha", "heihei", "fuck"), "fuck"))
  }

}
