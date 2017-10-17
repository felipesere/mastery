module LandingPage.State exposing (..)

import Lesson exposing (Lesson, LessonId)
import List.Extra
import Search exposing (..)


type alias Model =
    { lessons : List Lesson
    , selectedLessons : List Lesson
    , modal : Maybe ModalState
    , search : SearchState
    }


type alias ModalState =
    { lesson : Lesson
    , options : DetailsOptions
    }


type DetailsOptions
    = WithAdd
    | WithRemove


type Msg
    = ShowDetails DetailsOptions LessonId
    | CloseDetails
    | Select Lesson
    | Remove LessonId
    | Search String


initial : Model
initial =
    { lessons = []
    , selectedLessons = []
    , modal = Nothing
    , search = Search.init
    }


load : Model -> List Lesson -> Model
load model lessons =
    { model | lessons = lessons }


update : Msg -> Model -> Model
update msg model =
    case msg of
        ShowDetails options id ->
            model |> openDetails id options

        CloseDetails ->
            model |> closeDetails

        Select lesson ->
            model |> select lesson |> closeDetails

        Remove id ->
            model |> remove id |> closeDetails

        Search string ->
            { model | search = string }


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
