module Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)


type Route
    = LandingPage
    | Healthcheck
    | NotFound


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
