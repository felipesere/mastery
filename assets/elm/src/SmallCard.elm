module SmallCard exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, style)
import Language exposing (Language)
import Lesson exposing (Lesson)


type State
    = Done
    | Todo


view : State -> Lesson -> Html a
view state lesson =
    case state of
        Done ->
            done lesson

        Todo ->
            todo lesson


done lesson =
    Html.div [ class "small-card", style (border lesson.language) ]
        [ Html.div [ class "small-card-title" ] [ Html.text lesson.title, checkmark ]
        ]


todo lesson =
    Html.div [ class "small-card", style (border lesson.language) ]
        [ title lesson
        ]


checkmark =
    span [ class "icon", style [ ( "color", "green" ) ] ]
        [ i [ class "fa fa-check fa-fw" ] [] ]


title lesson =
    Html.div [ class "small-card-title" ] [ Html.text lesson.title ]


border : Language -> List ( String, String )
border language =
    [ ( "border", "1px solid " ++ Language.toColor language )
    ]
