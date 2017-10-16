module Healthcheck.Healthcheck exposing (..)

import Html exposing (..)


type alias Model =
    { buildTime : String
    , commit : String
    }


initial { buildTime, commit } =
    { buildTime = buildTime, commit = commit }


view : Model -> Html a
view model =
    Html.div []
        [ p [] [ Html.text <| "Commit: " ++ model.commit ]
        , p [] [ Html.text <| "BuildTime: " ++ model.buildTime ]
        ]
