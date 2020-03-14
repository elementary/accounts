defmodule Accounts.Repo do
  @moduledoc """
  Ecto repository for database handling.
  """

  use Ecto.Repo,
    otp_app: :accounts,
    adapter: Ecto.Adapters.Postgres
end
