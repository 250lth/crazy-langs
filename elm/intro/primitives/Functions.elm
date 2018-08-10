import Html exposing (text)


four =
    sqrt 16


eleven =
    max 2 11


twenty =
    max (sqrt 100) (4 * 5)


main =
    text (toString [four, eleven, twenty])
