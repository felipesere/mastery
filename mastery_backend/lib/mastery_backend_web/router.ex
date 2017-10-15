defmodule MasteryBackendWeb.Router do
  use MasteryBackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MasteryBackendWeb do
    pipe_through :api

    get "/lessons", LessonsController, :index
  end
end
