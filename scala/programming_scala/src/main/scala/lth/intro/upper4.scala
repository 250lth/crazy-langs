/**
  * Created by lth on 17-4-16.
  */

package lth.intro

object Upper2 {
  def main(args: Array[String]) = {
    val output = args.map(_.toUpperCase()).mkString(" ")
    println(output)
  }
}