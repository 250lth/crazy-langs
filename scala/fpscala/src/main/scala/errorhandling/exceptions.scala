def failingFn(i: Int): Int = {
  val y: Int = throw new Exception("fail!!!")
  try {
    val x = 42 + 5
    x + y
  } catch { case e: Exception => 43}
}

def failingFn2(i: Int): Int = {
  try {
    val x = 42 + 5
    x + ((throw new Exception("Failing!!")): Int)
  } catch { case e: Exception => 43}
}
