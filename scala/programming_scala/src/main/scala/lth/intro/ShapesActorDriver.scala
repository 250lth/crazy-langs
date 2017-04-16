package lth.intro

/**
  * Created by lth on 17-4-16.
  */
import akka.actor.{Actor, ActorRef, ActorSystem, Props}
import com.typesafe.config.ConfigFactory
import lth.intro.shapes.{Circle, Point, Rectangle, Triangle}

private object Start

object ShapesDrawingDriver {
  def main(args: Array[String]): Unit = {
    val system = ActorSystem("DrawingActorSystem", ConfigFactory.load())
    val drawer = system.actorOf(
      Props(new ShapesDrawingActor), "drawingActor"
    )
    val driver = system.actorOf(
      Props(new ShapesDrawingDriver(drawer)), "drawingService"
    )
    driver ! Start
  }
}

class ShapesDrawingDriver(drawerActor: ActorRef) extends Actor {
  import Messages._

  override def receive: Receive = {
    case Start =>
      drawerActor ! Circle(Point(0.0,0.0), 1.0)
      drawerActor ! Rectangle(Point(0.0,0.0), 2, 5)
      drawerActor ! 3.14159
      drawerActor ! Triangle(Point(0.0,0.0), Point(2.0,0.0),Point(1.0,2.0))
      drawerActor ! Exit
    case Finished =>
      println(s"ShapesDrawingDriver: cleaning up...")
    case response: Response =>
      println("ShapesDrawingDriver: Response = " + response)
    case unexpected =>
      println("ShapesDrawingDriver: ERROR: Received an unexpected message = " + unexpected)
  }
}

