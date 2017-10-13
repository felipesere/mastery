module Main exposing (..)

import Html exposing (..)
import Lesson exposing (..)
import ModuleCatalog exposing (..)
import Http

type alias Model = List LessonExtras

type Msg = None | LoadModules (Result Http.Error (List Lesson))

init: (Model, Cmd Msg)
init = ([], send)

send: Cmd Msg
send =
  Http.send LoadModules loadLessons

loadLessons: Http.Request (List Lesson)
loadLessons =
  Http.get "http://localhost:3000/modules" Lesson.decodeList

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    None -> (model, Cmd.none)
    LoadModules result -> (extraftFrom result, Cmd.none)


extraftFrom: Result Http.Error (List Lesson) -> Model
extraftFrom result =
  case result of
    Ok(lessons) -> List.map (Lesson.defaults) lessons
    _ -> []

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
