defmodule MasteryBackendWeb.AuthorizationController do
  use MasteryBackendWeb, :controller

  def login(conn, _params) do
    conn
    |> redirect(external: MasteryBackend.Github.authorization_url)
  end

  def index(conn, %{"code" => code} ) do
    user = code
           |> MasteryBackend.Github.exchange_for_token()
           |> MasteryBackend.Github.user()
           |> MasteryBackend.Users.save()

    conn
    |> MasteryBackendWeb.Gatekeeper.protect(user.id)
    |> redirect(to: "/")
  end

  def check(conn, _parms) do
    conn
    |> MasteryBackendWeb.Gatekeeper.verify()
    |> find_user()
    |> respond(conn)
  end

  def find_user({:ok, user_id}) do
    MasteryBackend.Users.find(user_id)
  end
  def find_user(_), do: :no_user

  def respond(user, conn) do
    json conn, state(user)
  end

  def state(%MasteryBackend.Github.User{} = user) do
    %{"state" => "authenticated", "user" => %{"name" => user.name}}
  end
  def state(_), do: %{"state" => "unauthorized" }
end

