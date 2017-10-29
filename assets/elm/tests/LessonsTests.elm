module LessonsTests exposing (..)

import Expect exposing (Expectation)
import Json.Decode as Decode
import Language exposing (Language)
import Lesson
import Test exposing (..)


suite : Test
suite =
    describe "How to parse the lessons JSON"
        [ test "parses with reading list" <|
            \_ ->
                let
                    json =
                        """
                        {
                          "id": 1,
                          "title":"Elixir Guilded Rose",
                          "subtitle":"Refactoring and pattern matching",
                          "language":"Elixir",
                          "description":"Bla bla bla",
                          "outputs":[],
                          "outcomes":[],
                          "reading" : []
                        }
                      """

                    output =
                        Decode.decodeString Lesson.decode json
                in
                Expect.equal output
                    (Ok
                        { id = Lesson.Id 1
                        , title = "Elixir Guilded Rose"
                        , subtitle = "Refactoring and pattern matching"
                        , description = "Bla bla bla"
                        , language = Language.fromString "Elixir"
                        , outputs = []
                        , outcomes = []
                        , readingMaterial = []
                        }
                    )
        , test "defaults to empty list when reading not presetn" <|
            \_ ->
                let
                    json =
                        """
                        {
                          "id": 1,
                          "title":"Elixir Guilded Rose",
                          "subtitle":"Refactoring and pattern matching",
                          "language":"Elixir",
                          "description":"Bla bla bla",
                          "outputs":[],
                          "outcomes":[]
                        }
                      """

                    output =
                        Decode.decodeString Lesson.decode json
                in
                Expect.equal output
                    (Ok
                        { id = Lesson.Id 1
                        , title = "Elixir Guilded Rose"
                        , subtitle = "Refactoring and pattern matching"
                        , description = "Bla bla bla"
                        , language = Language.fromString "Elixir"
                        , outputs = []
                        , outcomes = []
                        , readingMaterial = []
                        }
                    )
        ]
