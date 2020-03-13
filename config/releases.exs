# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended.
import Config

config :logger, level: :info

database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

config :flatpak_auth, FlatpakAuth.Repo,
  url: database_url,
  ssl: true,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl_opts: [cacertfile: "/tmp/flatpak-auth/server-ca.pem"]

mandrill_key =
  System.get_env("MANDRILL_KEY") ||
    raise """
    environment variable MANDRILL_KEY is missing.
    Please generate one for email sending
    """

config :flatpak_auth, FlatpakAuth.Mailer,
  adapter: Swoosh.Adapters.Mandrill,
  api_key: mandrill_key

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

domain =
  System.get_env("DOMAIN") ||
    raise """
    environment variable DOMAIN is missing.
    Please set it so email links work correctly
    """

config :flatpak_auth, FlatpakAuthWeb.Endpoint,
  http: [
    port: String.to_integer(System.get_env("PORT") || "80"),
    transport_options: [socket_opts: [:inet6]]
  ],
  secret_key_base: secret_key_base,
  server: true,
  url: [
    host: domain,
    port: String.to_integer(System.get_env("PUBLIC_PORT") || "80")
  ],
  cache_static_manifest: "priv/static/cache_manifest.json"
