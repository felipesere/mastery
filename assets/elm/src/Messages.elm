module Messages exposing (..)

import LandingPage.State exposing (Msg)
import Lesson exposing (Lesson)
import Navigation exposing (Location)
import PersonalPath exposing (Path)
import Routing exposing (Route(..))


type Auth
    = LoggedIn String
    | Unauthenticated


type Msg
    = NoOp
    | ForLandingPage LandingPage.State.Msg
    | ForHealthCheck
    | ChangeLocation Location
    | ChangeRoute Route
    | ChangeAuth Auth
    | LoadPath (Maybe Path)
    | SavePath
