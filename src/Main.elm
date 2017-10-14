module Main exposing (..)

import Array
import Backend
import DetailsModal
import Html exposing (..)
import Http
import Lesson exposing (..)
import ModuleCatalog exposing (..)
import Path


type alias Model =
    { lessons : List Lesson
    , selectedLessons : List Lesson
    , lessonDetails : Maybe Lesson
    }


type Msg
    = None
    | LoadModules (Result Http.Error (List Lesson))
    | ShowDetails Int
    | CloseDetails
    | Select Lesson


init : ( Model, Cmd Msg )
init =
    ( { lessons = []
      , selectedLessons = []
      , lessonDetails = Nothing
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
              }
            , Cmd.none
            )

        ShowDetails index ->
            let
                details =
                    Array.fromList model.lessons |> Array.get index
            in
            ( { model | lessonDetails = details }, Cmd.none )

        CloseDetails ->
            ( model |> closeDetails, Cmd.none )

        Select lesson ->
            ( model |> select lesson |> closeDetails, Cmd.none )


select : Lesson -> Model -> Model
select lesson model =
    { model | selectedLessons = lesson :: model.selectedLessons }


closeDetails : Model -> Model
closeDetails model =
    { model | lessonDetails = Nothing }


view : Model -> Html Msg
view model =
    let
        modal =
            model.lessonDetails
                |> Maybe.map (DetailsModal.render CloseDetails Select)
                |> Maybe.withDefault (div [] [])
    in
    div []
        [ Path.render ShowDetails model.selectedLessons
        , ModuleCatalog.render model.lessons ShowDetails
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
