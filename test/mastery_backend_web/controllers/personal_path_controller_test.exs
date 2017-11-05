defmodule MasteryBackendWeb.PersonalPathControllerTest do
  use MasteryBackendWeb.ConnCase

  alias MasteryBackend.CreatingAPath.CreatePersonalPath
  alias MasteryBackend.FetchingAPath.FetchingPersonalPath
  alias MasteryBackend.Lesson
  import TestExtra

  test "creates a personal path", %{conn: conn} do
    lesson = %Lesson{id: 1}
    :meck.new(CreatePersonalPath)
    :meck.expect(
      CreatePersonalPath,
      :execute,
      fn("1", _modules) -> {:ok, %{todo: [lesson], current: nil, done: []}} end
    )

    conn = conn
           |> MasteryBackendWeb.Gatekeeper.protect("1")
           |> post("/api/path", %{modules: [1]})

    assert json_response(conn, 200) == %{
      "todo" => [deconstruct(lesson)],
      "current" => nil,
      "done" => []
    }
  end

  test "finds a users personal path", %{conn: conn} do
    lesson = %Lesson{id: 1}
    :meck.new(FetchingPersonalPath)
    :meck.expect(
      FetchingPersonalPath,
      :execute,
      fn("1") -> {:ok, %{todo: [lesson], current: nil, done: []}} end
    )

    conn = conn
           |> MasteryBackendWeb.Gatekeeper.protect("1")
           |> get("/api/path")

    assert json_response(conn, 200) == %{
      "todo" => [deconstruct(lesson)],
      "current" => nil,
      "done" => []
    }
  end
end
