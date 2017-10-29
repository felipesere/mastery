defmodule MasteryBackendWeb.PersonalPathController do
  use MasteryBackendWeb, :controller

  alias MasteryBackend.FetchingLessons.FetchLessons

  @lessons_file Application.get_env(:mastery_backend, :lessons_file)

  def lessons(ids) do
    FetchLessons.execute(@lessons_file)
    |> Enum.filter(fn(lesson) -> lesson.id in ids end)
  end

  def create(conn, params) do
    {_, user} = conn
                |> verify_cookie()
                |> find_user()
                |> IO.inspect()


    path = create_path(params) |> IO.inspect
    MasteryBackend.Paths.upsert(user, path)

    json conn, path
  end

  def index(conn, _params) do
    {_, user} = conn
                |> verify_cookie()
                |> find_user()

    {_, path} = MasteryBackend.Paths.find(user.id)

    json conn, path
  end

  # this needs fixing
  def create_path(%{"modules" => modules}) do
    lessons = lessons(modules)
    %MasteryBackend.Paths.PersonalPath{todo: lessons, current: nil, done: []}
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
