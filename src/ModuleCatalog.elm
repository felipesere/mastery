module ModuleCatalog exposing (..)

import Card exposing (render)
import Html exposing (..)
import Html.Attributes exposing (class, style)
import Lesson exposing (..)
import Style exposing (..)


render : List Lesson.Lesson -> a -> Html a
render lessons external =
    div [ class "container is-fluid", style flexible ]
        (List.map (Card.render external) lessons)


flexible : List Style
flexible =
    [ display "flex"
    , flexWrap wrap
    , alignContent flexStart
    , justifyContent center
    ]
