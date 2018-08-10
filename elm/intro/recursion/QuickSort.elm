import Html exposing (text)


main =
    text (toString (quicksort [5,3,8,1,9,4,7]))


quicksort : List comparable -> List comparable
quicksort list =
    case list of
        [] ->
            []

        pivot :: rest ->
            let
                lower = List.filter (\n -> n <= pivot) rest
                higher = List.filter(\n -> n > pivot) rest
            in
                quicksort lower ++ [pivot] ++ quicksort higher
