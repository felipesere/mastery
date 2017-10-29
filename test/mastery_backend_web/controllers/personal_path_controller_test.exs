defmodule MasteryBackendWeb.PersonalPathControllerTest do
  use MasteryBackendWeb.ConnCase
  alias MasteryBackend.CreatingAPath.CreatePersonalPath
  alias MasteryBackend.Lesson
  import TestExtra

  test "creates a personal path" do
    params = %{modules: [1]}
    lesson = %Lesson{id: 1}
    :meck.new(CreatePersonalPath)
    :meck.expect(
      CreatePersonalPath,
      :execute,
      fn(_modules) -> {:ok, %{todo: [lesson], current: nil, done: []}} end
    )

    conn = post build_conn(), "/api/path", params

    assert json_response(conn, 200) == %{
      "todo" => [deconstruct(lesson)],
      "current" => nil,
      "done" => []
    }
  end
end
