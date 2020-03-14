import Config

config :accounts,
  ecto_repos: [Accounts.Repo]

config :accounts, AccountsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eRkej+W6rPKRiFkXlm+1V0HTJ/AXbdHPb6JfrtZr3szhtzjQqyvvnykBfVddpBjA",
  render_errors: [view: AccountsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Accounts.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "xs973pg/6PnxIddvm638jsmJA/4vNTFO"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

config :accounts, Accounts.Mailer,
  adapter: Swoosh.Adapters.Local,
  mailbox: true

try do
  import_config "#{Mix.env()}.exs"
rescue
  Code.LoadError -> :no_op
end
