module LoginPage.LoginPage exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Messages exposing (Auth(..), Msg(..))


view : Auth -> Html Msg
view auth =
    div [ class "container" ] [ loginButton auth ]


loginButton : Auth -> Html Msg
loginButton auth =
    case auth of
        Unauthenticated ->
            showLogin

        LoggedIn username ->
            greet username


greet : String -> Html Msg
greet username =
    div [] [ text username ]


showLogin : Html Msg
showLogin =
    div [ class "module" ]
        [ div [ class "login" ]
            [ a [ class "button", href "/api/authorization/login" ] [ Html.text "Login with GitHub" ]
            ]
        ]
