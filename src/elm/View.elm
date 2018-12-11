module View exposing (view)

import Element exposing (..)
import Element.Input as Input
import Html exposing (Html)
import Types exposing (..)
import Views.Customs.Counter as Counter


view : Model -> Html Msg
view model =
    layoutWith
        { options = [ focusStyle <| FocusStyle Nothing Nothing Nothing ] }
        []
    <|
        Counter.view model
