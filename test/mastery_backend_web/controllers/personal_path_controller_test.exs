defmodule MasteryBackendWeb.PersonalPathControllerTest do
  use MasteryBackendWeb.ConnCase

  setup do
    user =  %MasteryBackend.Github.User{name: "Ron Swanson", id: "12", github_token: nil}
    MasteryBackend.Users.save(user)

    [user: user]
  end

  @tag :skip
  test "can create a new path", %{conn: conn, user: user} do
    data = %{:modules => [1,2]}

    conn
    |> authenticated_as(user.id)
    |> post("/api/path", data)
    |> response(200)

    assert conn
           |> authenticated_as(user.id)
           |> get("/api/path")
           |> json_response( 200) === %{"todo" => [1,2], "current" => nil, "done" => []}
  end

  defp authenticated_as(conn, id) do
    put_req_cookie(conn, "auth", MasteryBackend.Secure.encrypt(id))
  end
end
