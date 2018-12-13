module View exposing (view)

import Element exposing (..)
import Element.Input as Input
import Html exposing (Html)
import Types exposing (..)
import Views.Customs.Counter as Counter
import Views.Customs.Input
import Views.Customs.SampleMarkup as SampleMarkup


view : Model -> Html Msg
view model =
    layoutWith
        { options = [ focusStyle <| FocusStyle Nothing Nothing Nothing ] }
        []
    <|
        row [ width fill, height fill, padding 32, spacing 16 ]
            [ Views.Customs.Input.view model
            , el [ width fill, alignTop ] <| SampleMarkup.view model
            ]
