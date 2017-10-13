module ModuleCatalog exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, style)
import Style exposing (..)

import Lesson exposing (..)
import Card exposing (render)

render: List Lesson.Lesson -> a -> Html a
render lessons external =
  div [ class "container is-fluid", style flexible ]
    (List.map (Card.render external) lessons)

flexible: List Style
flexible =
  [ display "flex"
    , flexWrap wrap
    , alignContent flexStart
    , justifyContent center
  ]
