defmodule FetchLessonsFake do
  @behaviour MasteryBackend.FetchingLessons.Fetch

  alias MasteryBackend.Lesson

  @spec execute() :: list(%Lesson{})
  def execute do
    [
      %Lesson{
        title: "Ruby TTT",
        subtitle: "subtitle",
        language: "Ruby",
        description: "description",
        outputs: ["output 1"],
        outcomes: ["outcome 1"]
      }
    ]
  end
end
