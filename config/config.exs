# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mastery_backend,
  ecto_repos: [MasteryBackend.Repo]

# Configures the endpoint
config :mastery_backend, MasteryBackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "S6f2M31pc7l87RfghBWzoN1BeP5tAsSc8vg8ISl7oqvBw+WrvqerLOr8oYZjowsi",
  render_errors: [view: MasteryBackendWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: MasteryBackend.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
