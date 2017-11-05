module StateTests exposing (..)

import Expect exposing (Expectation)
import LandingPage.State as State
import Language exposing (Language(..))
import Lesson exposing (..)
import PersonalPath exposing (..)
import Test exposing (..)


suite : Test
suite =
    let
        initialModel =
            State.initial

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
                        State.select lesson1 initialModel
                in
                Expect.equal nextModel.path.todo [ lesson1 ]
        , test "remove a previously selected lesson" <|
            \_ ->
                let
                    path =
                        PersonalPath.empty

                    model =
                        { initialModel | path = { path | todo = [ lesson1, lesson2 ] } }

                    nextModel =
                        State.remove lesson1.id model
                in
                Expect.equal nextModel.path.todo [ lesson2 ]
        , test "show the details of a lesson" <|
            \_ ->
                let
                    model =
                        { initialModel | lessons = [ lesson1, lesson2 ] }

                    nextModel =
                        State.openDetails lesson1.id State.WithAdd model
                in
                Expect.equal nextModel.modal (Just { lesson = lesson1, options = State.WithAdd })
        , test "close the details of a lesson" <|
            \_ ->
                let
                    model =
                        { initialModel | modal = Just { lesson = lesson1, options = State.WithAdd } }

                    nextModel =
                        State.closeDetails model
                in
                Expect.equal nextModel.modal Nothing
        ]


sampleLesson : Int -> String -> Lesson
sampleLesson id title =
    { id = Id id
    , title = title
    , subtitle = "Some subtitle"
    , description = "Some description"
    , language = Language.fromString "Java"
    , outputs = []
    , outcomes = []
    , readingMaterial = []
    }
