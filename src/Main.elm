module Main exposing (..)

import Backend
import Html exposing (..)
import Http
import Lesson exposing (..)
import ModuleCatalog exposing (..)


type alias Model =
    List Lesson


type Msg
    = None
    | LoadModules (Result Http.Error (List Lesson))


init : ( Model, Cmd Msg )
init =
    ( [], Backend.get LoadModules )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        None ->
            ( model, Cmd.none )

        LoadModules result ->
            ( Result.withDefault [] result, Cmd.none )


view : Model -> Html Msg
view model =
    ModuleCatalog.render model None


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
