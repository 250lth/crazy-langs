import org.scalatest.{ FuncSpec, ShouldMatchers }

class NerdFinderSpec extends FuncSpec with ShouldMathchers {
  describe ("nerd finder") {
    it ("identify nerds from a List") {
      var actors = List("Rick Moranis", "James Deam", "Woody Allen")
      var finder = new NerdFinder(actors)
      finder.findNerds shouldEqual List("Rick Moranis", "Woody Allen")
    }
  }
}