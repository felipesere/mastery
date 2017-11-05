module PersonalPath exposing (..)

import Json.Decode as Decode
import Json.Encode as Encode exposing (..)
import Lesson exposing (..)


type alias Path =
    { done : List Lesson
    , current : Maybe Lesson
    , todo : List Lesson
    }


decode : Decode.Decoder Path
decode =
    Decode.map3 Path
        (Decode.field "done" (Decode.list Lesson.decode))
        (Decode.field "current" (Decode.nullable Lesson.decode))
        (Decode.field "todo" (Decode.list Lesson.decode))


encodeSelected : List Lesson.Lesson -> Encode.Value
encodeSelected lessons =
    Encode.object [ ( "modules", modules lessons ) ]


modules : List Lesson.Lesson -> Encode.Value
modules lessons =
    Encode.list (List.map encodeId lessons)


encodeId : Lesson.Lesson -> Encode.Value
encodeId lesson =
    case lesson.id of
        Id v ->
            int v
