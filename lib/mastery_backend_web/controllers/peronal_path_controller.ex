defmodule MasteryBackendWeb.PersonalPathController do
  use MasteryBackendWeb, :controller

  def create(conn, params) do
    {_, user} = conn
                |> verify_cookie()
                |> find_user()

    path = create_path(params)
    MasteryBackend.Paths.upsert(user, path)

    conn
    |> send_resp(200, "")
  end

  def index(conn, _params) do
    {_, user} = conn
                |> verify_cookie()
                |> find_user()

    {_, path} = MasteryBackend.Paths.find(user.id)

    json conn, path
  end

  def create_path(%{"modules" => modules}) do
    %MasteryBackend.Paths.PersonalPath{todo: modules, current: :none, done: []}
  end

  # This is copied straight out of the authorization_controller
  defp verify_cookie(conn) do
    conn
    |> fetch_cookies()
    |> auth()
    |> decrypt()
  end

  defp decrypt(nil), do: :no_cookie
  defp decrypt(value) do
    MasteryBackend.Secure.decrypt(value)
  end

  def auth(conn), do: conn.cookies["auth"]

  def find_user({:ok, id}) do
    MasteryBackend.Users.find(id)
  end
  def find_user(_), do: :no_user
end
