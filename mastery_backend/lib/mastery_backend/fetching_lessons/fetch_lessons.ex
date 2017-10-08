defmodule MasteryBackend.FetchingLessons.FetchLessons do
  alias MasteryBackend.Lesson

  @type json_file :: String.t

  @spec execute(json_file) :: list(%Lesson{})
  def execute(json_file) do
    json_file
    |> String.split(".")
    |> read_lessons
  end

  @spec read_lessons(list(String.t)) :: list(%Lesson{})
  defp read_lessons([_path, "json"] = file) do
    file
    |> Enum.join(".")
    |> File.read!
    |> Poison.decode(as: [%Lesson{}])
    |> validate_lessons
  end
  defp read_lessons(_file), do: [%Lesson{title: "Invalid File Path"}]

  defp validate_lessons({:ok, lessons}), do: lessons
  defp validate_lessons({:error, :invalid, _}) do
    [%Lesson{title: "Invalid JSON content"}]
  end
end
