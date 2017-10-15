module Routing exposing (..)

import AppState exposing (..)
import Navigation exposing (Location)
import UrlParser exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map LandingPage top
        , map Healthcheck (s "healthcheck")
        ]


parseLocation : Location -> Route
parseLocation location =
    location
        |> parseHash matchers
        |> Maybe.withDefault NotFound
