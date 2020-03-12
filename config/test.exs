import Config

config :flatpak_auth, FlatpakAuth.Repo,
  username: "postgres",
  password: "postgres",
  database: "flatpak_auth_test",
  hostname: "postgres",
  pool: Ecto.Adapters.SQL.Sandbox

config :flatpak_auth, FlatpakAuthWeb.Endpoint,
  http: [port: 4002],
  server: false

config :flatpak_auth, FlatpakAuth.Mailer, adapter: Swoosh.Adapters.Test

config :logger, level: :warn
