module Main exposing (..)

import Array
import Backend
import DetailsModal
import Html exposing (..)
import Http
import Lesson exposing (..)
import ModuleCatalog exposing (..)


type alias Model =
    { lessons : List Lesson
    , lessonDetails : Maybe Lesson
    }


type Msg
    = None
    | LoadModules (Result Http.Error (List Lesson))
    | ShowDetails Int
    | CloseDetails


init : ( Model, Cmd Msg )
init =
    ( { lessons = []
      , lessonDetails = Nothing
      }
    , Backend.get LoadModules
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        None ->
            ( model, Cmd.none )

        LoadModules result ->
            ( { lessons = Result.withDefault [] result
              , lessonDetails = Nothing
              }
            , Cmd.none
            )

        ShowDetails index ->
            let
                details =
                    Array.fromList model.lessons |> Array.get index
            in
            ( { model | lessonDetails = details }, Cmd.none )

        CloseDetails ->
            ( { model | lessonDetails = Nothing }, Cmd.none )


view : Model -> Html Msg
view model =
    let
        modal =
            model.lessonDetails
                |> Maybe.map (DetailsModal.render CloseDetails)
                |> Maybe.withDefault (div [] [])
    in
    div []
        [ ModuleCatalog.render model.lessons ShowDetails
        , modal
        ]


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
