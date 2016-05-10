module LiveCodeComplete exposing (..)

import Html exposing (Html, Attribute, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import String


type alias Model =
    { reverse : String
    , shout : String
    }


init : Model
init =
    { reverse = ""
    , shout = ""
    }


type Msg
    = Reverse String
    | Shout String
    | Exclaim


update : Msg -> Model -> Model
update msg model =
    case msg of
        Reverse str ->
            { model | reverse = str }

        Shout str ->
            { model | shout = str }

        Exclaim ->
            { model
                | reverse = model.reverse ++ "!"
                , shout = model.shout ++ "!"
            }


view : Model -> Html Msg
view { reverse, shout } =
    div []
        [ input
            [ type_ "text"
            , placeholder "Reverse me"
            , value reverse
            , onInput Reverse
            ]
            []
        , div []
            [ text <| String.reverse reverse ]
        , input
            [ type_ "text"
            , placeholder "Shout me"
            , value shout
            , onInput Shout
            ]
            []
        , div []
            [ text <| String.toUpper shout ]
        , button
            [ type_ "button"
            , onClick Exclaim
            ]
            [ text "Exclaim!!" ]
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = init
        , update = update
        , view = view
        }
