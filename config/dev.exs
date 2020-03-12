import Config

config :flatpak_auth, FlatpakAuth.Repo,
  username: "postgres",
  password: "postgres",
  database: "flatpak_auth_dev",
  hostname: "postgres",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :flatpak_auth, FlatpakAuthWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

config :flatpak_auth, FlatpakAuthWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/flatpak_auth_web/(live|views)/.*(ex)$",
      ~r"lib/flatpak_auth_web/templates/.*(eex)$"
    ]
  ]

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime
