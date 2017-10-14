module ReadingList exposing (render)

import Html exposing (..)
import Html.Attributes exposing (class)
import Markdown


render : List String -> Html a
render material =
    case material of
        [] ->
            div [] []

        many ->
            properReadingList many


properReadingList material =
    div [ class "content" ]
        [ span [ class "icon" ]
            [ i [ class "fa fa-book fa-fw" ] [] ]
        , Html.text "Reading material:"
        , ul [] (items material)
        ]


items : List String -> List (Html a)
items materials =
    List.map (\book -> li [] [ Markdown.toHtml [] book ]) materials
