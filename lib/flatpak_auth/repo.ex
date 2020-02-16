defmodule FlatpakAuth.Repo do
  use Ecto.Repo,
    otp_app: :flatpak_auth,
    adapter: Ecto.Adapters.Postgres
end
