data Position = MakePosition Double Double

distance :: Position -> Position -> Double
distance p1 p2 =
    case p1 of
      MakePosition x1 y1 ->
          case p2 of
            MakePosition x2 y2 -> sqrt ((x1 - x2) ^ 2 + (y1 - y2) ^ 2)

pointA :: Position
pointA = MakePosition 0 0

pointB :: Position
pointB = MakePosition 3 4

getX :: Position -> Double
getX p = let MakePosition x _ = p
          in x

getY :: Position -> Double
getY p = let MakePosition _ y = p
          in y

pointFoo :: MakePosition
pointFoo = MakePosition 3 4
