module Card exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import Language exposing (Language)
import Lesson exposing (Lesson)
import Messages exposing (DetailsOptions, Msg(..))
import Style exposing (..)


type Display
    = Static
    | Animated


view : Display -> DetailsOptions -> Lesson -> Html Msg
view display options lesson =
    let
        color =
            border lesson.language

        animated =
            animtion display
    in
    div [ class animated, style color ]
        [ header [ class "card-header" ]
            [ p [ class "card-header-title is-centered" ] [ text lesson.title ]
            ]
        , div [ class "card-content content" ] [ text lesson.subtitle ]
        , footer [ class "card-footer" ]
            [ a [ onClick (ShowDetails options lesson.id), class "button card-footer-item" ] [ text "Open" ]
            ]
        ]


border : Language -> List Style
border language =
    [ Style.border <| "4px solid " ++ Language.toColor language
    ]


animtion : Display -> String
animtion display =
    case display of
        Static ->
            "card"

        Animated ->
            "card card-animated"
