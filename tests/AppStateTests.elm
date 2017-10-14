module AppStateTests exposing (..)

import AppState
import Expect exposing (Expectation)
import Lesson exposing (..)
import Test exposing (..)


initialModel =
    AppState.initial


suite : Test
suite =
    describe "Progression of states through the app"
        [ test "select a lesson for the path to mastey" <|
            \_ ->
                let
                    lesson =
                        sampleLesson 1 "foo"

                    model =
                        initialModel

                    nextModel =
                        AppState.select lesson model
                in
                Expect.equal nextModel.selectedLessons [ lesson ]
        , test "remove a previously selected lesson" <|
            \_ ->
                let
                    lesson1 =
                        sampleLesson 1 "foo"

                    lesson2 =
                        sampleLesson 2 "bar"

                    model =
                        { initialModel | selectedLessons = [ lesson1, lesson2 ] }

                    nextModel =
                        AppState.remove lesson1.id model
                in
                Expect.equal nextModel.selectedLessons [ lesson2 ]
        , todo "show the details of a lesson"
        , todo "close the details of a lesson"
        ]


sampleLesson : Int -> String -> Lesson
sampleLesson id title =
    { id = Id id
    , title = title
    , subtitle = "Some subtitle"
    , description = "Some description"
    , outputs = []
    , outcomes = []
    , readingMaterial = []
    }
