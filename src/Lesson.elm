module Lesson exposing (..)

import Json.Decode as Decode


type alias Lesson =
    { title : String
    , subtitle : String
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
    Decode.map6 Lesson
        (Decode.field "title" Decode.string)
        (Decode.field "subtitle" Decode.string)
        (Decode.field "description" Decode.string)
        (defaultedList "outputs")
        (defaultedList "outcomes")
        (defaultedList "reading")


defaultedList : String -> Decode.Decoder (List String)
defaultedList name =
    let
        potential =
            Decode.maybe (Decode.field name (Decode.list Decode.string))
    in
    Decode.map (Maybe.withDefault []) potential
