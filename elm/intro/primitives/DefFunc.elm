import Html exposing (text)


add x y =
    x + y


factorial n =
    List.product (List.range 1 n)


main =
    text (toString (add 1 (factorial 4)))
