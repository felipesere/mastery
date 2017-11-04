module PathDecoderTests exposing (..)

import Expect exposing (Expectation)
import Json.Decode as Decode
import Language exposing (Language)
import Lesson
import PersonalPath
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
                          "done": [],
                          "current": null,
                          "todo": []
                        }
                        """

                    output =
                        Decode.decodeString PersonalPath.decode json
                in
                Expect.equal output
                    (Ok
                        { done = []
                        , current = Nothing
                        , todo = []
                        }
                    )
        ]


lesson =
    { id = Lesson.Id 1
    , title = "Elixir Guilded Rose"
    , subtitle = "Refactoring and pattern matching"
    , description = "Bla bla bla"
    , language = Language.fromString "Elixir"
    , outputs = []
    , outcomes = []
    , readingMaterial = []
    }
