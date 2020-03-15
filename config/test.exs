import Config

config :accounts, Accounts.Repo,
  username: "postgres",
  password: "postgres",
  database: "accounts_test",
  pool: Ecto.Adapters.SQL.Sandbox

config :accounts, AccountsWeb.Endpoint,
  http: [port: 4002],
  server: false

config :accounts, Accounts.Mailer, adapter: Swoosh.Adapters.Test

config :logger, level: :warn
