module Main exposing (..)

import AppState exposing (..)
import Backend
import DetailsModal
import Html
import Messages exposing (..)
import ModuleCatalog
import Path


type alias Msg =
    Messages.Msg


init : ( Model, Cmd Msg )
init =
    ( AppState.initial
    , Backend.get LoadModules
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LoadModules result ->
            ( { model | lessons = Result.withDefault [] result }, Cmd.none )

        ShowDetails options id ->
            ( model |> AppState.openDetails id options, Cmd.none )

        CloseDetails ->
            ( model |> AppState.closeDetails, Cmd.none )

        Select lesson ->
            ( model |> AppState.select lesson |> AppState.closeDetails, Cmd.none )

        Remove id ->
            ( model |> AppState.remove id |> AppState.closeDetails, Cmd.none )


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ Path.render model.selectedLessons
        , ModuleCatalog.render model.lessons
        , DetailsModal.render model.modal
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
