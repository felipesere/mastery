module DetailsModal exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import LandingPage.State exposing (DetailsOptions(..), ModalState, Msg(..))
import Lesson exposing (..)
import Markdown
import Messages exposing (..)
import ReadingList


view : Maybe ModalState -> Html Messages.Msg
view maybeState =
    maybeState
        |> Maybe.map real
        |> Maybe.withDefault (div [] [])


real : ModalState -> Html Messages.Msg
real modal =
    div [ class "modal is-active" ]
        [ background
        , card modal
        ]


card : ModalState -> Html Messages.Msg
card { options, lesson } =
    let
        button =
            case options of
                WithAdd ->
                    add (Select lesson)

                WithRemove ->
                    remove (Remove lesson.id)
    in
    div [ class "modal-card" ]
        [ header lesson
        , body lesson
        , footer button
        ]


add : LandingPage.State.Msg -> Html Messages.Msg
add select =
    button [ onClick (ForLandingPage select), class "button" ] [ Html.text "Add" ]


remove : LandingPage.State.Msg -> Html Messages.Msg
remove remove =
    button [ onClick (ForLandingPage remove), class "button is-info" ] [ Html.text "Remove" ]


header : Lesson -> Html Messages.Msg
header lesson =
    Html.header [ class "modal-card-head" ]
        [ p [ class "modal-card-title" ] [ Html.text lesson.title ]
        , button [ onClick (ForLandingPage CloseDetails), class "delete" ] []
        ]


body : Lesson -> Html a
body lesson =
    Html.section [ class "modal-card-body" ]
        [ Markdown.toHtml [ class "description" ] lesson.description
        , list "Outputs" lesson.outputs
        , list "Outcomes" lesson.outcomes
        , ReadingList.view lesson.readingMaterial
        ]


footer : Html Messages.Msg -> Html Messages.Msg
footer button =
    Html.footer [ class "modal-card-foot" ]
        [ button ]


list : String -> List String -> Html a
list name elements =
    let
        items =
            List.map (\e -> Html.li [] [ Html.text e ]) elements
    in
    div [ class "content" ]
        [ Html.text name
        , ul [] items
        ]


background : Html a
background =
    div [ class "modal-background" ] []
