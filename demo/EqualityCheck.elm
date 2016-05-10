module EqualityCheck exposing (..)

import Html exposing (text)


listA : List (List Int)
listA =
    [ [ 1, 2 ], [ 3, 4, 5 ] ]


main =
    [ [ 1, 2 ], [ 3, 4, 5 ] ]
        == listA
        |> toString
        |> text
