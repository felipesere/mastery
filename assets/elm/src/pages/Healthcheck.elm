module Pages.Healthcheck exposing (..)

import AppState exposing (Model)
import Html exposing (..)
import Html.Attributes exposing (class)


view : Model -> Html a
view model =
    Html.div [] [ Html.text "Hi there" ]
