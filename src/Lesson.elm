module Lesson exposing (..)

import Json.Decode as Decode


type alias Lesson =
    { title : String
    , subtitle : String
    , description : String
    , outputs : List String
    }


decode : Decode.Decoder Lesson
decode =
    Decode.map4 Lesson
        (Decode.field "title" Decode.string)
        (Decode.field "subtitle" Decode.string)
        (Decode.field "description" Decode.string)
        (Decode.field "outputs" (Decode.list Decode.string))


decodeList : Decode.Decoder (List Lesson)
decodeList =
    Decode.list decode
