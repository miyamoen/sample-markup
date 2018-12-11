module Types exposing (Model, Msg(..))

{-|

@docs Model, Msg

-}


type alias Model =
    { counter : Int }


type Msg
    = Increment
    | Decrement
