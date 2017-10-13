module Card exposing (..)

import Lesson exposing (LessonExtras)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

render: a -> LessonExtras -> Html a
render external {lesson} =
  div [class "card"]
  [ header [ class "card-header"]
          [
            p [ class "card-header-title is-centered"] [text lesson.title]
          ]
    , div [ class "card-content content" ] [ text lesson.subtitle ]
    , footer [ class "card-footer"] [
      a [ onClick external, class "button card-footer-item"] [text "Open" ]
      ]
  ]
