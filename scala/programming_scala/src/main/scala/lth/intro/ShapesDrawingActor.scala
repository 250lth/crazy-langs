package lth.intro

/**
  * Created by lth on 17-4-16.
  */

object Messages {
  object Exit
  object Finished
  case class Response(messages: String)
}

import akka.actor.Actor
import lth.intro.shapes._

class ShapesDrawingActor extends Actor {
  import Messages._

  override def receive: Receive = {
    case s: Shape =>
      s.draw(str => println(s"ShapesDrawingActor: $str"))
      sender ! Response(s"ShapesDrawingActor: $s drawn")
    case Exit =>
      println(s"ShapesDrawingActor: exiting...")
      sender ! Finished
    case unexpected =>
      val response = Response(s"ERROR: Unknown message: $unexpected")
      println(s"ShapesDrawingActor: $response")
      sender ! response
  }
}
