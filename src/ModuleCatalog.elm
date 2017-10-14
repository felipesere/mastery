module ModuleCatalog exposing (..)

import Card exposing (render)
import Html exposing (..)
import Html.Attributes exposing (class, style)
import Lesson exposing (..)
import Messages exposing (..)
import Style exposing (..)


render : List Lesson -> Html Msg
render lessons =
    div [ class "container is-fluid", style flexible ]
        (List.map (\lesson -> Card.render (ShowDetails WithAdd lesson.id) lesson) lessons)


flexible : List Style
flexible =
    [ display "flex"
    , flexWrap wrap
    , alignContent flexStart
    , justifyContent center
    ]
