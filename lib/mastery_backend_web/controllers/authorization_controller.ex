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

    encrypted = MasteryBackend.Secure.encrypt(user.id)

    conn
    |> Plug.Conn.put_resp_cookie("auth", encrypted)
    |> redirect(to: "/")
  end

  def check(conn, _parms) do
    conn
    |> verify_cookie()
    |> find_user()
    |> respond(conn)
  end

  defp verify_cookie(conn) do
    conn
    |> fetch_cookies()
    |> auth()
    |> decrypt()
  end

  def auth(conn), do: conn.cookies["auth"]

  defp decrypt(nil), do: :no_cookie
  defp decrypt(value) do
    MasteryBackend.Secure.decrypt(value)
  end

  def find_user({:ok, id}) do
    MasteryBackend.Users.find(id)
  end
  def find_user(_), do: :no_user

  def respond(user, conn) do
    json conn, state(user)
  end

  def state({_, %MasteryBackend.Github.User{} = user}) do
    %{"state" => "authenticated", "user" => %{"name" => user.name}}
  end
  def state(_), do: %{"state" => "unauthorized" }
end

