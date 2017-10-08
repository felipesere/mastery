defmodule MasteryBackend.FetchingLessons.Fetch do
  alias MasteryBackend.Lesson

  @callback execute() :: list(%Lesson{})
end
