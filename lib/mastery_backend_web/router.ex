defmodule MasteryBackendWeb.Router do
  use MasteryBackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MasteryBackendWeb do
    pipe_through :api

    get "/lessons", LessonsController, :index
    get "/path", PersonalPathController, :index
    post "/path", PersonalPathController, :create

    scope "/authorization" do
      get "/login", AuthorizationController, :login
      get "/callback", AuthorizationController, :index
      get "/check", AuthorizationController, :check
    end
  end
end
