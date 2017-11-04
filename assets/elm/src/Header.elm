module Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (alt, class, href, placeholder, src, type_)
import Messages exposing (..)
import OnClickPage exposing (onClickPage)
import Routing exposing (..)
import SearchBar


view : Messages.Auth -> Html Messages.Msg
view auth =
    Html.header [ class "top navbar" ]
        [ div [ class "navbar-brand" ]
            [ homelink
            , search
            , personal_path auth
            , healthcheck
            , login auth
            ]
        ]


personal_path : Messages.Auth -> Html Msg
personal_path auth =
    case auth of
        Unauthenticated ->
            Html.text ""

        LoggedIn username ->
            div [ class "navbar-item" ]
                [ a (onClickPage PersonalPath) [ text "PersonalPath" ]
                ]


login : Messages.Auth -> Html Messages.Msg
login auth =
    case auth of
        Unauthenticated ->
            div [ class "navbar-item navbar-end" ]
                [ a (onClickPage Login) [ text "Login" ]
                ]

        LoggedIn username ->
            div [ class "navbar-item navbar-end" ] [ text username ]


healthcheck : Html Messages.Msg
healthcheck =
    div [ class "navbar-item" ]
        [ a (onClickPage Healthcheck) [ text "Healthcheck" ]
        ]


search : Html Messages.Msg
search =
    div [ class "navbar-item" ] [ SearchBar.view ]


homelink : Html Messages.Msg
homelink =
    a (onClickPage LandingPage ++ [ class "navbar-item" ]) [ Html.img [ src "https://8thlight.com/images/branding/8th-Light-Logo-Color-No-Text-28048670.png", alt "8th Light logo" ] [] ]
