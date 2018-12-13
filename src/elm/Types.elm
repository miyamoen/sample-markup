module Types exposing (Model, Msg(..))

{-|

@docs Model, Msg

-}


type alias Model =
    { counter : Int, input : String }


type Msg
    = Increment
    | Decrement
    | SetInput String
