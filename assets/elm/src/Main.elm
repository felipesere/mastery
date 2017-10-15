module Main exposing (..)

import Backend
import Header
import Healthcheck.Healthcheck as Healthcheck
import Html
import LandingPage.LandingPage as LandingPage
import LandingPage.State exposing (Model)
import Messages exposing (Msg(..))
import Navigation exposing (Location)
import Routing exposing (Route(..), parseLocation)


type alias Config =
    { baseUrl : String }


type alias AppModel =
    { route : Routing.Route
    , landing : LandingPage.State.Model
    }


init : Config -> Location -> ( AppModel, Cmd Msg )
init config location =
    ( { route = parseLocation location, landing = LandingPage.State.initial }
    , Backend.get config.baseUrl
    )


update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update msg model =
    case msg of
        ForLandingPage inner ->
            ( { model | landing = LandingPage.State.update inner model.landing }, Cmd.none )

        ForHealthCheck ->
            ( model, Cmd.none )

        ChangeLocation location ->
            ( { model | route = parseLocation location }, Cmd.none )

        LoadModules result ->
            ( { model | landing = LandingPage.State.load model.landing result }, Cmd.none )


page : AppModel -> Html.Html Msg
page model =
    case model.route of
        LandingPage ->
            frame (LandingPage.view model.landing)

        Healthcheck ->
            frame Healthcheck.view

        NotFound ->
            frame (LandingPage.view model.landing)


frame : Html.Html Msg -> Html.Html Msg
frame html =
    Html.div [] [ Header.view, html ]


main =
    Navigation.programWithFlags
        ChangeLocation
        { init = init
        , view = page
        , update = update
        , subscriptions = \model -> Sub.none
        }
