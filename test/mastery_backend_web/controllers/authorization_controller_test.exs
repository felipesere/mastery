defmodule MasteryBackendWeb.AuthorizationControllerTest do
  use MasteryBackendWeb.ConnCase

  test "is not authenticated without cookie", %{conn: conn} do
    conn = get(conn, "/api/authorization/check")

    assert json_response(conn, 200) == %{"state" => "unauthorized"}
  end

  test "authenticated after swapping code for token", %{conn: conn} do
    conn = conn
           |> get("/api/authorization/callback?code=123")
           |> get("/api/authorization/check")

    assert json_response(conn, 200) == %{"state" => "authenticated",
                                         "user" => %{ "name" => "Ron Swanson"}}
  end
end
