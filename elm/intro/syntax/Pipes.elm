import Html exposing (text)
import String


isNotSpace char =
    char /= ' '


weirdReversal1 string =
    String.filter isNotSpace (String.toUpper (String.reverse string))


weirdReversal2 string =
    string
        |> String.reverse
        |> String.toUpper
        |> String.filter isNotSpace


main =
    text (weirdReversal2 "s t r e s s e d")
