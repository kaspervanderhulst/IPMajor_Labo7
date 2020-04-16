use Mix.Config

# Configure your database
config :users_auth, UsersAuth.Repo,
  username: "root",
  password: "",
  database: "users_auth_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :users_auth_web, UsersAuthWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
