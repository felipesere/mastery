defmodule MasteryBackendWeb.Router do
  use MasteryBackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MasteryBackendWeb do
    pipe_through :api

    get "/lessons", LessonsController, :index
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", MasteryBackendWeb do
    pipe_through :browser

    get "/", UiController, :index
  end
end
