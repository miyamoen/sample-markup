module View exposing (view)

import Element exposing (..)
import Element.Input as Input
import Html exposing (Html)
import Types exposing (..)


view : Model -> Html Msg
view model =
    layoutWith
        { options = [ focusStyle <| FocusStyle Nothing Nothing Nothing ] }
        []
    <|
        counter model


counter : Model -> Element Msg
counter model =
    row []
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
