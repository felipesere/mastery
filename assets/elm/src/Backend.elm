module Backend exposing (get)

import Http
import Lesson


get : (Result Http.Error (List Lesson.Lesson) -> a) -> Cmd a
get msg =
    Http.send msg loadLessons


loadLessons : Http.Request (List Lesson.Lesson)
loadLessons =
    Http.get "http://localhost:4000/api/lessons" Lesson.decodeList
