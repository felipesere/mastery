module DetailsModal exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Lesson exposing (..)
import Markdown
import Messages exposing (..)
import ReadingList


render : DetailsOptions -> Lesson -> Html Msg
render options lesson =
    div [ class "modal is-active" ]
        [ background
        , card options lesson
        ]


card : DetailsOptions -> Lesson -> Html Msg
card options lesson =
    let
        button =
            case options of
                WithAdd ->
                    add (Select lesson)

                WithRemove ->
                    remove (Remove lesson.id)
    in
    div [ class "modal-card" ]
        [ header lesson
        , body lesson
        , footer button
        ]


add : Msg -> Html Msg
add select =
    button [ onClick select, class "button" ] [ Html.text "Add" ]


remove : Msg -> Html Msg
remove remove =
    button [ onClick remove, class "button is-info" ] [ Html.text "Remove" ]


header : Lesson -> Html Msg
header lesson =
    Html.header [ class "modal-card-head" ]
        [ p [ class "modal-card-title" ] [ Html.text lesson.title ]
        , button [ onClick CloseDetails, class "delete" ] []
        ]


body : Lesson -> Html a
body lesson =
    Html.section [ class "modal-card-body" ]
        [ Markdown.toHtml [ class "description" ] lesson.description
        , list "Outputs" lesson.outputs
        , list "Outcomes" lesson.outcomes
        , ReadingList.render lesson.readingMaterial
        ]


footer : Html Msg -> Html Msg
footer button =
    Html.footer [ class "modal-card-foot" ]
        [ button ]


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
