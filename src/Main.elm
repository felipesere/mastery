module Main exposing (..)

import Html exposing (..)
import Lesson exposing (..)
import ModuleCatalog exposing (..)
import Http

import Backend

type alias Model = List Lesson

type Msg = None | LoadModules (Result Http.Error (List Lesson))

init: (Model, Cmd Msg)
init = ([], Backend.get LoadModules)

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    None -> (model, Cmd.none)
    LoadModules result -> (Result.withDefault [] result, Cmd.none)

view: Model -> Html Msg
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
