defmodule MasteryBackendWeb.PersonalPathController do
  use MasteryBackendWeb, :controller

  alias MasteryBackend.CreatingAPath.CreatePersonalPath

  def create(conn, %{"modules" => modules}) do
    {:ok, path} = CreatePersonalPath.execute(modules)

    json conn, path
  end
end
