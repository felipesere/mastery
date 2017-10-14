module ModuleCatalog exposing (..)

import Card exposing (render)
import Html exposing (..)
import Html.Attributes exposing (class, style)
import Lesson exposing (..)
import Style exposing (..)


render : List Lesson.Lesson -> (Int -> a) -> Html a
render lessons details =
    div [ class "container is-fluid", style flexible ]
        (List.indexedMap (\idx lesson -> Card.render (details idx) lesson) lessons)


flexible : List Style
flexible =
    [ display "flex"
    , flexWrap wrap
    , alignContent flexStart
    , justifyContent center
    ]
