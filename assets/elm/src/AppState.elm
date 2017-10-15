module AppState exposing (..)

import Lesson exposing (Lesson, LessonId)
import List.Extra
import Messages exposing (..)
import Search exposing (..)


type Route
    = LandingPage
    | Healthcheck
    | NotFound


type alias Model =
    { lessons : List Lesson
    , selectedLessons : List Lesson
    , modal : Maybe ModalState
    , search : SearchState
    , route : Route
    }


initial : Route -> Model
initial route =
    { lessons = []
    , selectedLessons = []
    , modal = Nothing
    , search = Search.init
    , route = route
    }


remove : LessonId -> Model -> Model
remove id model =
    let
        selectedLessons =
            List.filter (\l -> l.id /= id) model.selectedLessons
    in
    { model | selectedLessons = selectedLessons }


select : Lesson -> Model -> Model
select lesson model =
    { model | selectedLessons = lesson :: model.selectedLessons }


closeDetails : Model -> Model
closeDetails model =
    { model | modal = Nothing }


openDetails : LessonId -> DetailsOptions -> Model -> Model
openDetails id options model =
    let
        modalState =
            model.lessons
                |> List.Extra.find (\l -> l.id == id)
                |> Maybe.map (\lesson -> { lesson = lesson, options = options })
    in
    { model | modal = modalState }
