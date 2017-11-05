defmodule MasteryBackendWeb.PersonalPathController do
  use MasteryBackendWeb, :controller

  alias MasteryBackend.CreatingAPath.CreatePersonalPath
  alias MasteryBackend.FetchingAPath.FetchingPersonalPath

  action_fallback MasteryBackendWeb.FallbackController

  def create(conn, params) do
    with {:ok, user_id} <- MasteryBackendWeb.Gatekeeper.verify(conn),
         {:ok, path}    <- MasteryBackend.PersonalPath.cast(params),
         {:ok, saved}   <- CreatePersonalPath.execute(user_id, path)
    do
      json conn, saved
    end
  end

  def index(conn, _params) do
    with {:ok, user_id} <- MasteryBackendWeb.Gatekeeper.verify(conn),
         {:ok, path} <- FetchingPersonalPath.execute(user_id)
    do
      json conn, path
    end
  end
end
