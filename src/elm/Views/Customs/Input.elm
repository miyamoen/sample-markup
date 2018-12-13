module Views.Customs.Input exposing (view)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input exposing (labelAbove)
import Types exposing (..)


view : Model -> Element Msg
view model =
    Input.multiline [ width fill, height fill ]
        { onChange = SetInput
        , text = model.input
        , placeholder = Nothing
        , label = labelAbove [] <| text "custom markup"
        , spellcheck = True
        }
