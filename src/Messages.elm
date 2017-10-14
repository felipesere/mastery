module Messages exposing (..)

import Http
import Lesson exposing (..)


type alias ModalState =
    { lesson : Lesson
    , options : DetailsOptions
    }


type Msg
    = None
    | LoadModules (Result Http.Error (List Lesson))
    | ShowDetails DetailsOptions LessonId
    | CloseDetails
    | Select Lesson
    | Remove LessonId


type DetailsOptions
    = WithAdd
    | WithRemove
