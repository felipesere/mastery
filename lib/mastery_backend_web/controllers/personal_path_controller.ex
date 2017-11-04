defmodule MasteryBackendWeb.PersonalPathController do
  use MasteryBackendWeb, :controller

  alias MasteryBackend.CreatingAPath.CreatePersonalPath
  alias MasteryBackend.FetchingAPath.FetchingPersonalPath

  def create(conn, %{"modules" => modules}) do
    with {:ok, user_id} <- MasteryBackendWeb.Gatekeeper.verify(conn),
         {:ok, path} <- CreatePersonalPath.execute(user_id, modules)
    do
      json conn, path
    else
      e -> json conn, e
    end
  end

  def index(conn, _params) do
    with {:ok, user_id} <- MasteryBackendWeb.Gatekeeper.verify(conn),
         {:ok, path} <- FetchingPersonalPath.execute(user_id)
    do
      json conn, path
    else
      e -> json conn, e
    end
  end
end
