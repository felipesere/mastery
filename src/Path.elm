module Path exposing (..)

import Card
import Html exposing (..)
import Html.Attributes exposing (class)
import Lesson exposing (Lesson)


render : (Int -> a) -> List Lesson -> Html a
render msg lessons =
    case lessons of
        [] ->
            div [] []

        things ->
            div [ class "path visibiity" ] (normal msg lessons)


normal : (Int -> a) -> List Lesson -> List (Html a)
normal msg lessons =
    List.indexedMap (\idx lesson -> Card.render (msg idx) lesson) lessons
