module DetailsModal exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Lesson exposing (Lesson, LessonId)
import Markdown
import ReadingList


render : a -> (Lesson -> a) -> Lesson -> Html a
render close select lesson =
    div [ class "modal is-active" ]
        [ background
        , card close select lesson
        ]


render2 : a -> (LessonId -> a) -> Lesson -> Html a
render2 close remove lesson =
    div [ class "modal is-active" ]
        [ background
        , card2 close (remove lesson.id) lesson
        ]


card2 : a -> a -> Lesson -> Html a
card2 close remove lesson =
    div [ class "modal-card" ]
        [ header close lesson
        , body lesson
        , footer2 remove
        ]


footer2 : a -> Html a
footer2 remove =
    Html.footer [ class "modal-card-foot" ]
        [ button [ onClick remove, class "button is-info" ] [ Html.text "Remove" ]
        ]


card : a -> (Lesson -> a) -> Lesson -> Html a
card close select lesson =
    div [ class "modal-card" ]
        [ header close lesson
        , body lesson
        , footer (select lesson)
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


footer : a -> Html a
footer select =
    Html.footer [ class "modal-card-foot" ]
        [ button [ onClick select, class "button" ] [ Html.text "Add" ]
        , button [ class "button is-info" ] [ Html.text "Remove" ]
        ]


background : Html a
background =
    div [ class "modal-background" ] []
