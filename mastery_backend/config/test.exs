use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :mastery_backend, MasteryBackendWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :mastery_backend, :lessons_file, "test/data/sample_lessons.json"

# Configure your database
config :mastery_backend, MasteryBackend.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "mastery_backend_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
