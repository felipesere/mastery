module Lesson exposing (..)

import Json.Decode as Decode


type alias Lesson =
    { title : String
    , subtitle : String
    , description : String
    }


decode : Decode.Decoder Lesson
decode =
    Decode.map3 Lesson
        (Decode.field "title" Decode.string)
        (Decode.field "subtitle" Decode.string)
        (Decode.field "description" Decode.string)


decodeList : Decode.Decoder (List Lesson)
decodeList =
    Decode.list decode
