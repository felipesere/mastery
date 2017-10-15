module Search exposing (..)

import Lesson exposing (Lesson)


type alias SearchState =
    String


init : SearchState
init =
    ""


forTerm : String -> List Lesson -> List Lesson
forTerm term lessons =
    List.filter (matches term) lessons


matches : String -> Lesson -> Bool
matches searchTerm lesson =
    let
        term =
            low searchTerm
    in
    String.contains term (low lesson.title)
        || String.contains term (low lesson.subtitle)
        || String.contains term (low lesson.description)


low : String -> String
low =
    String.toLower
