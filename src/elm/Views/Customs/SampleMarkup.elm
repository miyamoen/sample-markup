module Views.Customs.SampleMarkup exposing (view)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input exposing (labelAbove)
import Mark exposing (Block, Document, Style(..), Text(..))
import Types exposing (..)
import Views.Customs.Counter as Counter


view : Model -> Element Msg
view model =
    case Mark.parse document model.input of
        Ok element ->
            element model

        Err err ->
            Debug.log "error" err
                |> Debug.toString
                |> text
                |> List.singleton
                |> paragraph []


document : Document (Model -> Element Msg)
document =
    Mark.document
        (\list model ->
            column [ spacing 16 ] <|
                List.map (\view_ -> view_ model) list
        )
        block


block : Block (List (Model -> Element Msg))
block =
    Mark.manyOf
        [ counterBlock
        , Mark.text
            { view =
                \(Text styles body) ->
                    el (List.map styleToAttr styles) (text body)
            , inlines = []
            , replacements = []
            }
            |> Mark.map
                (\lines model -> paragraph [] lines)
        , textBlock
        ]


styleToAttr : Style -> Attribute msg
styleToAttr style =
    case style of
        Bold ->
            Font.bold

        Italic ->
            Font.italic

        Strike ->
            Font.strike


counterBlock : Block (Model -> Element Msg)
counterBlock =
    Mark.stub "Counter" Counter.view


textBlock : Block (Model -> Element Msg)
textBlock =
    Mark.block "Text" (\paras model -> textColumn [ Border.width 1, padding 8 ] paras) <|
        Mark.manyOf
            [ Mark.text
                { view =
                    \(Text styles body) ->
                        el (List.map styleToAttr styles) (text body)
                , inlines = []
                , replacements = []
                }
                |> Mark.map (paragraph [ Border.width 1, padding 8 ])
            ]
