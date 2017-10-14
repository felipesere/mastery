module DetailsModal exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Lesson exposing (..)
import Markdown
import Messages exposing (..)
import ReadingList


render : a -> (Lesson -> a) -> Lesson -> Html a
render close select lesson =
    div [ class "modal is-active" ]
        [ background
        , card WithAdd close (select lesson) lesson
        ]


render2 : a -> (LessonId -> a) -> Lesson -> Html a
render2 close remove lesson =
    div [ class "modal is-active" ]
        [ background
        , card WithRemove close (remove lesson.id) lesson
        ]


footer : DetailsOptions -> a -> Html a
footer options select =
    let
        button =
            case options of
                WithAdd ->
                    add select

                WithRemove ->
                    remove select
    in
    Html.footer [ class "modal-card-foot" ]
        [ button ]


add select =
    button [ onClick select, class "button" ] [ Html.text "Add" ]


remove remove =
    button [ onClick remove, class "button is-info" ] [ Html.text "Remove" ]


card : DetailsOptions -> a -> a -> Lesson -> Html a
card options close select lesson =
    div [ class "modal-card" ]
        [ header close lesson
        , body lesson
        , footer options select
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


background : Html a
background =
    div [ class "modal-background" ] []
