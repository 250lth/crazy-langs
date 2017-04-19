object StringUtilV1 {
  def joiner(strings: String*): String =
    strings.mkString("-")

  def joiner(strings: List[String]): String =
    joiner(strings :_*)
}

println( StringUtilV1.joiner(List("Programming", "Scala")))

