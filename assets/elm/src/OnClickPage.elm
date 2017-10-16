module OnClickPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href, style)
import Html.Events exposing (..)
import Json.Decode
import Messages exposing (..)
import Routing exposing (..)


onPreventDefaultClick : msg -> Attribute msg
onPreventDefaultClick message =
    onWithOptions
        "click"
        { defaultOptions | preventDefault = True }
        (Json.Decode.succeed message)


onClickPage : Route -> List (Attribute Msg)
onClickPage page =
    [ style [ ( "pointer", "cursor" ) ]
    , href (pageToUrl page)
    , onPreventDefaultClick (ChangeRoute page)
    ]
