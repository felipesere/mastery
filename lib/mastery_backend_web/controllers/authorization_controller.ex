defmodule MasteryBackendWeb.AuthorizationController do
  use MasteryBackendWeb, :controller

  def index(conn, %{"code" => code} ) do
    token = MasteryBackend.Github.exchange_for_token(code).access_token
    IO.puts("The token was: #{token}")

    user = MasteryBackend.Github.user(token)

    MasteryBackend.Users.save(token, user)

    encrypted = MasteryBackend.Secure.encrypt(token)

    conn
    |> Plug.Conn.put_resp_cookie("auth", encrypted, domain: "path2mastery.eu.ngrok.io")
    |> redirect(to: "/")
  end

  def check(conn, _parms) do
    conn
    |> fetch_cookies()
    |> find_cookie()
    |> decrypt()
    |> find_user()
    |> respond(conn)
  end

  defp find_cookie(conn) do
    conn.cookies["auth"]
  end

  defp decrypt(nil), do: :no_cookie
  defp decrypt(value) do
    MasteryBackend.Secure.decrypt(value)
  end

  def find_user({:ok, value}) do
    MasteryBackend.Users.find(value)
  end
  def find_user(_), do: :no_user

  def respond(user, conn) do
    json conn, state(user)
  end

  def state(%MasteryBackend.Github.User{} = user) do
    %{"state" => "authenticated", "user" => user}
  end
  def state(_), do: %{"state" => "unauthorized" }
end

