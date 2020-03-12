defmodule FlatpakAuth.Schema.User do
  @moduledoc """
  Handles user registration and login information.
  """

  use Ecto.Schema

  import Ecto.Changeset

  schema "users" do
    field :email

    field :validation_code
    field :validation_complete, :boolean, default: false

    timestamps()
  end

  @fields ~w(
    email
    validation_code
    validation_complete
  )a

  @doc false
  def changeset(user, params \\ %{}) do
    user
    |> cast(params, @fields)
    |> validate_required([:email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> unique_constraint(:validation_code)
  end

  @doc """
  Generates a new validation code and sets it in the changeset.
  """
  def set_validation_code(changeset) do
    code =
      :sha256
      |> :crypto.hash(:crypto.strong_rand_bytes(64))
      |> Base.encode16()

    put_change(changeset, :validation_code, code)
  end

  def validate_changeset(user) do
    changeset(user, %{validation_code: nil, validation_complete: true})
  end
end
