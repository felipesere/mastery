module Messages exposing (..)

import Http
import Lesson exposing (..)
import Navigation exposing (Location)


type alias ModalState =
    { lesson : Lesson
    , options : DetailsOptions
    }


type DetailsOptions
    = WithAdd
    | WithRemove


type Msg
    = LoadModules (Result Http.Error (List Lesson))
    | ShowDetails DetailsOptions LessonId
    | CloseDetails
    | Select Lesson
    | Remove LessonId
    | Search String
    | ChangeLocation Location
