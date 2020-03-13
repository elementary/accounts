defmodule FlatpakAuth.Schema.User do
  @moduledoc """
  Handles user registration and login information.
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias FlatpakAuth.Repo
  alias FlatpakAuth.Schema.{User, UserToken}

  schema "users" do
    field :email

    field :validated, :boolean, default: false

    has_many :tokens, UserToken

    timestamps()
  end

  @type t :: %User{}

  @fields ~w(
    email
    validated
  )a

  @doc false
  def changeset(%User{} = user, params \\ %{}) do
    user
    |> cast(params, @fields)
    |> validate_required([:email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end

  @doc """
  Gets a user by the email address.
  """
  @spec get(String.t) :: User.t | nil
  def get(email) do
    Repo.get_by(User, email: email)
  end

  @doc """
  Creates a new user with the given email address. This will also return a
  non validated user if they already have an email entered.
  """
  @spec create(String.t) :: User.t | {:error, Changeset.t}
  def create(email) do
    case get(email) do
      %{validated: false} = user -> {:ok, user}
      %{validated: true} -> {:error, :conflict}
      nil -> Repo.insert(changeset(%User{}, %{email: email}))
    end
  end
end
