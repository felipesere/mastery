module DetailsModal exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Lesson exposing (Lesson)
import Markdown
import ReadingList


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
        [ Markdown.toHtml [ class "description" ] lesson.description
        , list "Outputs" lesson.outputs
        , list "Outcomes" lesson.outcomes
        , ReadingList.render lesson.readingMaterial
        ]


list : String -> List String -> Html a
list name elements =
    let
        items =
            List.map (\e -> Html.li [] [ Html.text e ]) elements
    in
    div [ class "content" ]
        [ Html.text name
        , ul [] items
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
