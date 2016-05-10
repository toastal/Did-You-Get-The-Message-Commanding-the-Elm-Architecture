module TypeFailure exposing (..)

import Html exposing (Html, text)


exclaim : String -> String
exclaim string =
    string ++ "!"


view : String -> Html String
view string =
    text (exclaim string)


main : Html String
main =
    view 42
