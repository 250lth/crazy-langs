import Html exposing (text)
import String


primitiveCount number =
    case number of
        1 -> "one"
        2 -> "two"
        3 -> "three"
        4 -> "four"
        _ -> "many"


main =
    text (String.join ", " primitiveNumbers)


primitiveNumbers =
    [ primitiveCount 1
    , primitiveCount 2
    , primitiveCount 3
    , primitiveCount 4
    , primitiveCount 5
    , primitiveCount 6
    , primitiveCount 7
    , primitiveCount 8
    ]
