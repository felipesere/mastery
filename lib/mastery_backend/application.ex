defmodule MasteryBackend.Application do
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(MasteryBackend.Repo, []),
      # Start the endpoint when the application starts
      supervisor(MasteryBackendWeb.Endpoint, []),
      supervisor(MasteryBackend.Users, []),
      supervisor(MasteryBackend.Secure, []),
      github_client()
      # Start your own worker by calling: MasteryBackend.Worker.start_link(arg1, arg2, arg3)
      # worker(MasteryBackend.Worker, [arg1, arg2, arg3]),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MasteryBackend.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def github_client() do
    import Supervisor.Spec

    Application.get_env(:mastery_backend, :github)
    |> Keyword.get(:module)
    |> supervisor([])
  end


  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MasteryBackendWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
