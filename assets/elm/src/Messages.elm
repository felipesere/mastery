module Messages exposing (..)

import LandingPage.State exposing (Msg)
import Lesson exposing (..)
import Navigation exposing (Location)
import Routing exposing (Route(..))


type Msg
    = ForLandingPage LandingPage.State.Msg
    | ForHealthCheck
    | LoadModules (List Lesson)
    | ChangeLocation Location
    | ChangeRoute Route
