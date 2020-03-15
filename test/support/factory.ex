defmodule Accounts.Factory do
  @moduledoc """
  Factories to create fake database data during tests
  """

  use ExMachina.Ecto, repo: Accounts.Repo

  alias Accounts.Schema

  def user_factory do
    %Schema.User{
      email: sequence(:email, &"email-#{&1}@example.com"),
      validated: true
    }
  end

  def user_token_factory do
    expire_at =
      DateTime.utc_now()
      |> DateTime.add(30 * 60, :second)
      |> DateTime.truncate(:second)

    %Schema.UserToken{
      id: Ecto.UUID.generate(),
      expire_at: expire_at,
      user: build(:user)
    }
  end
end
