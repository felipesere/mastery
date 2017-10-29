module MyPath exposing (..)

import Card exposing (..)
import Html
import Html.Attributes exposing (..)
import LandingPage.State exposing (DetailsOptions(..))
import Lesson exposing (..)
import List.Extra
import Messages exposing (..)


type alias Path =
    { completed : List Lesson
    , current : Maybe Lesson
    , todo : List Lesson
    }


initial : List Lesson -> Maybe Path
initial lessons =
    let
        completed =
            List.take 3 lessons

        todo =
            lessons
                |> List.drop 5
                |> List.take 2

        current =
            List.Extra.getAt 4 lessons
    in
    Just
        { completed = completed
        , current = current
        , todo = todo
        }


view : Maybe Path -> Html.Html Msg
view maybe_model =
    let
        todos =
            maybe_model
                |> Maybe.map .todo
                |> Maybe.map todoHtml
                |> Maybe.withDefault (Html.div [] [])

        current =
            maybe_model
                |> Maybe.andThen .current
                |> Maybe.map currentHtml
                |> Maybe.withDefault (Html.div [] [])

        completed =
            maybe_model
                |> Maybe.map .completed
                |> Maybe.map completedHtml
                |> Maybe.withDefault (Html.div [] [])
    in
    Html.div [ class "mdule" ]
        [ todos
        , current
        , completed
        ]


todoHtml todos =
    Html.div [ class "todo" ] ([ Html.text "Todo: " ] ++ List.map (Card.view Static WithAdd) todos)


currentHtml current =
    Html.div [ class "current" ] [ Html.text "Current: ", Card.view Static WithAdd current ]


completedHtml completed =
    Html.div [ class "completed" ] ([ Html.text "Completed: " ] ++ List.map (Card.view Static WithAdd) completed)
