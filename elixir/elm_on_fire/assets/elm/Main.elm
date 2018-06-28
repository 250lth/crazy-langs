module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (class)
import Json.Decode exposing (string, int, list, Decoder, at)
import Json.Decode.Pipeline exposing (decode, required)
import Http
import Debug


type alias Student =
    { name : String
    , age : Int
    , subject : String
    , classification : String
    }


type alias Model =
    { students : List Student
    }


type Msg
    = StudentData (Result Http.Error (List Student))


initialModel : Model
initialModel =
    { students =
        [ { name = ""
          , age = 0
          , subject = ""
          , classification = ""
          }
        ]
    }


studentDecoder : Decoder Student
studentDecoder =
    decode Student
        |> required "name" string
        |> required "age" int
        |> required "subject" string
        |> required "classification" string


decodeList : Decoder (List Student)
decodeList =
    list studentDecoder


decoder : Decoder (List Student)
decoder =
    at [ "data" ] decodeList


initialCmd : Cmd Msg
initialCmd =
    decoder
        |> Http.get "http://localhost:4000/api/students"
        |> Http.send StudentData


init : ( Model, Cmd Msg )
init =
    ( initialModel, initialCmd )


viewStudent : Student -> Html Msg
viewStudent student =
    tr []
        [ td [] [ text (student.name ++ " (" ++ toString student.age ++ ")") ]
        , td [] [ text student.subject ]
        , td [] [ text student.classification ]
        ]


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Enrolled Students" ]
        , table [ class "table" ]
            [ thead []
                [ tr []
                    [ th [] [ text "Name (Age)" ]
                    , th [] [ text "Course" ]
                    , th [] [ text "Type" ]
                    ]
                ]
            , tbody [] (List.map viewStudent model.students)
            ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        StudentData (Ok students) ->
            ( { model | students = students }, Cmd.none )

        StudentData (Err _) ->
            ( model, Cmd.none )


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
