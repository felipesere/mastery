module Main exposing (..)

import Backend
import Header
import Healthcheck.Healthcheck as Healthcheck
import Html
import LandingPage.LandingPage as LandingPage
import LandingPage.State exposing (Model)
import Messages exposing (Msg(..))
import Navigation exposing (..)
import Routing exposing (Route(..), pageToUrl, parseLocation)


type alias Config =
    { baseUrl : String
    , buildTime : String
    , commit : String
    }


type alias AppModel =
    { route : Routing.Route
    , landing : LandingPage.State.Model
    , healthcheck : Healthcheck.Model
    }


init : Config -> Location -> ( AppModel, Cmd Msg )
init config location =
    let
        route =
            parseLocation location
    in
    ( { route = route
      , landing = LandingPage.State.initial
      , healthcheck = Healthcheck.initial config
      }
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

        ChangeRoute route ->
            ( { model | route = route }, newUrl (pageToUrl route) )


page : AppModel -> Html.Html Msg
page model =
    case model.route of
        LandingPage ->
            frame (LandingPage.view model.landing)

        Healthcheck ->
            frame (Healthcheck.view model.healthcheck)

        NotFound ->
            frame (Html.text "Not found :(")


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
