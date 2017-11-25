module ListHelper exposing (moveItemUp)

import List.Extra exposing (findIndex, swapAt)

moveItemUp : List a -> a -> Maybe (List a)
moveItemUp list item =
  getSwapIndices list item
  |> Maybe.andThen (\(a, b) -> swapAt a b list)

getSwapIndices : List a -> a -> Maybe (Int, Int)
getSwapIndices  list item =
  case findIndex (\current -> current == item) list of
    Just 0 ->
      Nothing
    Just n ->
      Just (n, n - 1)
    Nothing ->
      Nothing
