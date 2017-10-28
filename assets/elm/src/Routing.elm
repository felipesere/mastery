module Routing exposing (..)

import Navigation exposing (..)
import UrlParser exposing (..)


type Route
    = LandingPage
    | Healthcheck
    | NotFound
    | Login
    | PersonalPath


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map LandingPage top
        , map Healthcheck (s "healthcheck")
        , map Login (s "login")
        , map PersonalPath (s "path")
        ]


parseLocation : Location -> Route
parseLocation location =
    location
        |> parsePath matchers
        |> Maybe.withDefault NotFound


pageToUrl : Route -> String
pageToUrl page =
    case page of
        LandingPage ->
            "/"

        Healthcheck ->
            "/healthcheck"

        NotFound ->
            "/not-found"

        Login ->
            "/login"

        PersonalPath ->
            "/path"
