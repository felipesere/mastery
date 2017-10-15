module SearchBar exposing (..)

import Html exposing (..)
import Html.Attributes exposing (alt, class, placeholder, type_)
import Html.Events exposing (onInput)
import LandingPage.State exposing (Msg(..))
import Messages exposing (..)


view : Html Messages.Msg
view =
    let
        msg =
            \term -> ForLandingPage (Search term)
    in
    div [ class "field has-addons is-centered" ]
        [ div [ class "control" ]
            [ Html.input [ onInput msg, type_ "text", class "input", placeholder "Search for anything" ] []
            ]
        ]
