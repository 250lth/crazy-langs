import Html exposing (text)
import String


capitalize1 word =
    String.toUpper (String.left 1 word) ++ String.dropLeft 1 word


capitalize2 word =
    let
        firstLetter =
            String.left 1 word

        otherLetters =
            String.dropLeft 1 word
    in
        String.toUpper firstLetter ++ otherLetters


main =
    text (capitalize2 "who ate all the pie?")
