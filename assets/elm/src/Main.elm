module Main exposing (..)

import AppState exposing (..)
import Backend
import DetailsModal
import Header
import Healthcheck
import Html
import Html.Attributes exposing (class)
import Messages exposing (..)
import ModuleCatalog
import Navigation exposing (Location)
import Path
import Routing exposing (parseLocation)
import Search


type alias Msg =
    Messages.Msg


type alias Config =
    { baseUrl : String }


init : Config -> Location -> ( Model, Cmd Msg )
init config location =
    ( AppState.initial (parseLocation location)
    , Backend.get config.baseUrl
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

        ChangeLocation location ->
            ( { model | route = parseLocation location }, Cmd.none )


page : Model -> Html.Html Msg
page model =
    case model.route of
        LandingPage ->
            frame (home model)

        Healthcheck ->
            frame (Healthcheck.view model)

        NotFound ->
            frame (home model)


frame : Html.Html Msg -> Html.Html Msg
frame html =
    Html.div [] [ Header.view, html ]


home : Model -> Html.Html Msg
home model =
    Html.div []
        [ columns
            [ Path.view model.selectedLessons
            , ModuleCatalog.view (Search.forTerm model.search model.lessons)
            ]
        , DetailsModal.view model.modal
        ]


columns : List (Html.Html Msg) -> Html.Html Msg
columns elements =
    Html.div [ class "columns" ] elements


main =
    Navigation.programWithFlags
        ChangeLocation
        { init = init
        , view = page
        , update = update
        , subscriptions = \model -> Sub.none
        }
