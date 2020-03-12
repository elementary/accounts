# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :flatpak_auth,
  ecto_repos: [FlatpakAuth.Repo]

# Configures the endpoint
config :flatpak_auth, FlatpakAuthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eRkej+W6rPKRiFkXlm+1V0HTJ/AXbdHPb6JfrtZr3szhtzjQqyvvnykBfVddpBjA",
  render_errors: [view: FlatpakAuthWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FlatpakAuth.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "xs973pg/6PnxIddvm638jsmJA/4vNTFO"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :flatpak_auth, FlatpakAuth.Mailer,
  adapter: Swoosh.Adapters.Local,
  mailbox: true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
