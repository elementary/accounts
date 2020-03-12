use Mix.Config

# Configure your database
config :flatpak_auth, FlatpakAuth.Repo,
  username: "postgres",
  password: "postgres",
  database: "flatpak_auth_test",
  hostname: "postgres",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :flatpak_auth, FlatpakAuthWeb.Endpoint,
  http: [port: 4002],
  server: false

config :flatpak_auth, FlatpakAuth.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn
