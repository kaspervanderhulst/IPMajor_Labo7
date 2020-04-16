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
config :users_auth,
  ecto_repos: [UsersAuth.Repo]

config :users_auth_web,
  ecto_repos: [UsersAuth.Repo],
  generators: [context_app: :users_auth]


config :user_auth_web, UsersAuthWeb.Guardian,
  issuer: "user_auth_web",
  secret_key: "nM7Q0coKP2cKyjMpW732yHC1vgH0//oQX6Br/nKWmt1b6RfKh8erYwzUJ6B3NdQ1"

# Configures the endpoint
config :users_auth_web, UsersAuthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "g0gCEa7NeST+ZZ6It0C0iLQO8zb2EJdtUdDrfiAlo/L8VcchMXbZrbUCBtvvcaZb",
  render_errors: [view: UsersAuthWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: UsersAuthWeb.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "s4gQE7uK"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
