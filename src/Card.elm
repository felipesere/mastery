module Card exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Lesson exposing (Lesson)


type Display
    = Static
    | Animated


view : Display -> a -> Lesson -> Html a
view display msg lesson =
    div [ class (animtion display) ]
        [ header [ class "card-header" ]
            [ p [ class "card-header-title is-centered" ] [ text lesson.title ]
            ]
        , div [ class "card-content content" ] [ text lesson.subtitle ]
        , footer [ class "card-footer" ]
            [ a [ onClick msg, class "button card-footer-item" ] [ text "Open" ]
            ]
        ]


animtion : Display -> String
animtion display =
    case display of
        Static ->
            "card"

        Animated ->
            "card card-animated"
