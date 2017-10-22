module AuthenticationTests exposing (..)

import Backend
import Expect exposing (Expectation)
import Json.Decode as Decode
import Messages exposing (Auth(..))
import Test exposing (..)


suite : Test
suite =
    describe "How to parse the auth-check JSON"
        [ test "parses with user" <|
            \_ ->
                let
                    json =
                        """
                        {
                          "user": {
                            "name": "Felipe Seré"
                           },
                          "state": "authenticated"
                        }
                      """

                    output =
                        Decode.decodeString Backend.decode_auth json
                in
                Expect.equal output (Ok (LoggedIn "Felipe Seré"))
        , test "parses without user" <|
            \_ ->
                let
                    json =
                        """
                        {
                          "state": "authenticated"
                        }
                      """

                    output =
                        Decode.decodeString Backend.decode_auth json
                in
                Expect.equal output (Ok Unauthenticated)
        ]
