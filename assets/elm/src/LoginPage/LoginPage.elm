module LoginPage.LoginPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Messages exposing (Auth(..), Msg(..))


type alias Model =
    { clientId : String
    , loginState : Auth
    }


initial { githubClientId } =
    { clientId = githubClientId
    , loginState = Unauthenticated
    }


update : Model -> Auth -> Model
update model auth =
    { model | loginState = auth }


view : Model -> Html Msg
view model =
    div [ class "container" ] [ loginButton model ]


loginButton model =
    case model.loginState of
        Unauthenticated ->
            showLogin model.clientId

        LoggedIn username ->
            greet username


greet username =
    div [] [ text username ]


showLogin clientId =
    a [ class "button", href (link clientId) ] [ Html.text "Github" ]


link : String -> String
link clientId =
    "https://github.com/login/oauth/authorize?client_id=" ++ clientId ++ "&scope=user%20read:org"
