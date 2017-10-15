defmodule MasteryBackend.FetchingLessons.FetchLessonsTest do
  use ExUnit.Case
  alias MasteryBackend.FetchingLessons.FetchLessons
  alias MasteryBackend.Lesson

  setup do
    json_file = "test/data/json_file.json"
    text_file = "test/data/file.txt"
    File.touch!(json_file)
    File.touch!(text_file)

    on_exit fn ->
      File.rm!(json_file)
      File.rm!(text_file)
    end

    {:ok, %{json_file: json_file, text_file: text_file}}
  end

  test "reads lessons from a given json file", %{json_file: json_file} do
    lesson = [%Lesson{
        id: 1,
        title: "Ruby TTT",
        subtitle: "subtitle",
        language: "ruby",
        description: "description",
        outputs: [],
        outcomes: [],
        reading: []
      }] |> Poison.encode!
    File.write!(json_file, lesson)

    lesson = FetchLessons.execute(json_file) |> List.first

    assert lesson.id == 1
    assert lesson.title
    assert lesson.subtitle
    assert lesson.language
    assert lesson.description
    assert lesson.outputs
    assert lesson.outcomes
  end

  test "can handle invalid file paths", %{text_file: text_file} do
    lesson = FetchLessons.execute(text_file) |> List.first

    assert lesson.title == "Invalid File Path"
  end

  test "can handle invalid JSON content", %{json_file: json_file} do
    File.write!(json_file, "[")

    lesson = FetchLessons.execute(json_file) |> List.first

    assert lesson.title == "Invalid JSON content"
  end
end
