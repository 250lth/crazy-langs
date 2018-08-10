import Html exposing (text)


main =
    text (toString (length (List.range 1 9)))


length : List a -> Int
length list =
    case list of
        [] ->
            0

        first :: rest ->
            1 + length rest
