module Card exposing (..)

import Lesson exposing (Lesson)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

render: a -> Lesson -> Html a
render external lesson =
  div []
  [ header [ class "card-header"]
          [
            p [ class "card-header-title is-centered"] [text lesson.title]
          ]
    , div [ class "card-content content" ] [ text lesson.subtitle ]
    , footer [ class "card-footer"] [
      a [ onClick external, class "button card-footer-item"] [text "Open" ]
      ]
  ]
