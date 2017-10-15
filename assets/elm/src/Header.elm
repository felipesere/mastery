module Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (alt, class, href, placeholder, src, type_)
import Messages exposing (..)
import SearchBar


view : Html Messages.Msg
view =
    Html.header [ class "top navbar" ]
        [ div [ class "navbar-brand" ]
            [ homelink
            , search
            , healthcheck
            ]
        ]


healthcheck =
    div [ class "navbar-item" ]
        [ a [ href "/#healthcheck" ] [ text "Healthcheck" ]
        ]


search =
    div [ class "navbar-item" ] [ SearchBar.view ]


homelink =
    a [ class "navbar-item", href "/" ] [ Html.img [ src "https://8thlight.com/images/branding/8th-Light-Logo-Color-No-Text-28048670.png", alt "8th Light logo" ] [] ]
