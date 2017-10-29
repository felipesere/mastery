defmodule MasteryBackend.CreatingAPath.FetchLessons do

  # todo revisit the following line. Exists in the lessons controller
  @json_file Application.get_env(:mastery_backend, :lessons_file)

  def fetch(ids) do
    MasteryBackend.FetchingLessons.FetchLessons.execute(@json_file)
    |> Enum.filter(fn(lesson) -> lesson.id in ids end)
  end
end
