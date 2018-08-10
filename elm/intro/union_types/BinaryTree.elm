import Html exposing (Html, div, text)
import Html.Attributes exposing (style)


type Tree a
    = Empty
    | Node a (Tree a) (Tree a)


empty : Tree a
empty =
    Empty


singleton : a -> Tree a
singleton v =
    Node v Empty Empty


insert : comparable -> Tree comparable -> Tree comparable
insert x tree =
    case tree of
        Empty ->
            singleton x

        Node y left right ->
            if x > y then
                Node y left (insert x right)

            else if x < y then
                Node y (insert x left) right

            else
                tree


fromList : List comparable -> Tree comparable
fromList xs =
    List.foldl insert empty xs


depth : Tree a -> Int
depth tree =
    case tree of
        Empty -> 0
        Node v left right ->
            1 + max (depth left) (depth right)

map : (a -> b) -> Tree a -> Tree b
map f tree =
    case tree of
        Empty -> Empty
        Node v left right ->
            Node (f v) (map f left) (map f right)


deepTree =
    fromList [1,2,3]


niceTree =
    fromList [2,1,3]


main =
    div [ style [ ("font-family", "monospace") ] ]
        [ display "depth deepTree" (depth deepTree)
        , display "depth niceTree" (depth niceTree)
        , display "incremented" (map (\n -> n + 1) niceTree)
        ]


display : String -> a -> Html msg
display name value =
    div [] [ text (name ++ " ==> " ++ toString value) ]
