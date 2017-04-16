/**
  * Created by lth on 17-4-16.
  */

package lth.intro

object Upper {
  def main(args: Array[String]) = {
    args.map(_.toUpperCase()).foreach(printf("%s ", _))
    println("")
  }
}