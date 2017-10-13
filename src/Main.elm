module Main exposing (..)

import Html exposing (..)
import Lesson exposing (..)
import ModuleCatalog exposing (..)

type alias Model = List Lesson

type Msg = None

init: Model
init =
  [
    {
      detailsOpen = False
    , title = "Something"
    , subtitle = "Else"
    }
    ,
    {
      detailsOpen = True
    , title = "Foo"
    , subtitle = "Bar"
    }
  ]


update: Msg -> Model -> Model
update msg model =
  model

view: Model -> Html Msg
view model =
    ModuleCatalog.render model None

main =
  Html.beginnerProgram { model = init, view = view, update = update }
