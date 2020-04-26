use Mix.Config

# Configure your database
config :vanderhulst_kasper_ipm_project, VanderhulstKasperIpmProject.Repo,
  username: "root",
  password: "",
  database: "vanderhulst_kasper_ipm_project_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :vanderhulst_kasper_ipm_project_web, VanderhulstKasperIpmProjectWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
