module Path exposing (..)

import Card exposing (Display(..), view)
import Html exposing (..)
import Html.Attributes exposing (class, style)
import Html.Events exposing (..)
import LandingPage.State exposing (DetailsOptions(..))
import Lesson exposing (Lesson)
import Messages exposing (..)


view : List Lesson -> Html Messages.Msg
view lessons =
    case lessons of
        [] ->
            Html.text ""

        any ->
            div [ class "path visibiity" ]
                ([ saveButton ]
                    ++ viewLesson any
                )


saveButton =
    button [ class "button", onClick SavePath ] [ Html.text "Save" ]


viewLesson : List Lesson -> List (Html Messages.Msg)
viewLesson lessons =
    let
        asCard =
            Card.view Static WithRemove
    in
    List.map asCard lessons
