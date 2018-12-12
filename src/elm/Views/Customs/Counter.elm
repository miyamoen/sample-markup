module Views.Customs.Counter exposing (view)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Types exposing (..)


buttomAttrs : List (Attribute msg)
buttomAttrs =
    [ width <| px 50
    , height <| px 50
    , Background.color <| rgb255 156 212 136
    , Font.color <| rgb255 250 250 250
    , Font.size 32
    , Border.rounded 8
    ]


view : Model -> Element Msg
view model =
    row [ spacing 8 ]
        [ Input.button buttomAttrs
            { onPress = Just Decrement
            , label = el [ centerX ] <| text "<"
            }
        , row
            [ width <| px 75
            , height <| px 50
            , Background.color <| rgb255 180 180 180
            , Font.color <| rgb255 250 250 250
            , Font.size 32
            , Border.rounded 8
            ]
            [ el [ centerX ] <| text (String.fromInt model.counter) ]
        , Input.button buttomAttrs
            { onPress = Just Increment
            , label = el [ centerX ] <| text ">"
            }
        ]
