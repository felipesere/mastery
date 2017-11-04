defmodule MasteryBackend.CreatingAPath.FetchLessonsTest do
  use ExUnit.Case
  alias MasteryBackend.CreatingAPath.FetchLessons

  # todo: improve locality of state for this test. i.e json file with tests
  test "fetches lessons based on ids" do
    ids = [1]

    lessons = FetchLessons.fetch(ids)

    assert Enum.map(lessons, &(&1.id)) == ids
  end
end
