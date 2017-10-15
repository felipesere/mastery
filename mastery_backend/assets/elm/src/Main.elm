module Main exposing (..)

import AppState exposing (..)
import Backend
import DetailsModal
import Header
import Html
import Messages exposing (..)
import ModuleCatalog
import Path
import Search


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

        Search string ->
            ( { model | search = string }, Cmd.none )


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ Header.view
        , Path.view model.selectedLessons
        , ModuleCatalog.view (Search.forTerm model.search model.lessons)
        , DetailsModal.view model.modal
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