import Html exposing (text)
import String


increment n =
    n + 1


add1 =
    \n -> n + 1


main =
    text (toString (increment (add1 40)))
