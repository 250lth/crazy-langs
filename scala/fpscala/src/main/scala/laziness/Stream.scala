package laziness

import Stream._

trait Stream[+A] {

  def headOption[A] = this match {
    case Empty => None
    case Cons(h, t) => Some(h())
  }

  def toList: List[A] = {
    @annotation.tailrec
    def go(s: Stream[A], acc: List[A]): List[A] = s match {
      case Cons(h, t) => go(t(), h() :: acc)
      case _ => acc
    }
    go(this, List()).reverse
  }

  def take(n: Int): Stream[A] = this match {
    case Cons(h, t) if n > 1 => cons(h(), t().take(n - 1))
    case Cons(h, _) if n == 1 => cons(h(), empty)
    case _ => empty
  }

  def takeWhile(f: A => Boolean): Stream[A] = this match {
    case Cons(h, t) if f(h()) => cons(h(), t() takeWhile f)
    case _ => empty
  }

  def exists1(p: A => Boolean): Boolean = this match {
    case Cons(h, t) => p(h()) || t().exists1(p)
    case _ => false
  }

  def foldRight[B](z: => B)(f: (A, => B) => B): B = this match {
    case Cons(h, t) => f(h(), t().foldRight(z)(f))
    case _ => z
  }

  def exists(p: A => Boolean): Boolean =
    foldRight(false)((a, b) => p(a) || b)

  def forAll(f: A => Boolean): Boolean =
    foldRight(true)((a, b) => f(a) && b)

  def takeWhile1(f: A => Boolean): Stream[A] =
    foldRight(empty[A])((h, t) =>
      if (f(h)) cons(h, t)
      else empty
    )

  def headOption1: Option[A] =
    foldRight(None: Option[A])((h, _) => Some(h))

  def map[B](f: A => B): Stream[B] =
    foldRight(empty[B])((h, t) => cons(f(h), t))

  def filter(f: A => Boolean): Stream[A] =
    foldRight(empty[A])((h, t) =>
      if (f(h)) cons(h, t)
      else t)

  def append[B >: A](s: => Stream[B]): Stream[B] =
    foldRight(s)((h, t) => cons(h, t))

  def flatMap[B](f: A => Stream[B]): Stream[B] =
    foldRight(empty[B])((h, t) => f(h) append t)

  def constant[A](a: A): Stream[A] = {
    lazy val tail: Stream[A] = Cons(() => a, () => tail)
    tail
  }

  def from(n: Int): Stream[Int] =
    cons(n, from(n+1))

  val fibs = {
    def go(f0: Int, f1: Int): Stream[Int] =
      cons(f0, go(f1, f0+f1))
    go(0, 1)
  }

}

case object Empty extends Stream[Nothing]
case class Cons[+A](h: () => A, t: () => Stream[A]) extends Stream[A]

object Stream {

  def cons[A](hd: => A, tl: => Stream[A]): Stream[A] = {
    lazy val head = hd
    lazy val tail = tl
    Cons(() => head, () => tail)
  }

  def empty[A]: Stream[A] = Empty

  def apply[A](as: A*): Stream[A] = {
    if (as.isEmpty) empty else cons(as.head, apply(as.tail: _*))
  }

  def unfold[A, S](z: S)(f: S => Option[(A, S)]): Stream[A] =
    f(z) match {
      case Some((h,s)) => cons(h, unfold(s)(f))
      case None => Empty
    }

  def unfoldViaFold[A, S](z: S)(f: S => Option[(A, S)]): Stream[A] =
    f(z).map((p: (A, S)) => cons(p._1, unfold(p._2)(f))).getOrElse(empty[A])

  def fibsViaUnfold(n: Int) =
    unfold(n)(n => Some((n, n + 1)))

  def constantViaUnfold[A](a: A) =
    unfold(a)(_ => Some((a, a)))

  val onesViaUnfold = unfold(1)(_ => Some((1, 1)))
}
