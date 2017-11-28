module PersonalPathTest exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import PersonalPath exposing (Path, moveTodoLessonUp)
import Lesson exposing (Lesson)
import Language

suite : Test
suite =
  describe "PersonalPath"
    [describe "moveTodoLessonUp"
      [ test "moves lesson forward one in order" <|
        \_ ->
          let
              lessonA = Lesson
                (Lesson.Id 1)
                "Test Lesson Title" 
                "Lesson Subtitle" 
                (Language.fromString "Language") 
                "Description..." 
                [] [] []

              lessonB =
                { lessonA | id = (Lesson.Id 2), title = "Test Lesson 2 Title" }

              lessonC =
                { lessonA | id = (Lesson.Id 3), title = "Test Lesson 3 Title" }

              todos =
                [lessonA, lessonB, lessonC]

              path =
                Path [] Nothing todos 

              updatedTodos =
                [lessonB, lessonA, lessonC]
          in
          Expect.equal
           (Just { path | todo = updatedTodos })
           (moveTodoLessonUp (Just path) lessonB)
      ]
    ]
