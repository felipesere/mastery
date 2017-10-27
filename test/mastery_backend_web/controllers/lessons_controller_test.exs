defmodule MasteryBackendWeb.LessonsControllerTest do
  use MasteryBackendWeb.ConnCase

  test "returns all the lessons", %{conn: conn} do
    conn = get conn, "/api/lessons"

    assert conn.status == 200
    assert conn.resp_body =~ "Ruby 3x3 TTT"
  end
end
