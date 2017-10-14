module DetailsModal exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Lesson exposing (Lesson)


render : a -> Lesson -> Html a
render close lesson =
    div [ class "modal is-active" ]
        [ background
        , card close lesson
        ]


card : a -> Lesson -> Html a
card close lesson =
    div [ class "modal-card" ]
        [ header close lesson
        , body lesson
        , footer
        ]


header : a -> Lesson -> Html a
header close lesson =
    Html.header [ class "modal-card-head" ]
        [ p [ class "modal-card-title" ] [ Html.text lesson.title ]
        , button [ onClick close, class "delete" ] []
        ]


body : Lesson -> Html a
body lesson =
    Html.section [ class "modal-card-body" ]
        [ p [ class "description" ] [ Html.text "The description" ]
        , p [] [ Html.text "Outputs" ]
        , p [] [ Html.text "Outcomes" ]
        , p [] [ Html.text "Reading material" ]
        ]


footer : Html a
footer =
    Html.footer [ class "modal-card-foot" ]
        [ button [ class "button" ] [ Html.text "Add" ]
        , button [ class "button is-info" ] [ Html.text "Remove" ]
        ]


background : Html a
background =
    div [ class "modal-background" ] []
