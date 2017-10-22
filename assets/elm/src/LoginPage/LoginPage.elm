module LoginPage.LoginPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Messages exposing (Auth(..), Msg(..))


type alias Model =
    { loginState : Auth
    }


initial : Model
initial =
    { loginState = Unauthenticated
    }


update : Model -> Auth -> Model
update model auth =
    { model | loginState = auth }


view : Model -> Html Msg
view model =
    div [ class "container" ] [ loginButton model ]


loginButton : Model -> Html Msg
loginButton model =
    case model.loginState of
        Unauthenticated ->
            showLogin

        LoggedIn username ->
            greet username


greet : String -> Html Msg
greet username =
    div [] [ text username ]


showLogin : Html Msg
showLogin =
    a [ class "button", href "/api/authorization/login" ] [ Html.text "Github" ]
