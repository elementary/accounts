defmodule Accounts.Schema.UserToken do
  @moduledoc """
  Handles storing user login and verification tokens.
  """

  use Ecto.Schema

  import Ecto.{Changeset, Query}

  alias Accounts.Repo
  alias Accounts.Schema.{User, UserToken}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "user_tokens" do
    field :type, :string

    belongs_to :user, User, type: :id

    field :expire_at, :utc_datetime
    timestamps()
  end

  @type t :: %UserToken{}

  @doc false
  def changeset(login, params \\ %{}) do
    login
    |> cast(params, [:type, :user_id])
    |> validate_required([:type])
    |> validate_inclusion(:type, ["login", "validate"])
    |> assoc_constraint(:user)
    |> set_expire_at()
  end

  defp set_expire_at(changeset) do
    case get_field(changeset, :expire_at) do
      nil -> put_change(changeset, :expire_at, thirty_minutes_from_now())
      _ -> changeset
    end
  end

  defp thirty_minutes_from_now() do
    DateTime.utc_now()
    |> DateTime.add(30 * 60, :second)
    |> DateTime.truncate(:second)
  end

  @doc """
  Creates a new token for the user with the given type.
  """
  @spec create(User.t, String.t) :: {:ok, UserToken.t} | {:error, Changeset.t}
  def create(%User{} = user, type) do
    %UserToken{}
    |> changeset(%{type: type, user_id: user.id})
    |> Repo.insert()
  end

  @doc """
  Fetches a token for a user with the string and type.
  """
  @spec get(String.t) :: UserToken.t | nil
  def get(token) do
    get(token, DateTime.utc_now())
  end

  @spec get(String.t, DateTime.t) :: UserToken.t | nil
  def get(token, datetime) do
    UserToken
    |> where([t], t.id == ^token)
    |> where([t], t.expire_at > ^datetime)
    |> limit(1)
    |> order_by(desc: :inserted_at)
    |> Repo.one()
    |> Repo.preload([:user])
  end

  @doc """
  Removes all the tokens for a user. We use this to clear everything after a
  user successfully validates or logs in.
  """
  @spec remove(User.t) :: :ok
  def remove(%User{} = user) do
    remove(user, DateTime.utc_now())
  end

  @doc """
  Removes all tokens from a user that expired before the given DateTime.
  """
  @spec remove(User.t, DateTime.t) :: :ok
  def remove(%User{} = user, datetime) do
    UserToken
    |> where([t], t.user_id == ^user.id)
    |> where([t], t.expire_at <= ^datetime)
    |> Repo.delete_all()

    :ok
  end
end
