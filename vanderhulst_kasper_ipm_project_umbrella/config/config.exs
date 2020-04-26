# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :vanderhulst_kasper_ipm_project,
  ecto_repos: [VanderhulstKasperIpmProject.Repo]

config :vanderhulst_kasper_ipm_project_web,
  ecto_repos: [VanderhulstKasperIpmProject.Repo],
  generators: [context_app: :vanderhulst_kasper_ipm_project]

# Configures the endpoint
config :vanderhulst_kasper_ipm_project_web, VanderhulstKasperIpmProjectWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Aw3z7ARZ8CVTeh/c4VtXDqyYLtnjsKJQVVeKV6ZinOgYbdhISngI4zPY1x/T7+kk",
  render_errors: [view: VanderhulstKasperIpmProjectWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: VanderhulstKasperIpmProjectWeb.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "mwxIw9vt"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :vanderhulst_kasper_ipm_project_web, VanderhulstKasperIpmProjectWeb.Guardian,
  issuer: "vanderhulst_kasper_ipm_project_web",
  secret_key: "QA2Z2JDYTcYQhR1FYRzLsPLgqT3oBxSAeDm12M/+osARtkln172RwZeMT+/pRSPE"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"


