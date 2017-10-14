module Lesson exposing (..)

import Json.Decode as Decode


type alias Lesson =
    { title : String
    , subtitle : String
    }


decode : Decode.Decoder Lesson
decode =
    Decode.map2 Lesson
        (Decode.field "title" Decode.string)
        (Decode.field "subtitle" Decode.string)


decodeList : Decode.Decoder (List Lesson)
decodeList =
    Decode.list decode
