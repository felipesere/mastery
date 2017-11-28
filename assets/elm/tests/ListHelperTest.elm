module ListHelperTest exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import ListHelper exposing (moveItemUp)

suite : Test
suite =
  describe "moveItemUp"
    [ test "moves item up one place in list" <|
        \_ ->
          Expect.equal ([1, 3, 2, 4]) (moveItemUp [1, 2, 3, 4] 3)
    , test "returns nothing when item is already first" <|
        \_ ->
          Expect.equal [1, 2, 3, 4] (moveItemUp [1, 2, 3, 4] 1)
    , test "returns nothing when item not in list" <|
        \_ ->
          Expect.equal [1, 2, 3, 4] (moveItemUp [1, 2, 3, 4] 5)
    ]
