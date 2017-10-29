defmodule MasteryBackend.CreatingAPath.CreatePersonalPath do
  alias MasteryBackend.CreatingAPath.FetchLessons

  def execute(modules) do
    lessons = FetchLessons.fetch(modules)

    {:ok, %{todo: lessons, current: nil, done: []}}
  end
end
