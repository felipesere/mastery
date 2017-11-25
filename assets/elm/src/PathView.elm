module PathView exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Language exposing (Language(..))
import Lesson exposing (..)
import PersonalPath exposing (Path)
import SmallCard exposing (State(..), view)
import Messages exposing (Msg(..))


view : Maybe Path -> Html.Html Msg
view maybe_model =
    maybe_model
        |> Maybe.map viewPath
        |> Maybe.withDefault (Html.text "No path yet")


viewPath : Path -> Html.Html Msg
viewPath { done, current, todo } =
    let
        todos =
            todoHtml todo

        current_task =
            current
                |> Maybe.map currentHtml
                |> Maybe.withDefault (Html.text "")

        completed =
            doneHtml done
    in
    Html.div [ class "module centered" ]
        [ todos
        , current_task
        , completed
        ]


todoHtml : List Lesson -> Html Msg
todoHtml todos =
    Html.div [ class "path-layout" ]
             [ Html.div [ class "mypath-todo" ] (allLessons todos) ]

allLessons : List Lesson -> List (Html Msg)
allLessons listLessons =
  let
      firstLesson =
        listLessons
        |> List.head
        |> Maybe.map firstLessonWrapper

      restLessons =
        listLessons
        |> List.tail
        |> Maybe.map (List.map lessonWrapper)

      allLessons =
        Maybe.map2 (::) firstLesson restLessons
  in
      Maybe.withDefault [] allLessons

firstLessonWrapper : Lesson -> Html Msg
firstLessonWrapper lesson =
  Html.div [ class "path-lesson" ]
           [ (SmallCard.view Todo lesson) ]

lessonWrapper : Lesson -> Html Msg
lessonWrapper lesson =
  Html.div [ class "path-lesson" ]
           [ (SmallCard.view Todo lesson), (Html.button [ onClick (MoveUp lesson) ] [ text "^" ]) ]

currentHtml : Lesson -> Html a
currentHtml current =
    Html.div [ class "mypath-current" ] [ viewLesson current ]


doneHtml : List Lesson -> Html a
doneHtml completed =
    Html.div [ class "mypath-completed" ] (List.map (SmallCard.view Done) completed)


viewLesson : Lesson -> Html a
viewLesson lesson =
    let
        color =
            border lesson.language
    in
    Html.div [ class "card", style color ]
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
