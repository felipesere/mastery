module Path exposing (..)

import Card
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
    List.map (\lesson -> Card.view (ShowDetails WithRemove lesson.id) lesson) lessons
