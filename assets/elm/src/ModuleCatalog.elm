module ModuleCatalog exposing (..)

import Card exposing (Display(..), view)
import Html exposing (..)
import Html.Attributes exposing (class, style)
import LandingPage.State exposing (DetailsOptions(..))
import Lesson exposing (..)
import Messages exposing (..)


view : List Lesson -> Html Messages.Msg
view lessons =
    let
        asCard =
            Card.view Animated WithAdd
    in
    div [ class "container is-fluid module-catalog" ]
        (List.map asCard lessons)
