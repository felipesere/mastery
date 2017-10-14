module Main exposing (..)

import Backend
import Debug
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
    , lessonDetails : Maybe Lesson
    , modalOptions : Messages.DetailsOptions
    }


type alias Msg =
    Messages.Msg


init : ( Model, Cmd Msg )
init =
    ( { lessons = []
      , selectedLessons = []
      , lessonDetails = Nothing
      , modalOptions = Messages.WithAdd
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
              , lessonDetails = Nothing
              , modalOptions = Messages.WithAdd
              }
            , Cmd.none
            )

        ShowDetails options id ->
            let
                details =
                    List.Extra.find (\l -> l.id == id) model.lessons
            in
            ( { model | lessonDetails = details, modalOptions = options }, Cmd.none )

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
    { model | lessonDetails = Nothing }


chooseModal : Messages.DetailsOptions -> (Lesson -> Html Messages.Msg)
chooseModal details =
    case details of
        Messages.WithAdd ->
            DetailsModal.render CloseDetails Select

        Messages.WithRemove ->
            DetailsModal.render2 CloseDetails Remove


view : Model -> Html Msg
view model =
    let
        modal =
            model.lessonDetails
                |> Maybe.map (chooseModal model.modalOptions)
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
