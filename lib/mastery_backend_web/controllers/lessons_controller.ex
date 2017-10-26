defmodule MasteryBackendWeb.LessonsController do
  use MasteryBackendWeb, :controller

  alias MasteryBackend.FetchingLessons.FetchLessons

  @lessons_file Application.get_env(:mastery_backend, :lessons_file)

  def index(conn, _params) do
    json conn, FetchLessons.execute(@lessons_file)
  end

  def path(conn, params) do
    json conn, FetchLessons.execute(@lessons_file)
  end
end
