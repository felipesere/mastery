module PersonalPath exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Decode as Decode
import Language exposing (Language(..))
import Lesson exposing (..)
import List.Extra
import SmallCard exposing (State(..), view)


type alias Path =
    { completed : List Lesson
    , current : Maybe Lesson
    , todo : List Lesson
    }


decode : Decode.Decoder Path
decode =
    Decode.map3 Path
        (Decode.field "todo" (Decode.list Lesson.decode))
        (Decode.field "current" (Decode.nullable Lesson.decode))
        (Decode.field "done" (Decode.list Lesson.decode))


view : Maybe Path -> Html.Html a
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



-- dupplicated


border : Language -> List ( String, String )
border language =
    [ ( "border", "4px solid " ++ Language.toColor language )
    ]
