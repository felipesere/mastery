defmodule MasteryBackendWeb.PersonalPathController do
  use MasteryBackendWeb, :controller

  alias MasteryBackend.CreatingAPath.CreatePersonalPath
  alias MasteryBackend.FetchingAPath.FetchingPersonalPath

  def create(conn, params) do
    with {:ok, user_id} <- MasteryBackendWeb.Gatekeeper.verify(conn),
         {:ok, path}    <- MasteryBackend.PersonalPath.cast(params),
         {:ok, saved}   <- CreatePersonalPath.execute(user_id, path)
    do
      json conn, saved
    else
      e -> conn |> put_status(400) |> json(e)
    end
  end

  def index(conn, _params) do
    with {:ok, user_id} <- MasteryBackendWeb.Gatekeeper.verify(conn),
         {:ok, path} <- FetchingPersonalPath.execute(user_id)
    do
      json conn, path
    else
      e -> conn |> put_status(400) |> json(e)
    end
  end
end
