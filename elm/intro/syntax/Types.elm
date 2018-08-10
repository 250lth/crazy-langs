import Html exposing (text)


increment : Int -> Int
increment n =
    n + 1


isNear : Int -> Int -> Bool
isNear x y =
    abs (x - y) < 10


main =
    text (toString (isNear 72 (increment 75)))
