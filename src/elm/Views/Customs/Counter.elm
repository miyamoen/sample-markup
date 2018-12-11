module Views.Customs.Counter exposing (view)

import Element exposing (..)
import Element.Input as Input
import Types exposing (..)


view : Model -> Element Msg
view model =
    row [ spacing 16 ]
        [ Input.button []
            { onPress = Just Decrement
            , label = text "<"
            }
        , text <| String.fromInt model.counter
        , Input.button []
            { onPress = Just Increment
            , label = text ">"
            }
        ]
