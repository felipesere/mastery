module Backend exposing (get)

import Http
import Lesson
import Messages exposing (Msg(..))


get : String -> Cmd Msg
get url =
    Http.send default <| loadLessons url


loadLessons : String -> Http.Request (List Lesson.Lesson)
loadLessons url =
    Http.get (url ++ "/api/lessons") Lesson.decodeList


default : Result Http.Error (List Lesson.Lesson) -> Msg
default result =
    result
        |> Result.withDefault []
        |> LoadModules
