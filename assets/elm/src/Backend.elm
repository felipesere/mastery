module Backend exposing (..)

import Debug
import Http
import Json.Decode as Decode
import LandingPage.State
import Lesson
import Messages exposing (Auth(..), Msg(..))


get : String -> Cmd Msg
get url =
    Http.send lessonOrDefault <| loadLessons url


loadPath : String -> Cmd Msg
loadPath url =
    let
        mapping result =
            result
                |> Result.withDefault []
                |> LoadPath

        request =
            Http.get (url ++ "/api/path") Lesson.decodeList
    in
    Debug.log "This is what I am sending" <| Http.send mapping request


loadLessons : String -> Http.Request (List Lesson.Lesson)
loadLessons url =
    Http.get (url ++ "/api/lessons") Lesson.decodeList


lessonOrDefault : Result Http.Error (List Lesson.Lesson) -> Msg
lessonOrDefault result =
    result
        |> Result.withDefault []
        |> forLandingPage


forLandingPage : List Lesson.Lesson -> Msg
forLandingPage lessons =
    ForLandingPage (LandingPage.State.LoadModules lessons)


checkAuth : String -> Cmd Msg
checkAuth url =
    Http.send message <| buildRequest url


buildRequest : String -> Http.Request Auth
buildRequest url =
    Http.request
        { method = "GET"
        , headers = []
        , url = url ++ "/api/authorization/check"
        , body = Http.emptyBody
        , expect = Http.expectJson decode_auth
        , timeout = Nothing
        , withCredentials = True
        }


message : Result Http.Error Auth -> Msg
message result =
    case result of
        Ok auth ->
            ChangeAuth auth

        _ ->
            ChangeAuth Unauthenticated


decode_auth : Decode.Decoder Auth
decode_auth =
    Decode.map2 stateToAuth
        (Decode.field "state" Decode.string)
        (Decode.maybe (Decode.field "user" decodeUser))


decodeUser : Decode.Decoder String
decodeUser =
    Decode.field "name" Decode.string


stateToAuth : String -> Maybe String -> Auth
stateToAuth state maybe_user =
    case Debug.log "login: " ( state, maybe_user ) of
        ( "authenticated", Just user ) ->
            LoggedIn user

        _ ->
            Unauthenticated
