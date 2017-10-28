module PersonalPath exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import LandingPage.State exposing (DetailsOptions(..))
import Language exposing (Language(..))
import Lesson exposing (..)
import List.Extra
import Messages exposing (..)
import SmallCard exposing (State(..), view)
import Style exposing (..)


type alias Path =
    { completed : List Lesson
    , current : Maybe Lesson
    , todo : List Lesson
    }


initial : List Lesson -> Maybe Path
initial lessons =
    let
        completed_nr =
            5

        completed =
            List.take completed_nr lessons

        todo =
            lessons
                |> List.drop (completed_nr + 3)
                |> List.take 7

        current =
            List.Extra.getAt 4 lessons
    in
    Just
        { completed = completed
        , current = current
        , todo = todo
        }



-- Super rough and dirty... needs love


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
    Html.div [ class "module centered" ]
        [ todos
        , current
        , completed
        ]


todoHtml todos =
    Html.div [ class "mypath-todo" ] (List.map (SmallCard.view Todo) todos)


currentHtml current =
    Html.div [ class "mypath-current" ] [ viewLesson current ]


completedHtml completed =
    Html.div [ class "mypath-completed" ] (List.map (SmallCard.view Done) completed)


viewLesson : Lesson -> Html a
viewLesson lesson =
    let
        color =
            border lesson.language
    in
    div [ class "card", style color ]
        [ header [ class "card-header" ]
            [ p [ class "card-header-title is-centered" ] [ text lesson.title ]
            ]
        , div [ class "card-content content" ] [ text lesson.subtitle ]
        , footer [ class "card-footer" ] []
        ]


border : Language -> List Style
border language =
    [ Style.border <| "4px solid " ++ Language.toColor language
    ]
