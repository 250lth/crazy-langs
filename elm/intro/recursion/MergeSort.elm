import Html exposing (text)


main =
    text (toString (mergesort [5,3,8,1,9,4,7]))


mergesort : List comparable -> List comparable
mergesort list =
    case list of
        [] ->
            list

        [_] ->
            list

        _ ->
            let
                (xs, ys) = split list
            in
                merge (mergesort xs) (mergesort ys)


split : List a -> (List a, List a)
split list =
    case list of
        [] ->
            ([], [])

        x :: rest ->
            let
                (xs, ys) = split rest
            in
                (ys, x :: xs)


merge : List comparable -> List comparable -> List comparable
merge xs ys =
    case (xs, ys) of
        (x :: xBack, y :: yBack) ->
            if x < y then
                x :: merge xBack ys
            else
                y :: merge xs yBack

        ([], rest) ->
            rest

        (rest, []) ->
            rest
