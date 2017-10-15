module Path exposing (..)

import Card exposing (Display(..), view)
import Html exposing (..)
import Html.Attributes exposing (class)
import Lesson exposing (Lesson)
import Messages exposing (..)


view : List Lesson -> Html Messages.Msg
view lessons =
    case lessons of
        [] ->
            div [] []

        things ->
            div [ class "path visibiity" ] (normal lessons)


normal : List Lesson -> List (Html Messages.Msg)
normal lessons =
    let
        asCard =
            Card.view Static WithRemove
    in
    List.map asCard lessons
