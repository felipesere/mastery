module Messages exposing (..)

import LandingPage.State exposing (Msg)
import Lesson exposing (..)
import Navigation exposing (Location)


type Msg
    = ForLandingPage LandingPage.State.Msg
    | ForHealthCheck
    | LoadModules (List Lesson)
    | ChangeLocation Location
