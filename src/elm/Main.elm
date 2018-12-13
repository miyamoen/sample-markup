module Main exposing (init)

import Browser
import Types exposing (..)
import View exposing (view)


init : () -> ( Model, Cmd Msg )
init () =
    ( { counter = 0, input = "test" }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | counter = model.counter + 1 }, Cmd.none )

        Decrement ->
            ( { model | counter = model.counter - 1 }, Cmd.none )

        SetInput new ->
            ( { model | input = new }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , view =
            \model ->
                { title = "elm-markup sample"
                , body = [ view model ]
                }
        , update = update
        , subscriptions = subscriptions
        }
