module DetailsModal exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Lesson exposing (Lesson)


render : a -> Lesson -> Html a
render msg lesson =
    div [ class "modal is-active" ]
        [ background
        , card lesson
        ]


card : Lesson -> Html a
card lesson =
    div [ class "modal-card" ]
        [ header lesson
        , body lesson
        , footer
        ]


header : Lesson -> Html a
header lesson =
    Html.header [ class "modal-card-header" ]
        [ p [ class "modal-card-title" ] [ Html.text lesson.title ]
        , button [ class "delete" ] []
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
