def makeList(strings: String*) = {
  if (strings.length == 0)
    List(0)
  else
    strings.toList
}

// => error
// val list: List[String] = makeList()