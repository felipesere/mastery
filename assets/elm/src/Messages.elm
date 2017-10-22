module Messages exposing (..)

import LandingPage.State exposing (Msg)
import Lesson exposing (..)
import Navigation exposing (Location)
import Routing exposing (Route(..))


type Auth
    = LoggedIn String
    | Unauthenticated


type Msg
    = ForLandingPage LandingPage.State.Msg
    | ForHealthCheck
    | ChangeLocation Location
    | ChangeRoute Route
    | ChangeAuth Auth
