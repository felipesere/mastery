defmodule MasteryBackendWeb.LessonsControllerTest do
  use MasteryBackendWeb.ConnCase

  test "returns all the lessons" do
    conn = get build_conn(), "/api/lessons"

    assert conn.status == 200
    assert conn.resp_body =~ "Ruby 3x3 TTT"
  end
end
