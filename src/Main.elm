module Main exposing (..)

import Backend
import DetailsModal
import Html exposing (..)
import Lesson exposing (..)
import List.Extra
import Messages exposing (..)
import ModuleCatalog exposing (..)
import Path


type alias Model =
    { lessons : List Lesson
    , selectedLessons : List Lesson
    , modal : Maybe ModalState
    }


type alias Msg =
    Messages.Msg


init : ( Model, Cmd Msg )
init =
    ( { lessons = []
      , selectedLessons = []
      , modal = Nothing
      }
    , Backend.get LoadModules
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        None ->
            ( model, Cmd.none )

        LoadModules result ->
            ( { lessons = Result.withDefault [] result
              , selectedLessons = []
              , modal = Nothing
              }
            , Cmd.none
            )

        ShowDetails options id ->
            let
                modalState =
                    model.lessons
                        |> List.Extra.find (\l -> l.id == id)
                        |> Maybe.map (\lesson -> { lesson = lesson, options = options })
            in
            ( { model | modal = modalState }, Cmd.none )

        CloseDetails ->
            ( model |> closeDetails, Cmd.none )

        Select lesson ->
            ( model |> select lesson |> closeDetails, Cmd.none )

        Remove id ->
            ( model |> remove id |> closeDetails, Cmd.none )


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


view : Model -> Html Msg
view model =
    let
        modal =
            model.modal
                |> Maybe.map DetailsModal.render
                |> Maybe.withDefault (div [] [])
    in
    div []
        [ Path.render model.selectedLessons
        , ModuleCatalog.render model.lessons
        , modal
        ]


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
