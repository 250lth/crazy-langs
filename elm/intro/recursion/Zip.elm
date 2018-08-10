import Html exposing (text)


main =
    text (toString (zip ["Tom", "Sue", "Bob"] [ 45, 31, 26 ]))


zip : List a -> List b -> List (a, b)
zip xs ys =
    case (xs, ys) of
        ( x :: xBack, y :: yBack ) ->
            (x, y) :: zip xBack yBack

        (_, _) ->
            []
