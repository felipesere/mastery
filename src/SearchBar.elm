module SearchBar exposing (..)

import Html exposing (..)
import Html.Attributes exposing (alt, class, placeholder, type_)
import Html.Events exposing (onInput)
import Messages exposing (..)


type alias SearchState =
    String


init : SearchState
init =
    ""


view : Html Msg
view =
    div [ class "field has-addons is-centered" ]
        [ div [ class "control" ]
            [ Html.input [ type_ "text", class "input", placeholder "Search for anything" ] []
            ]
        ]
