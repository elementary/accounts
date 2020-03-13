defmodule FlatpakAuth.Repo do
  @moduledoc """
  Ecto repository for database handling.
  """

  use Ecto.Repo,
    otp_app: :flatpak_auth,
    adapter: Ecto.Adapters.Postgres
end
