module PersonalPath exposing (..)

import Json.Decode as Decode
import Json.Encode as Encode exposing (..)
import Lesson exposing (..)


type alias Path =
    { done : List Lesson
    , current : Maybe Lesson
    , todo : List Lesson
    }


empty : Path
empty =
    { done = []
    , current = Nothing
    , todo = []
    }


remove : LessonId -> Path -> Path
remove id path =
    let
        todo =
            List.filter (\l -> l.id /= id) path.todo
    in
    { path | todo = todo }


select : Lesson -> Path -> Path
select lesson path =
    let
        todo =
            lesson :: path.todo
    in
    { path | todo = todo }


decode : Decode.Decoder Path
decode =
    Decode.map3 Path
        (Decode.field "done" (Decode.list Lesson.decode))
        (Decode.field "current" (Decode.nullable Lesson.decode))
        (Decode.field "todo" (Decode.list Lesson.decode))


encode : Path -> Encode.Value
encode path =
    Encode.object
        [ ( "todo", modules path.todo )
        , ( "current", current path.current )
        , ( "done", modules path.done )
        ]


current : Maybe Lesson -> Encode.Value
current maybe_lesson =
    case maybe_lesson of
        Just lesson ->
            encodeId lesson

        Nothing ->
            Encode.null


modules : List Lesson.Lesson -> Encode.Value
modules lessons =
    Encode.list (List.map encodeId lessons)


encodeId : Lesson.Lesson -> Encode.Value
encodeId lesson =
    case lesson.id of
        Id v ->
            int v
