module Lesson exposing (..)

import Json.Decode as Decode
import Language exposing (..)


type LessonId
    = Id Int


type alias Lesson =
    { id : LessonId
    , title : String
    , subtitle : String
    , language : Language
    , description : String
    , outputs : List String
    , outcomes : List String
    , readingMaterial : List String
    }


decodeList : Decode.Decoder (List Lesson)
decodeList =
    Decode.list decode


decode : Decode.Decoder Lesson
decode =
    Decode.map8 Lesson
        id
        (Decode.field "title" Decode.string)
        (Decode.field "subtitle" Decode.string)
        language
        (Decode.field "description" Decode.string)
        (defaultedList "outputs")
        (defaultedList "outcomes")
        (defaultedList "reading")


language : Decode.Decoder Language
language =
    let
        field =
            Decode.field "language" Decode.string
    in
    Decode.map Language.fromString field


id : Decode.Decoder LessonId
id =
    Decode.map Id (Decode.field "id" Decode.int)


defaultedList : String -> Decode.Decoder (List String)
defaultedList name =
    let
        potential =
            Decode.maybe (Decode.field name (Decode.list Decode.string))
    in
    Decode.map (Maybe.withDefault []) potential
