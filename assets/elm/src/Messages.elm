module Messages exposing (..)

import LandingPage.State exposing (Msg)
import Navigation exposing (Location)
import PersonalPath exposing (Path)
import Routing exposing (Route(..))
import Lesson exposing (Lesson)


type Auth
    = LoggedIn String
    | Unauthenticated

type Msg
    = ForLandingPage LandingPage.State.Msg
    | ForHealthCheck
    | ChangeLocation Location
    | ChangeRoute Route
    | ChangeAuth Auth
    | LoadPath (Maybe Path)
    | SavePath
    | MoveUp Lesson
