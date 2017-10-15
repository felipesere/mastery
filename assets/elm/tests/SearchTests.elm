module SearchTests exposing (..)

import Expect exposing (Expectation)
import Lesson exposing (..)
import Search
import Test exposing (..)


suite : Test
suite =
    let
        foo =
            sampleLesson 1 "foo"

        bar =
            sampleLesson 2 "bar"
    in
    describe "Using the search bar"
        [ test "finds word in title" <|
            \_ ->
                let
                    matching =
                        Search.forTerm "fo" [ foo, bar ]
                in
                Expect.equal matching [ foo ]
        , test "finds word in subtitle" <|
            \_ ->
                let
                    subtitle =
                        { foo | subtitle = "xyz" }

                    matching =
                        Search.forTerm "xyz" [ foo, subtitle ]
                in
                Expect.equal matching [ subtitle ]
        , test "finds word in description" <|
            \_ ->
                let
                    description =
                        { foo | description = "xyz" }

                    matching =
                        Search.forTerm "xyz" [ foo, description ]
                in
                Expect.equal matching [ description ]
        , test "ignores case" <|
            \_ ->
                let
                    matching =
                        Search.forTerm "FO" [ foo, bar ]
                in
                Expect.equal matching [ foo ]
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
