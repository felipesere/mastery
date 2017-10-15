module AppStateTests exposing (..)

import AppState
import Expect exposing (Expectation)
import Lesson exposing (..)
import Messages exposing (..)
import Test exposing (..)


suite : Test
suite =
    let
        initialModel =
            AppState.initial

        lesson1 =
            sampleLesson 1 "foo"

        lesson2 =
            sampleLesson 2 "bar"
    in
    describe "Progression of states through the app"
        [ test "select a lesson for the path to mastey" <|
            \_ ->
                let
                    nextModel =
                        AppState.select lesson1 initialModel
                in
                Expect.equal nextModel.selectedLessons [ lesson1 ]
        , test "remove a previously selected lesson" <|
            \_ ->
                let
                    model =
                        { initialModel | selectedLessons = [ lesson1, lesson2 ] }

                    nextModel =
                        AppState.remove lesson1.id model
                in
                Expect.equal nextModel.selectedLessons [ lesson2 ]
        , test "show the details of a lesson" <|
            \_ ->
                let
                    model =
                        { initialModel | lessons = [ lesson1, lesson2 ] }

                    nextModel =
                        AppState.openDetails lesson1.id WithAdd model
                in
                Expect.equal nextModel.modal (Just { lesson = lesson1, options = WithAdd })
        , test "close the details of a lesson" <|
            \_ ->
                let
                    model =
                        { initialModel | modal = Just { lesson = lesson1, options = WithAdd } }

                    nextModel =
                        AppState.closeDetails model
                in
                Expect.equal nextModel.modal Nothing
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
