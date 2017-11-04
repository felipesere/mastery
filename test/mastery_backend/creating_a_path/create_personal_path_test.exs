defmodule MasteryBackend.CreatingAPath.CreatePersonalPathTest do
  use ExUnit.Case
  alias MasteryBackend.CreatingAPath.CreatePersonalPath
  alias MasteryBackend.CreatingAPath.FetchLessons
  alias MasteryBackend.Lesson

  test "creates a personal path" do
    modules = [1]
    :meck.new(FetchLessons)
    :meck.expect(FetchLessons, :fetch, fn(_modules) -> lessons() end)

    {:ok, path} = CreatePersonalPath.execute("1", modules)

    assert path.todo == lessons()
    assert path.done == []
    assert path.current == nil
  end

  defp lessons do
    [
      %Lesson{id: 1, title: "Example lesson"}
    ]
  end
end
