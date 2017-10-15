module SearchBar exposing (..)

import Html exposing (..)
import Html.Attributes exposing (alt, class, placeholder, type_)
import Html.Events exposing (onInput)
import Messages exposing (..)


view : Html Msg
view =
    div [ class "field has-addons is-centered" ]
        [ div [ class "control" ]
            [ Html.input [ onInput Search, type_ "text", class "input", placeholder "Search for anything" ] []
            ]
        ]
