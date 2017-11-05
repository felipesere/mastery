module LandingPage.State exposing (..)

import Lesson exposing (Lesson, LessonId)
import List.Extra
import PersonalPath exposing (..)
import Search exposing (..)


type alias Model =
    { lessons : List Lesson
    , path : Path
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
    | LoadModules (List Lesson)


initial : Model
initial =
    { lessons = []
    , path = PersonalPath.empty
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

        LoadModules lessons ->
            { model | lessons = lessons }


remove : LessonId -> Model -> Model
remove id model =
    let
        new_path =
            PersonalPath.remove id model.path
    in
    { model | path = new_path }


select : Lesson -> Model -> Model
select lesson model =
    let
        new_path =
            PersonalPath.select lesson model.path
    in
    { model | path = new_path }


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
