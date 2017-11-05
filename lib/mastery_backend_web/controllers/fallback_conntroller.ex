defmodule MasteryBackendWeb.FallbackController do
  use MasteryBackendWeb, :controller

  def call(conn, error) do
    conn
    |> put_status(400)
    |> json(error)
  end
end
