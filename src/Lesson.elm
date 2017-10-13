module Lesson exposing (..)

import Json.Decode as Decode

type alias Lesson =
  {
    title: String
    , subtitle: String
  }

type alias LessonExtras =
  {
    lesson: Lesson
    , detailsOpen: Bool
  }

defaults: Lesson -> LessonExtras
defaults lesson =
  {
    lesson = lesson
    , detailsOpen = False
  }

decode: Decode.Decoder Lesson
decode =
  Decode.map2 Lesson
  (Decode.field "title" Decode.string)
  (Decode.field "subtitle" Decode.string)

decodeList: Decode.Decoder (List Lesson)
decodeList =
  Decode.list decode
