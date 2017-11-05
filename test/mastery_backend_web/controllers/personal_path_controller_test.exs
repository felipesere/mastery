defmodule MasteryBackendWeb.PersonalPathControllerTest do
  use MasteryBackendWeb.ConnCase

  alias MasteryBackend.CreatingAPath.CreatePersonalPath
  alias MasteryBackend.FetchingAPath.FetchingPersonalPath
  alias MasteryBackend.Lesson
  alias MasteryBackend.PersonalPath
  import TestExtra

  test "creates a personal path", %{conn: conn} do
    lesson = %Lesson{id: 1}
    :meck.new(CreatePersonalPath)
    :meck.expect(
      CreatePersonalPath,
      :execute,
      fn("1", _modules) -> {:ok, %PersonalPath{todo: [lesson], current: nil, done: []}} end
    )

    conn = conn
           |> MasteryBackendWeb.Gatekeeper.protect("1")
           |> post("/api/path", %{todo: [1], current: nil, done: []})

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

  test "missing data is a bad request", %{conn: conn} do
    conn = conn
           |> MasteryBackendWeb.Gatekeeper.protect("1")
           |> post("/api/path", %{modules: [1]})

    assert response(conn, 400)
  end
end
