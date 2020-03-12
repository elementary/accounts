import Config

config :flatpak_auth,
  ecto_repos: [FlatpakAuth.Repo]

config :flatpak_auth, FlatpakAuthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eRkej+W6rPKRiFkXlm+1V0HTJ/AXbdHPb6JfrtZr3szhtzjQqyvvnykBfVddpBjA",
  render_errors: [view: FlatpakAuthWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FlatpakAuth.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "xs973pg/6PnxIddvm638jsmJA/4vNTFO"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

config :flatpak_auth, FlatpakAuth.Mailer,
  adapter: Swoosh.Adapters.Local,
  mailbox: true

try do
  import_config "#{Mix.env()}.exs"
rescue
  Code.LoadError -> :no_op
end
